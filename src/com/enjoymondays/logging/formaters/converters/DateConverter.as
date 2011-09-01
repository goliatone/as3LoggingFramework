package com.enjoymondays.logging.formaters.converters {
	
	import com.enjoymondays.logging.core.ILogMessage;
	import com.enjoymondays.logging.core.ILogMessageConverter;
	import com.enjoymondays.logging.utils.DateUtils;
	
	/**
	 * <code>DateConverter</code> gives a specific format to a Date object.
	 *
	 *	@langversion ActionScript 3.0
	 *	@Flash 		 Player 9.0.28.0
	 *	@author 	 Emiliano Burgos
	 *	@url		 http://www.enjoy-mondays.com
	 *  @version 	 1.0
	 */
	public class DateConverter extends AbstractLayouter {
		
		/**
		 * The mask pattern that used for formatting date.
		 * @private
		 */
		protected var _format						:String;
		
		/**
		 *
		 * @private
		 */
		protected var _formater						:DateUtils = new DateUtils;
		
		
		/**
		 * <code>DateConverter</code>.
		 * com.enjoymondays.logging.formaters.converters.DateConverter
		 *
		 * @see com.enjoymondays.logging.utils.DateUtils#formatDate
		 */
		public function DateConverter(  ) {
			
		}
		
		
		
		/**
		 * Returns the formatted data.
		 *
		 * @param message The log message that will converted to an specified value.
		 * @param params The first parameter after <code>message</code> must be
		 * string of date format.
		 *
		 * @return The name of level.
		 *
		 * @see com.enjoymondays.logging.core.LogMessage
		 * @see com.enjoymondays.logging.formaters.converters.ILogMessageConverter#convert
		 */
		override public function convert(message:ILogMessage ):String {
			var formatString:String;
			switch ( _format ) {
				case "ABSOLUTE" :
					formatString = "YYYY/MM/DD J:NN:SS";
					formatString = "l ^t^h^e dS ^of F Y h:i:s A";
				break;
				default:
					formatString = _format;
				break;
			}
			return _formater.formatDate( new Date, formatString );
		}
		
		/**
		 * @inheritDoc
		 */
		override public function get options():* { return super.options; }
		/**
		 * @inheritDoc
		 */
		override public function set options(value:*):void {
			_format = String(value);
			super.options = value;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function get id():String { return "DateConverter"; }
	}
}