package com.enjoymondays.logging.core {
	
	/**
	 * ILoggerPublisher.
	 *
	 *	@langversion ActionScript 3.0
	 *	@Flash 		 Player 9.0.28.0
	 *	@author 	 Emiliano Burgos
	 *	@url		 http://www.enjoy-mondays.com
	 *  @version 	 1.0
	 */
	public interface ILoggerPublisher {
		
		/**
		 *
		 * @param	data
		 */
		function configure( data:Object ):void;
		
		/**
		 * Sets the <code>ILoggerFormatter</code> object which is used by <code>ILoggerPublisher</code>
		 * to format <code>LogMessage</code> objects before sending them to their destination.
		 *
		 * @param formatter the <code>ILoggerFormatter</code>
		 * @see ILoggerFormatter
		 */
		function setFormater( formatter:ILoggerFormatter ):void;
		
		/**
		 * Returns whether the <code>ILoggerPublisher</code> is ready to output <code>LogMessage</code>
		 * objects. This is handy for <code>ILoggerPublisher</code> implementations which for instance
		 * need to establish a socket connection before beeing able to output anything.
		 *
		 * @return true if the <code>ILoggerPublisher</code> implementation is ready for usage, otherwise
		 * returns false
		 */
		function getInitialized( ):Boolean;
		
		/**
		 *
		 * @param	message
		 */
		function log( message:ILogMessage ):void;
		
		/**
		 *
		 */
		function clear( ):void;
		
		/**
		 *
		 */
		function unload( ):void;
		
		
		/**
		 * REVISION, WE COULD PASS A CHARACTER TO USE FOR DELIMETER. PERHAPS ALSO A NUMBER FOR PADDING?
		 */
		function delimiter( char:String = "-" ):void;
		
		/**
		 *
		 * @default false
		 */
		function get delayedPublishing():Boolean;
		/** @private */
		function set delayedPublishing(value:Boolean):void;
		
	}
	
}