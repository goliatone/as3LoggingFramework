package com.enjoymondays.logging.loggers {
	
	
	import com.enjoymondays.logging.core.IDebugger;
	import com.enjoymondays.logging.core.ILoggerManager;
	import com.enjoymondays.logging.core.ILogger;
	import com.enjoymondays.logging.core.LogLevel;
	import com.enjoymondays.logging.core.LogMessage;
	import com.enjoymondays.logging.core.ILoggerFormatter;
	import com.enjoymondays.logging.core.ILoggerPublisher;
	import com.enjoymondays.utils.fixArguments;
	
	import com.enjoymondays.logging.publishers.CompoundPublisher;
	
	import com.enjoymondays.logging.plugins.StackTrace;
	
	
	import flash.utils.getTimer;
	
	/**
	 * REVISION Add dumper property.
	 *
	 * <code>DefaultLogger</code>.
	 *
	 *	@langversion ActionScript 3.0
	 *	@Flash 		 Player 9.0.28.0
	 *	@author 	 Emiliano Burgos
	 *	@url		 http://www.enjoy-mondays.com
	 *  @version 	 1.0
	 */
	public class DefaultLogger implements ILogger {
		
		
		static private var _manager					:ILoggerManager;
		
		static private const EMPTY					:String = LogMessage.EMPTY;
		
		
		/** @private **/
		private var _name							:String;
		
		/** @private **/
		private var _record							:LogMessage;
		
		/** @private **/
		private var _stackTrace						:StackTrace;
		
		/** @private **/
		private var _publishers						:CompoundPublisher;
		
		
		/** @private **/
		private var _debugger						:IDebugger;
		
		/** @private **/
		protected var _stackDepth					:int = 4;
		
		/** @private **/
		protected var _package						:String;
		
		
		/**
		 * <code>DefaultLogger</code>.
		 * com.enjoymondays.logging.loggers.DefaultLogger
		 */
		public function DefaultLogger( name:String ) {
			_name = name;
			_publishers = new CompoundPublisher;
			_record = new LogMessage( );
			_record.logger = name;
		}
		
		/**
		* Retrieves a logger for the specified class. If classType is a string, that
		* string is used as the class name, regardless of what it is. For any other
		* object, the class type of that object is used. Most commonly, a Class object
		* is passed in.
		*
		* <p>Although this shouldn't happen, if this is called multiple times for the
		* same classType, the same logger will be returned rather than creating a new
		* one.
		* </p>
		*/
		public static function instance( classType:* ):ILogger {
			return _manager.getLogger( classType );
		}
		
		/**
		 * This exists so the LoggerManager can create Loggers, but nothing outside can.
		 *
		 * @param	name
		 * @return	ILogger
		 * @internal
		 */
		public static function create( name:String ):ILogger {
			return new DefaultLogger( name );
		}
		
		/**
		 *
		 * @param	manager
		 */
		public function setManager( manager:ILoggerManager ):void {
			_manager = manager;
		}
		
		/**
		 *
		 * @param	debugger
		 */
		public function setDebugger( debugger:IDebugger ):void {
			_debugger = debugger;
			_debugger.setLogger( this );
		}
		
		/**
		 *
		 * @param	publisher
		 * @param	formater
		 */
		public function addPublisher( publisher:ILoggerPublisher, formater:ILoggerFormatter ):void {
			_publishers.add( publisher, formater );
		}
		
		/**
		 *
		 * @param	publisher
		 */
		public function removePublisher( publisher:ILoggerPublisher ):void {
			_publishers.remove( publisher );
		}
		
		/**
		 * If we pass true we force to only use this logger instance, so the only output would be the generated
		 * by this logger.
		 * If we pass false, we restore normal behaviour.
		 *
		 * @param	active
		 */
		public function makeActiveLogger( active:Boolean = true ):void {
			var logger:ILogger = active ? this : null;
			_manager.makeActiveLogger( logger );
		}
		
		/**
		 * @inheritDoc
		 */
		public function get manager():ILoggerManager { return _manager; }
		
		/**
		 * @inheritDoc
		 */
		public function get debugger( ):IDebugger { return _debugger; }
		
		/**
		 * @inheritDoc
		 */
		public function get packagePath( ):String { return _package; }
		
		/**
		 * @inheritDoc
		 */
		public function get name( ):String { return _name; }
		
		/**
		 *
		 * @param	p
		 * @internal
		 */
		public function setPackage( p:String ):void {
			_package = p;
		}
		
		
		
/////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////
		/**
		 * @inheritDoc
		 */
		public function trace( message:*, ...parameters:Array ):void {
			log( LogLevel.LOG, message, parameters );
		}
		
		/**
		 * @inheritDoc
		 */
		public function debug(message:*, ...parameters:Array):void {
			log( LogLevel.DEBUG, message, parameters );
		}
		
		/**
		 * @inheritDoc
		 */
		public function info(message:*, ...parameters:Array):void{
			log( LogLevel.INFO, message, parameters );
		}
		
		/**
		 * @inheritDoc
		 */
		public function warn( message:*, ...parameters:Array ):void {
			log( LogLevel.WARN, message, parameters );
		}
		
		/**
		 * @inheritDoc
		 */
		public function error( message:*, ...parameters:Array ):void {
			log( LogLevel.ERROR, message, parameters );
		}
		
		/**
		 * @inheritDoc
		 */
		public function fatal( message:*, ...parameters:Array ):void {
			log( LogLevel.FATAL, message, parameters );
		}
		
		/**
		 * @inheritDoc
		 */
		public function log( level:LogLevel, message:*, ...parameters:Array ):void {
			
			if ( _disabled( level ) ) return;
			
			//build message log:
			_stackTrace = StackTrace.getStackTrace(  );
			
			_record.level = level;
			_record.stackTrace = _stackTrace;
			_record.timestamp = getTimer().toString( );
			_record.message = EMPTY;
			
			if ( message is String ) {
				
				if ( parameters.length > 0 ) _record.message = _substitute( message as String, parameters );
				else _record.message = message as String;
				
			} else {
				_record.object = message;
				_record.message = _debugger.dump( message );
			}
			
			//send message to publishers:
			_publishers.log( _record );
		}
		
/////////////////////////////////////////////////////////////////////////////////////////////
		
		
/////////////////////////////////////////////////////////////////////////////////////////////
		
		/**
		 * @inheritDoc
		 */
		public function clear( ):void {
			_publishers.clear( );
		}
		
		/**
		 * @inheritDoc
		 */
		public function delimiter( ):void {
			_publishers.delimiter( );
		}
		
		/**
		 *
		 * @param	level
		 * @return
		 */
		protected function _disabled( level:LogLevel ):Boolean {
			if ( ! _manager ) return false;
			else return _manager.loggerDisabled( name, packagePath, level );
		}
		
		/**
		 *
		 * @param	message
		 * @param	parameters
		 * @return
		 */
		protected function _substitute(message:String, parameters:Array ):String {
			var args:Array =  fixArguments( parameters );
			
			var len:uint = args.length;
			
			//FIX
			//We should fix this, to make it more easy. Add complex stuff.
			var p:Array = [], e:Object, i:int;
	        for ( i = 0; i < len; i++) {
				e = args[i];
				if ( e is String ) p[i] = e;
				else p[i] = e ? e.toString( ) : "null";
			}
			
			//
	        for ( i = 0; i < len; i++) message = message.replace( new RegExp("\%" + i , "g"), p[i] );
			
			return message;
		}
		
	}
}