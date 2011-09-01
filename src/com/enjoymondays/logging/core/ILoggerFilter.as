package com.enjoymondays.logging.core {
	
	/**
	 * ILoggerFilter.
	 *
	 *	@langversion ActionScript 3.0
	 *	@Flash 		 Player 9.0.28.0
	 *	@author 	 Emiliano Burgos
	 *	@url		 http://www.enjoy-mondays.com
	 * @version 	 1.0
	 */
	public interface ILoggerFilter {
		
		
		/**
		 *
		 */
		function get parent( ):ILoggerFilter;
		
		/**
		 *
		 * @param	logger
		 * @param	level
		 * @return
		 */
		function filter( level:ILogLevel ):Boolean;
		
		/**
		 *
		 */
		function get priority( ):int;
		
		
		function setLevel( l:ILogLevel, lock:ILoggerFilterManager ):void;
		
		function get level( ):ILogLevel;
		
		function get filterPackage( ):String;
		
		/**
		 *
		 * @return
		 */
		function toString( ):String;
	}
	
}