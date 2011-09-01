package com.enjoymondays.logging.publishers {
	
	import com.enjoymondays.logging.core.ILoggerFormatter;
	import com.enjoymondays.logging.core.ILoggerPublisher;
	import com.enjoymondays.logging.core.ILogMessage;
	import com.enjoymondays.logging.core.LogMessage;
	
	/**
	 * <code>CompoundPublisher</code>.
	 *
	 *	@langversion ActionScript 3.0
	 *	@Flash 		 Player 9.0.28.0
	 *	@author 	 Emiliano Burgos
	 *	@url		 http://www.enjoy-mondays.com
	 *  @version 	 1.0
	 */
	public class CompoundPublisher implements ILoggerPublisher {
		
		/** @private **/
		private var _index							:int = 0;
		
		/** @private **/
		private var _publishers						:Array = new Array;
		
		/** @private **/
		//private var _data							:Object;
		
		/**
		 * <code>CompoundPublisher</code>.
		 * com.enjoymondays.logging.publishers.CompoundPublisher
		 */
		public function CompoundPublisher( ) {
			
		}
		
		/** @inheritDoc **/
		public function add( publisher:ILoggerPublisher, formater:ILoggerFormatter ):void {
			publisher.setFormater( formater );
			if ( _publishers.indexOf( publisher ) != -1 ) return;
			_publishers.push( publisher );
		}
		
		/** @inheritDoc **/
		public function remove( publisher:ILoggerPublisher ):void {
			var index:int = _publishers.indexOf( publisher );
			if ( index != -1 ) _publishers.splice( index, 1 );
		}
		
		/** @inheritDoc **/
		public function log( message:ILogMessage ):void {
			for each (var publisher : ILoggerPublisher in _publishers) {
				publisher.log(message);
			}
		}
		
		/** @inheritDoc **/
		public function clear( ):void {
			for each (var publisher : ILoggerPublisher in _publishers) {
				publisher.clear();
			}
		}
		
		/** @inheritDoc **/
		public function delimiter( char:String = "-" ):void {
			for each (var publisher : ILoggerPublisher in _publishers) {
				publisher.delimiter( char );
			}
		}
		
		/** @inheritDoc **/
		public function setFormater( formatter:ILoggerFormatter ):void {}
		
		/** @inheritDoc **/
		public function getInitialized( ):Boolean {
			for each (var publisher : ILoggerPublisher in _publishers) {
				if( publisher.getInitialized( ) == false ) return false;
			}
			return true;
		}
		
		/** @inheritDoc **/
		public function unload( ):void {
			for each (var publisher : ILoggerPublisher in _publishers) {
				publisher.unload( );
			}
		}
		
		/** @inheritDoc **/
		public function configure(data:Object):void {
			///IT DOES NOT MAKE SENSE TO HAVE THIS HERE.
			//_data = data;
		}
		
		/**
		 *
		 */
		public function get delayedPublishing():Boolean { return false; }
		/** @private **/
		public function set delayedPublishing(value:Boolean):void { }
	}
	
}