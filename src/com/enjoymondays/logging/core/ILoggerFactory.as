package com.enjoymondays.logging.core {
	
	/**
	 * ILoggerFactory.
	 *
	 *	@langversion ActionScript 3.0
	 *	@Flash 		 Player 9.0.28.0
	 *	@author 	 Emiliano Burgos
	 *	@url		 http://www.enjoy-mondays.com
	 *  @version 	 1.0
	 */
	public interface ILoggerFactory {
		
		/**
		* Retrieves a logger for the specified class. If classType is a string, that
		* string is used as the class name, regardless of what it is. For any other
		* object, the class type of that object is used.
		* Usually we pass a Class object, but can use an instance as well.
		*
		* <p>If this method is called multiple times for the same classType,
		* the same logger will be returned rather than creating a new one.</p>
		*/
		function getLogger( forItem:* ):ILogger;
		
		
		//function setConfiguration( xml:XML ):void;
	}
	
}