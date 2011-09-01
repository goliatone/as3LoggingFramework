package com.enjoymondays.logging.publishers {
	import com.enjoymondays.logging.core.ILoggerFormatter;
	import com.enjoymondays.logging.core.ILoggerPublisher;
	import com.enjoymondays.logging.core.ILogMessage;
	
	/**
	 * <code>AbstractPublisher</code>.
	 *
	 *	@langversion ActionScript 3.0
	 *	@Flash 		 Player 9.0.28.0
	 *	@author 	 Emiliano Burgos
	 *	@url		 http://www.enjoy-mondays.com
	 * @version 	 1.0
	 */
	public class AbstractPublisher implements ILoggerPublisher {
		
		/**
		 *
		 */
		static protected var _BUFFER					:Array;
		
		/** @private **/
		protected var _msg								:String;
		
		/** @private **/
		private var _config								:Object;
		
		/** @private **/
		protected var _formatter						:ILoggerFormatter;
		
		/** @private **/
		protected var _delayedPublishing				:Boolean = false;
		
		
		
		
		/**
		 * <code>AbstractPublisher</code>.
		 * com.enjoymondays.logging.publishers.AbstractPublisher
		 *
		 * @param	delayed
		 */
		public function AbstractPublisher( delayed:Boolean = false ) {
			delayedPublishing = delayed;
			_init( );
		}
		
		/**
		 *
		 * @protected
		 */
		protected function _init( ):void {
			
		}
		
		/** @inheritDoc **/
		public function setFormater( formatter:ILoggerFormatter ):void {
			_formatter = formatter;
		}
		
		
		/** @inheritDoc **/
		public function getInitialized( ):Boolean {
			return true;
		}
		
		/** @inheritDoc **/
		public function log( message:ILogMessage ):void {
			if ( delayedPublishing ) _BUFFER.push(message);
		}
		
		
		/** @inheritDoc **/
		public function clear( ):void {
			/* REVISION
			 * Do we want to clear the buffer as well? or only the screen?
			 * Maybe we have some publishers that are not loaded and would still
			 * need this content.
			 */
			if ( delayedPublishing ) _BUFFER = [];
		}
		
		/** @inheritDoc **/
		public function delimiter( char:String = "-" ):void {
			
		}
		
		/** @inheritDoc **/
		public function unload( ):void {
			
		}
		
		/** @inheritDoc **/
		public function configure(data:Object):void {
			_config = data;
			trace(data.toString());
		}
		
		/** @inheritDoc **/
		public function get delayedPublishing():Boolean { return _delayedPublishing; }
		/** @private **/
		public function set delayedPublishing(value:Boolean):void {
			_delayedPublishing = value;
			
			if ( value && !_BUFFER ) _BUFFER = new Array;
		}
	}
	
}