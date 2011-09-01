package com.enjoymondays.logging.formaters.converters {
	import com.enjoymondays.logging.core.ILogMessage;
	import com.enjoymondays.logging.core.ILogMessageConverter;
	
	
	
	/**
	 * Converts log message to a number of line.
	 */
	public class LineNumberConverter extends AbstractLayouter /*extends StackConverter*/
	{
		
		public function LineNumberConverter( ) {
		}
		
		/**
		 * Returns the number of line where log method is called. 
		 * 
		 * This information given from the call stack. 
		 * This method based on Jonathan Branams regular expression.
		 * 
		 * @param message The log message that will converted to an specified value.
		 * 
		 * @return The line number from call stack.
		 * 
		 * @see com.enjoymondays.logging.core.LogMessage
		 * @see com.enjoymondays.logging.formaters.converters.ILogMessageConverter#convert
		 * @see http://github.com/jonathanbranam/360flex08_presocode/ Jonathan Branams Presentation
		 */
		override public function convert(message:ILogMessage ):String {
			return message.line;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function get id():String { return "LineNumberConverter"; }
	}
}