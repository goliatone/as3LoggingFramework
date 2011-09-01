package com.enjoymondays.logging.core {
	
	/**
	 * ILoggerFormatter.
	 *
	 *	@langversion ActionScript 3.0
	 *	@Flash 		 Player 9.0.28.0
	 *	@author 	 Emiliano Burgos 
	 *	@url		 http://www.enjoy-mondays.com
	 * @version 	 1.0
	 */
	public interface ILoggerFormatter {
		
		/**
		 * 
		 * @param	message
		 * @return
		 */
		function format( message:ILogMessage ):String;
		
		/**
		 * 
		 * @param	...patterns
		 */
		function setLevelPatterns( ...patterns ):void;
		
		/**
		 * 
		 * @param	level
		 * @return
		 */
		function getPatternFor( level:String ):String;
		
		
		/**
		 * 
		 * @param	level
		 * @return
		 */
		function isStackNeeded( level:String ):Boolean;
		
		/**
		 * 
		 */
		function get defaultPattern():String;
		/** @private **/
		function set defaultPattern(value:String):void;
	}
	
}