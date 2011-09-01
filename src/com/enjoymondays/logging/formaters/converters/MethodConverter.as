package com.enjoymondays.logging.formaters.converters {
	import com.enjoymondays.logging.core.ILogMessage;
	
	
	
	/**
	 * Converts log message to a name of method.
	 */
	public class MethodConverter extends StackConverter {
		
		
		/**
		 * Constructor.
		 */
		public function MethodConverter( ) {
			super(StackPart.METHOD_NAME);
		}
		
		
		/**
		 * Returns the name of method where log method is called. 
		 * 
		 * This information given from the call stack. 
		 * This method based on Jonathan Branams regular expression.
		 * 
		 * @param message The log message that will converted to an specified value.
		 * 
		 * @return The name of method from call stack.
		 * 
		 * @see com.enjoymondays.logging.core.LogMessage
		 * @see com.enjoymondays.logging.formaters.converters.ILogMessageConverter#convert
		 * @see http://github.com/jonathanbranam/360flex08_presocode/ Jonathan Branams Presentation
		 */
		override public function convert(message:ILogMessage):String {
			//return super.convert(message);
			return message.methodName;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function get id():String { return "MethodConverter"; }
	}
}