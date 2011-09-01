package com.enjoymondays.logging.core {
	
	/**
	 * ILogMessage.
	 *
	 *	@langversion ActionScript 3.0
	 *	@Flash 		 Player 9.0.28.0
	 *	@author 	 Emiliano Burgos
	 *	@url		 http://www.enjoy-mondays.com
	 * @version 	 1.0
	 */
	public interface ILogMessage {
		
		/**
		 *
		 */
		function set logger( logger:String ):void
		
		/**
		 *
		 */
		function get logger( ):String
		
		/**
		 *
		 */
		function set message( message:String ):void
		
		/**
		 *
		 */
		function get message( ):String
		
		/**
		 *
		 */
		function set level( l:LogLevel ):void
		
		/**
		 *
		 */
		function get level( ):LogLevel
		
		/**
		 *
		 */
		function set timestamp( t:String ):void
		
		/**
		 *
		 */
		function get timestamp( ):String
		
		/**
		 *
		 */
		function set object( m:Object ):void
		
		/**
		 *
		 */
		function get object( ):Object
		
		/**
		 *
		 */
		function get line( ):String
		
		/**
		 *
		 */
		function get methodName( ):String
		
		/**
		 *
		 */
		function get className( ):String
		
		/**
		 *
		 */
		function get stackTrace( ):IStackTrace;
		
		/**
		 *
		 */
		function set stackTrace( v:IStackTrace ):void;
		
		/**
		 * 
		 */
		function get file( ):String
		
		function clone( ):ILogMessage;
	}
}