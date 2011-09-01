package com.enjoymondays.logging.formaters.converters {
	import com.enjoymondays.logging.core.ILogMessage;
	import com.enjoymondays.logging.core.ILogMessageConverter;
	
	


	/**
	 * <code>AbstractLayouter</code>.
	 *
	 *	@langversion ActionScript 3.0
	 *	@Flash 		 Player 9.0.28.0
	 *	@author 	 Emiliano Burgos
	 *	@url		 http://www.paginaswebflash.com
	 * @version 	 1.0
	 */
	public class AbstractLayouter implements ILogMessageConverter {
		
		/** @private */
		protected var _options							:*;
		
		protected var _id								:String = "AbstractLayouter";
		
		/**
		 * <code>AbstractLayouter</code>
		 * com.enjoymondays.logging.formaters.converters.AbstractLayouter
		 * 
		 */
		public function AbstractLayouter(  ) {
		}
		
		/**
		 * @inheritDoc
		 */
		public function convert( message:ILogMessage ):String {
			return message.message;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get options( ):* { return _options; }
		/** @private **/
		public function set options( value:* ):void {
			_options = value;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get id():String { return _id; }
		
	}

}