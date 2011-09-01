package com.enjoymondays.logging.managers {
	
	import com.enjoymondays.logging.core.IDebugger;
	import com.enjoymondays.logging.core.ILogger;
	import com.enjoymondays.logging.core.ILoggerFilterManager;
	import com.enjoymondays.logging.core.ILoggerFormatter;
	import com.enjoymondays.logging.core.ILoggerManager;
	import com.enjoymondays.logging.core.ILoggerPublisher;
	import com.enjoymondays.logging.core.ILogLevel;
	import com.enjoymondays.logging.core.LogLevel;
	import com.enjoymondays.logging.debuggers.NullDebugger;
	import com.enjoymondays.logging.filters.LoggerFilterManager;
	import com.enjoymondays.logging.loggers.NullLogger;
	import com.enjoymondays.utils.fixArguments;
	import com.enjoymondays.logging.vos.PublisherVO;
	import flash.utils.Dictionary;
	import flash.utils.getQualifiedClassName;
	
	
	/**
	 * <code>LoggerManager</code>.
	 *
	 *	@langversion ActionScript 3.0
	 *	@Flash 		 Player 9.0.28.0
	 *	@author 	 Emiliano Burgos
	 * 	@url		 http://www.enjoy-mondays.com
	 *  @version 	 1.0
	 */
	public class LoggerManager implements ILoggerManager {
		
		/** @private **/
		protected var _loggers						:Dictionary = new Dictionary( );
		
		/** @private **/
		protected var _disbledLevels				:Array = new Array;
		
		/** @private **/
		protected var _activeLogger					:ILogger;
		
		/** @private **/
		protected var _filters						:ILoggerFilterManager;
		
		/** @private **/
		protected var _banned						:Dictionary;
		
		/** @private **/
		protected var _publishers					:Array = new Array;
		
		/** @private **/
		protected var _threshold					:ILogLevel = LogLevel.ALL;
		
		/** @private **/
		protected var _DEBUGGER						:Class = NullDebugger;
		
		/** @private **/
		protected var _LOGGER						:Class = NullLogger;
		
		
		
		/**
		 * <code>LoggerManager</code>.
		 * com.enjoymondays.logging.managers.LoggerManager
		 */
		public function LoggerManager( ) {
			
		}
		
		/**
		 * @inheritDoc
		 */
		public function setDebugger( debugger:Class ):void {
			_DEBUGGER = debugger;
		}
		
		/**
		 * @inheritDoc
		 */
		public function setLogger( logger:Class ):void {
			_LOGGER = logger;
		}
		
		/**
		 * @inheritDoc
		 */
		public function setGlobalThreshold( threshold:* ):void {
			if ( threshold is String ) threshold = LogLevel[ String(threshold).toUpperCase() ];
			_threshold = threshold as ILogLevel;
		}
		
		
		/**
		 * @inheritDoc
		 */
		public function addPublisher( publisher:ILoggerPublisher, formater:ILoggerFormatter ):void {
			_publishers.push( new PublisherVO( publisher, formater ) );
		}
		
		/**
		 * REVISION Add support for *
		 * @inheritDoc
		 */
		public function disablePackages( ...packages ):void {
			packages = fixArguments( packages );
			
			var off:LogLevel = LogLevel.OFF;
			for each( var pack:String in packages ) {
				if ( filters.contains( pack ) ) filters.update( pack, off );
				else filters.addLogFilter( pack, off );
			}
		}
		
		/**
		 * @inheritDoc
		 */
		public function addLevelFilter( pk:String, level:ILogLevel, extrict:Boolean = false ):void {
			filters.addLogFilter( pk, level, extrict );
		}
		
		/**
		 * @inheritDoc
		 */
		public function disableLevels( ...levels ):void {
			levels = fixArguments( levels );
			
			var level:LogLevel;
			for each( level in levels )
				_disbledLevels.push( LogLevel[ level ] );//We access the static const on LogLevel
		}
		
		/**
		 * @inheritDoc
		 */
		public function enableLevels( ...levels ):void {
			levels = fixArguments( levels );
			
			var index:int, level:LogLevel;
			for each( level in levels ) {
				index = _disbledLevels.indexOf( level );
				if ( index != -1 ) _disbledLevels.splice(index, 1 );
			}
		}
		
		/**
		 * Factory method to create loggers.
		 *
		 * @param	classType
		 * @return 	ILogger
		 * @see com.enjoymondays.logging.loggers.DefaultLogger#create( )
		 *
		 * @internal
		 */
		public function getLogger( classType:* ):ILogger {
			if (classType == null) {
				/* WHEN BULDING SWC IT DOES NOT WORK
				CONFIG::debug  {
					throw new Error( "Unable to create a logger with a null class type." );
				}
				*/
				return null;
            }
			
			/* if a string is passed, treat it as the class name,
			 * otherwise get the class name of the object
			 * that was passed in
			 */
			var QCN:String = _getLoggerName( classType );
			
			//pull from cache or create/store/return
			return _loggers[ QCN ] ||= _createLogger(QCN);
			
			// don't recreate if it already exists
			/*if ( _loggers[ QCN ] == null) _loggers[ QCN ] = _createLogger( QCN );
			
			return _loggers[ QCN ];*/
		}
		
		/**
		 * @inheritDoc
		 */
		public function removeLogger( classType:* ):void {
			var QCN:String = _getLoggerName( classType );
			var l:ILogger = _loggers[ QCN ];
			if ( !l ) return;
			//l.destroy( );
			delete _loggers[QCN];
		}
		
		/**
		 *
		 * @param	classType
		 * @return
		 * @private
		 */
		protected function _getLoggerName( classType:* ):String {
			var QCN:String;
			if ( classType is String ) {
				if (classType == "") {
					/*
					CONFIG::debug{ throw new Error("Unable to create a logger with an empty class type."); }
					return null;
					*/
				}
                QCN = classType;
			} else QCN = _getClassName( classType );
			
			return QCN;
		}
		
		/**
		 * Gets the class name of either a Class object or an instance.
		 * @param	c
		 * @return
		 */
		protected function _getClassName( c:Object ):String {
			var QCN:String = getQualifiedClassName( c ).replace( '::','.');
			return QCN;
		}
		
		/**
		 * TODO We need to get rid of DefaultLogger.create
		 *
		 *
		 * REVISION Here we should initialize our logger with information such as
		 * which targets are enabled...
		 * @param	QCN The Qualified Class Name.
		 * @return
		 * @private
		 */
		protected function _createLogger( QCN:String ):ILogger {
			var logger:ILogger = new _LOGGER(QCN);
			
			var pack:String = _getLoggerPackage( QCN );
			
			var debugger:IDebugger = new _DEBUGGER;
			
			logger.setManager( this );
			logger.setDebugger( debugger );
			logger.setPackage( pack );
			
			for each( var vo:PublisherVO in _publishers ) logger.addPublisher( vo.publisher, vo.formater );
			
			return logger;
		}
		
		/**
		 *
		 * @param	QCN The Qualified Class Name.
		 * @return
		 */
		protected function _getLoggerPackage( QCN:String ):String {
			/*
			 * We split all package levels, remove the class name, and rejoin.
			 * If we pass a class without a package, return an empty string.
			 */
			var p:String = QCN.split('.').slice(0, -1).join('.');
			return p || '';
		}
		
		/**
		 * We want to have a logger instance inside LoggerFilter, to do that we have
		 * to delay the creation of ILoggerFilterManager, otherways we get a stackoverflow.
		 * @private
		 */
		protected function get filters( ):ILoggerFilterManager { return _filters ||= new LoggerFilterManager; }
		
		/**
		 * Determines wheter the logger calling this method is enabled or not.
		 * We can use global methods to determine loggin flow here.
		 *
		 * @param	name
		 * @param	loggerPackage
		 * @param	level
		 * @return	Boolean
		 */
		public function loggerDisabled( name:String, loggerPackage:String, level:ILogLevel ):Boolean {
			/*
			 * If we have an active logger and it is not the callee, disable.
			 */
			if ( _activeLogger && _activeLogger.name != name ) return true;
			
			/*
			 * If level is disabled for logger's package, disable.
			 */
			if ( filters.isFiltered( loggerPackage, level ) ) return true;
			
			/*
			 * If level is disabled globally, disable.
			 */
			if ( _disbledLevels.indexOf( level ) != -1 ) return true;
			
			/*
			 * If level is below logging threshold, disable.
			 */
			if ( _threshold.filters( level ) ) return true;
			
			/*
			 * If we got there, we should let it be.
			 */
			return false;
		}
		
		/**
		 *
		 * @param	logger
		 * @internal
		 */
		public function makeActiveLogger( logger:ILogger = null ):void {
			_activeLogger = logger;
		}
		
		/**
		 *
		 */
		public function get globalThreshold( ):ILogLevel { return _threshold; }
	}
	
}