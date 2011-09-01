package com.enjoymondays.logging.formaters.converters {
	import com.enjoymondays.logging.core.ILogMessage;
	import com.enjoymondays.logging.core.ILogMessageConverter;
	
	
	
	/**
	 * Converts log message to a category name.
	 */
	public class LoggerPackageConverter extends AbstractLayouter {
		
		/** 
		 * The number of right most components of the category
		 * 
		 * @default 0
		 * @private 
		 */
		private var _precision						:int = 0;
		
		/**
		 * Constructor.
		 * 
		 * @param precision 
		 * name.
		 */
		public function LoggerPackageConverter(  ) {}
		
		/**
		 * Returns the category name of log message.
		 * 
		 * @param message The log message that will converted to an specified value.
		 * 
		 * @return The name of category.
		 * 
		 * @see com.enjoymondays.logging.core.LogMessage
		 * @see com.enjoymondays.logging.formaters.converters.ILogMessageConverter#convert
		 */
		override public function convert(message:ILogMessage):String {
			var categoryName:String = message.logger;			
			return categoryName.split(".").slice(-_precision).join(".");
		}
		
		/**
		 * @inheritDoc
		 */
		override public function get options():* { return super.options; }
		
		/**
		 * @inheritDoc
		 */
		override public function set options(value:*):void {
			_precision = value;
			super.options = value;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function get id():String { return "LoggerPackageConverter"; }
	}
}