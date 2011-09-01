package com.enjoymondays.logging.formaters.converters {
	import com.enjoymondays.logging.core.ILogMessage;
	import com.enjoymondays.logging.core.ILogMessageConverter;
	
	

	/**
	 * Base class for converting call stack from a log message to specified stack
	 * part.
	 */
	public class StackConverter extends AbstractLayouter {
		
		/**
		 * The regular expression for parsing call stack.
		 * 
		 * This pattern based on Jonathan Branams regular expression, but it is
		 * modified for correct working with constructors and classes without
		 * package.
		 * 
		 * @see http://github.com/jonathanbranam/360flex08_presocode/ Jonathan Branams Presentation
		 */
		public static const PATTERN						:RegExp = /^\tat (?:(.+)::)*(\w+)\/*(.*)\(\)\[*(?:(.+)\:(\d+))?\]*$/;
		
		
		/**
		 * The part of call stack that should be founded. 
		 */
		private var _part								:int = 0;
		
		
		/**
		 * Constructor.
		 * 
		 * @param part The part of call stack that should be founded. Use 
		 * <code>StackPart</code> constants for this parameter.
		 * 
		 * @see com.enjoymondays.logging.formaters.converters.StackPart
		 */
		public function StackConverter( part:int ) {
			super();			
			_part = part;
		}
		
		
		
		
		
		
		
		/**
		 * Returns a value of specified part of call stack.
		 * 
		 * @param message The log message that contains an information about call
		 * stack.
		 * 
		 * @return The specified part from concrete call stack.
		 * 
		 * @see com.enjoymondays.logging.core.LogMessage#stak com.enjoymondays.logging.core.LogMessage.stak 
		 */
		override public function convert(message:ILogMessage):String {
			return "";
			//if (!message.stack || message.stack == "")
				//return "";
			//
			//var stack:Array = message.stack.split("\n");
			//
			//var matches:Object = stack[3].match(StackConverter.PATTERN);
			//
			//var result:String;
			//
			//try
			//{
				//result = matches[_part];
			//}
			//catch (error:Error)
			//{
				//result = _part.toString();
			//}
			//
			//return result;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function get id():String { return "StackConverter"; }
	}
}