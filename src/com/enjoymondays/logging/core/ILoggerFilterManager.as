package com.enjoymondays.logging.core {
	
	/**
	 * ILoggerFilterManager.
	 *
	 *	@langversion ActionScript 3.0
	 *	@Flash 		 Player 9.0.28.0
	 *	@author 	 Emiliano Burgos
	 *	@url		 http://www.enjoy-mondays.com
	 * @version 	 1.0
	 */
	public interface ILoggerFilterManager {
		
		
		/**
		 *
		 * @param	pk
		 * @param	level
		 * @return
		 */
		function isFiltered( pk:String, level:ILogLevel ):Boolean;
		
		
		/**
		 *
		 * @param	name
		 * @return
		 */
		function getLogFilterFor( name:String ):ILoggerFilter;
		
		/**
		 *
		 * @param	pk
		 * @param	level
		 * @param	extrict
		 */
		function addLogFilter( pk:String, level:ILogLevel, extrict:Boolean = false ):void;
		
		/**
		 *
		 * @param	pk
		 * @param	level
		 */
		function update( pk:String, level:ILogLevel ):void;
		
		/**
		 *
		 * @param	pk
		 * @return
		 */
		function contains( pk:String ):Boolean;
	}
	
}