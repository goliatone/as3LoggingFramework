package com.enjoymondays.logging.formaters.converters {
	import com.enjoymondays.logging.core.ILogMessage;
	import com.enjoymondays.logging.core.ILogMessageConverter;
	
	
	
	/**
	 * Converts log message to a file's name.
	 */
	public class FileConverter extends AbstractLayouter /*extends StackConverter*/ {
		
		/**
		 * Constructor.
		 */
		public function FileConverter() { }
		
		
		/**
		 * Returns the name of file where logging is used. 
		 * 
		 * This information given from the call stack. 
		 * 
		 * @param message The log message that will converted to an specified value.
		 * @param params Must be empty.
		 * 
		 * @return The name of file from call stack.
		 * 
		 * @see com.enjoymondays.logging.formaters.converters.StackBasedConverter#parseStack()
		 */
		override public function convert(message:ILogMessage):String {
			//return super.convert(message);
			return message.file;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function get id():String { return "FileConverter"; }
	}
}