package com.enjoymondays.logging.core {
	
	/**
	 * <code>LogMessage</code>.
	 *
	 *	@langversion ActionScript 3.0
	 *	@Flash 		 Player 9.0.28.0
	 *	@author 	 Emiliano Burgos
	 *	@url		 http://www.enjoy-mondays.com
	 * @version 	 1.0
	 */
	public class LogMessage implements ILogMessage {
		
		public static const EMPTY				:String = "empty";
		
		
		private var _level 						:LogLevel;
		private var _stackTrace					:IStackTrace;
		private var _logger						:String;
		private var _message 					:String;
		private var _timestamp 					:String;
		
		private var _object 					:Object;
		
		/**
		 * <code>LogMessage</code>.
		 * com.enjoymondays.logging.core.LogMessage
		 *
		 * @param	level
		 * @param	message
		 * @param	time
		 * @param	stackTrace
		 * @param	object
		 */
		public function LogMessage( level:LogLevel = null, message:String = null, time:String = null, stackTrace:IStackTrace = null, object:Object = null ) {
			if( level ) _level = level;
			if ( stackTrace ) _stackTrace = stackTrace;
			if( message ) _message = message;
			if( time ) _timestamp = time;
			if( object ) _object = object;
		}
		
		/**
		 * @inheritDoc
		 */
		public function clone( ):ILogMessage {
			var clone:LogMessage = new LogMessage( level, message, timestamp, stackTrace, object );
			clone.logger = logger;
			
			return clone;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get logger( ):String { return _logger; }		
		/** @private **/
		public function set logger( logger:String ):void {
			_logger = logger;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get message( ):String { return _message; }
		/** @private **/
		public function set message( message:String ):void {
			_message = message;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get level( ):LogLevel { return _level; }
		/** @private **/
		public function set level( l:LogLevel ):void {
			_level = l;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get timestamp( ):String { return _timestamp; }
		/** @private **/
		public function set timestamp( t:String ):void {
			_timestamp = t;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get object( ):Object { return _object; }
		/** @private **/
		public function set object( m:Object ):void {
			_object = m;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get stackTrace( ):IStackTrace { return _stackTrace; }
		/** @private **/
		public function set stackTrace( v:IStackTrace ):void {
			_stackTrace = v;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get line( ):String { return _stackTrace.line; }
		
		/**
		 * @inheritDoc
		 */
		public function get methodName( ):String { return _stackTrace.methodName; }
		
		/**
		 * @inheritDoc
		 */
		public function get className( ):String { return _stackTrace.className; }
		
		/**
		 * @inheritDoc
		 */
		public function get file( ):String { return _stackTrace.file }
		
		
	}
}