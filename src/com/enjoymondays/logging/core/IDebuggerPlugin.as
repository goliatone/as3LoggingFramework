package com.enjoymondays.logging.core {
	
	/**
	 * IDebuggerPlugin.
	 *
	 *	@langversion ActionScript 3.0
	 *	@Flash 		 Player 9.0.28.0
	 *	@author 	 Emiliano Burgos 
	 *	@url		 http://www.enjoy-mondays.com
	 * @version 	 1.0
	 */
	public interface IDebuggerPlugin {
		
		/**
		 * 
		 * @param	logger
		 */
		function setLogger( logger:ILogger ):void;
	}
	
}