package com.enjoymondays.logging.core {
	
	
	/**
	 * ILogger.
	 * REVISION If we implement asynchronous loggin, add destroy method.
	 * REVISION Maybe we want to change level:LogLevel to level:int at #log()
	 *
	 * @langversion ActionScript 3.0
	 * @Flash 		 Player 9.0.28.0
	 * @author 	 Emiliano Burgos
	 * @url		 http://www.enjoy-mondays.com
	 * @version 	 1.0
	 */
	public interface ILogger {
		
		/**
		 *
		 * @param	manager
		 */
		function setManager( manager:ILoggerManager ):void;
		
		/**
		 *
		 * @param	debugger
		 */
		function setDebugger( debugger:IDebugger ):void;
		
		/**
		 *
		 * @param	pack
		 * @internal
		 */
		function setPackage( pack:String ):void;
		
		/**
		 *
		 * @param	publisher
		 * @param	formater
		 */
		function addPublisher( publisher:ILoggerPublisher, formater:ILoggerFormatter ):void;
		
		/**
		 *
		 * @param	publisher
		 */
		function removePublisher( publisher:ILoggerPublisher ):void;
		
		/**
		 *
		 */
		function get manager( ):ILoggerManager;
		
		/**
		 *
		 */
		function get debugger( ):IDebugger;
		
		
		/**
		 *
		 */
		function get packagePath( ):String;
		
		/**
		 *
		 */
		function get name( ):String;
		
		/**
		* Outputs a log message at the specified log level.
		*
		* @param	level	The level to output the message at.
		* @param	message	The message to print. This can include '{n}' markers as replacement locations
		* for subsequent parameters. For instance, '{0}' would be replaced by the first additional
		* parameter passed to the method, and '{4}' would be replaced by the fourth.
		*/
		function log( level:LogLevel, message:*, ...parameters:Array ):void;
		
		/**
		 *
		 * @param	message
		 * @param	...parameters
		 */
		function trace( message:*, ...parameters:Array ):void;
		
		/**
		 *
		 * @param	message
		 * @param	...parameters
		 */
		function debug( message:*, ...parameters:Array ):void;
		
		/**
		 *
		 * @param	message
		 * @param	...parameters
		 */
		function info( message:*, ...parameters:Array ):void;
		
		/**
		 *
		 * @param	message
		 * @param	...parameters
		 */
		function warn( message:*, ...parameters:Array ):void;
		
		/**
		 *
		 * @param	message
		 * @param	...parameters
		 */
		function error( message:*, ...parameters:Array ):void;
		
		/**
		 *
		 * @param	message
		 * @param	...parameters
		 */
		function fatal( message:*, ...parameters:Array ):void;
		
		/**
		 *
		 */
		function clear( ):void;
		
		/**
		 *
		 */
		function delimiter( ):void;
		
		
	}
	
}