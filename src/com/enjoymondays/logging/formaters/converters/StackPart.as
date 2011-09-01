package com.enjoymondays.logging.formaters.converters {
	
	/**
	 * The <code>StackPart</code> class provides values for part in the 
	 * <code>StackConverter</code> class.
	 * 
	 * @see com.enjoymondays.logging.formaters.converters.StackConverter
	 */
	public class StackPart {
		
		/**
		 * The <code>StackPart.PACKAGE_NAME</code> constant defines 
		 * the value of the <i>package name</i> part in call stack.
		 */
		public static const PACKAGE_NAME:int	= 1;
		
		/**
		 * The <code>StackPart.PACKAGE_NAME</code> constant defines 
		 * the value of the <i>class name</i> part in call stack.
		 */
		public static const CLASS_NAME:int		= 2;
		
		/**
		 * The <code>StackPart.PACKAGE_NAME</code> constant defines 
		 * the value of the <i>method name</i> part in call stack.
		 */
		public static const METHOD_NAME:int		= 3;
		
		/**
		 * The <code>StackPart.PACKAGE_NAME</code> constant defines 
		 * the value of the <i>file name</i> part in call stack.
		 */
		public static const FILE_NAME:int		= 4;
		
		/**
		 * The <code>StackPart.PACKAGE_NAME</code> constant defines 
		 * the value of the <i>line number</i> part in call stack.
		 */
		public static const LINE_NUMBER:int		= 5;
	}
}