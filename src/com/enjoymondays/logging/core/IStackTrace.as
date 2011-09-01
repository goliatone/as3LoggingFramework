package com.enjoymondays.logging.core {
	
	/**
	 * IStackTrace.
	 *
	 *	@langversion ActionScript 3.0
	 *	@Flash 		 Player 9.0.28.0
	 *	@author 	 Emiliano Burgos 
	 *	@url		 http://www.paginaswebflash.com
	 * @version 	 1.0
	 */
	public interface IStackTrace {
		
		/**
		 * 
		 */
		function get methodName():String;
		/** @private **/
		function set methodName(value:String):void;
		
		/**
		 * 
		 */
		function get className():String;
		/** @private **/
		function set className(value:String):void;
		
		/**
		 * 
		 */
		function get line():String;
		/** @private **/
		function set line(value:String):void;
		
		/**
		 * 
		 */
		function get file():String;
		/** @private **/
		function set file(value:String):void;
		
		/**
		 * 
		 */
		function get raw():String;
		/** @private **/
		function set raw(value:String):void;
		
		/**
		 * 
		 * @return
		 */
		function toString( ):String;
	}
	
}