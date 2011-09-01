package com.enjoymondays.logging.formaters.converters {
	import com.enjoymondays.logging.core.ILogMessage;
	import com.enjoymondays.logging.core.ILogMessageConverter;
	
	

	/**
	 * Converts log message to a name of class.
	 */
	public class ClassConverter extends AbstractLayouter  /*extends StackConverter*/ {
		
		/**
		 * The number of right most components of the full 
		 * class name.
		 * @private
		 */
		protected var _precision						:int = 0;
		
		/**
		 * Constructor.
		 * 
		 */
		public function ClassConverter(  ) { }
		
		/**
		 * Returns the name of class where logging is used. 
		 */
		override public function convert(message:ILogMessage):String {
			return message.className;
			
			//if (!message.stack || message.stack == "")
				//return "";
			//
			//if (this.precision == 1)
				//return super.convert(message);
				//
			//var className:String = super.convert(message);
			//
			//var packageName:String = 
				//new StackConverter(StackPart.PACKAGE_NAME).convert(message);
			//
			//var fullClassName:String = packageName + "." + className;
			//
			//return fullClassName.split(".").slice(-this.precision).join(".");
		}
		
		/**
		 * @inheritDoc
		 */
		override public function get options():* { return super.options; }
		/**
		 * @inheritDoc
		 */
		override public function set options(value:*):void {
			_precision = int(value);
			super.options = value;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function get id():String { return "ClassConverter"; }
	}
}