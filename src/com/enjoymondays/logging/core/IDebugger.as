package com.enjoymondays.logging.core {
	
	
	/**
	 * IDebugger.
	 *
	 *	@langversion ActionScript 3.0
	 *	@Flash 		 Player 9.0.28.0
	 *	@author 	 Emiliano Burgos 
	 *	@url		 http://www.enjoy-mondays.com
	 * @version 	 1.0
	 */
	public interface IDebugger extends IDebuggerPlugin {
		
		/**
		 * 
		 * @param	title
		 */
		function startStopwatch( title:String ):void;
		
		/**
		 * 
		 */
		function stopStopwatch( ):void;
		
		/**
		 * @inheritDoc
		 */
		function logGarbageCollection( obj : * , id : String = null ):void;
		
		/**
		 * 
		 */
		function collectGarbage( ):void;
		
		
		/**
		 * 
		 * @param	o
		 * @param	...args
		 * @return
		 */
		function classToString( o:*, ...args ):void;
		
		/**
		 * 
		 * @param	o
		 * @param	indent
		 * @return
		 */
		function print( o:*, indent:String = "" ):void;
		
		/**
		 * 
		 * @param	o
		 * @param	indent
		 * @return
		 */
		function dump( o:*, indent:String = "" ):String;
	}
	
}