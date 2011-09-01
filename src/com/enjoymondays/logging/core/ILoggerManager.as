package com.enjoymondays.logging.core {
	
	/**
	 * ILoggerManager.
	 *
	 *	@langversion ActionScript 3.0
	 *	@Flash 		 Player 9.0.28.0
	 *	@author 	 Emiliano Burgos 
	 *	@url		 http://www.enjoy-mondays.com
	 * @version 	 1.0
	 */
	public interface ILoggerManager {
		
		/**
		 * 
		 * @param	debugger
		 */
		function setDebugger( debugger:Class ):void;
		
		/**
		 * 
		 * @param	classType
		 */
		function setLogger( logger:Class ):void;
		
		/**
		 * 
		 * @param	classType
		 */
		function removeLogger( classType:* ):void;
		
		/**
		 * REVISION Add support for *
		 * @param	...packages
		 */
		function disablePackages( ...packages ):void;
		
		/**
		 * 
		 * @param	pk
		 * @param	level
		 * @param	extrict
		 */
		function addLevelFilter( pk:String, level:ILogLevel, extrict:Boolean = false ):void;
		
		/**
		 * 
		 * @param	threshold
		 */
		function setGlobalThreshold( threshold:*/*ILogLevel*/ ):void;
		
		
		/**
		 *
		 * @param	...levels
		 */
		function disableLevels( ...levels ):void;
		
		/**
		 *
		 * @param	...levels
		 */
		function enableLevels( ...levels ):void;
		
		/**
		 * Factory method to create loggers. We use call it from <code>Logger.instance</code>
		 *
		 * @param	classType
		 * @return Logger
		 * @see com.enjoymondays.logging.loggers.Logger#create( )
		 *
		 * @internal
		 */
		function getLogger( classType:* ):ILogger;
		
		/**
		 * 
		 * @param	publisher
		 * @param	formater
		 */
		function addPublisher( publisher:ILoggerPublisher, formater:ILoggerFormatter ):void;
		
		/**
		 *
		 * @param	logger
		 * @internal
		 */
		function makeActiveLogger( logger:ILogger = null ):void;
		
		/**
		 * 
		 * @param	name
		 * @param	loggerPackage
		 * @param	level
		 * @return
		 */
		function loggerDisabled( name:String, loggerPackage:String, level:ILogLevel ):Boolean
		
		
	}
	
}