package com.enjoymondays.logging.formaters.converters {
	
	import com.enjoymondays.logging.core.ILogMessage;
	import com.enjoymondays.logging.core.ILogMessageConverter;
	
	
	
	/**
	 * Converts log message to a message.
	 */
	public class MessageConverter extends AbstractLayouter {
		
		
		public function MessageConverter() { }
		
		/**
		 * Returns the message of log message.
		 * 
		 * @param message The log message that will converted to an specified value.
		 * @param params Must be empty.
		 * 
		 * @return The message of log message.
		 * 
		 * @see com.enjoymondays.logging.core.LogMessage
		 * @see com.enjoymondays.logging.formaters.converters.ILogMessageConverter#convert
		 */
		override public function convert(message:ILogMessage):String {
			return message.message;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function get id():String { return "MessageConverter"; }
	}
}