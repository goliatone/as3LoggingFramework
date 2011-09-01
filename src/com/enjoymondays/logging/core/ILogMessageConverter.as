package com.enjoymondays.logging.core {
	
	/**
	 * ILogMessageConverter.
	 *
	 *	@langversion ActionScript 3.0
	 *	@Flash 		 Player 9.0.28.0
	 *	@author 	 Emiliano Burgos 
	 *	@url		 http://www.enjoy-mondays.com
	 *  @version 	 1.0
	 */
	public interface ILogMessageConverter {
		
		/**
		 * 
		 * @param	message
		 * @return
		 */
		function convert( message:ILogMessage ):String;
		
		/**
		 * Any options that we set in the pattern
		 */
		function get options( ):*;
		
		/** @private **/
		function set options( value:* ):void;
		
		/**
		 * 
		 */
		function get id( ):String;
	}
	
}