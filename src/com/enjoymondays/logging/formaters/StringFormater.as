package com.enjoymondays.logging.formaters {
	import com.enjoymondays.logging.core.ILogMessage;
	import com.enjoymondays.logging.core.LogLevel;
	
	/**
	 * <code>StringFormater</code>.
	 *
	 *	@langversion ActionScript 3.0
	 *	@Flash 		 Player 9.0.28.0
	 *	@author 	 Emiliano Burgos
	 *	@url		 http://www.enjoy-mondays.com
	 * @version 	 1.0
	 */
	public class StringFormater extends AbstractFormater {
		
		static public var LS							:String = "\n\t\t   ";
		
		
		private var _includeLevel						:Boolean = false;
		
		/**
		 * <code>StringFormater</code>.
		 * com.enjoymondays.logging.formaters.StringFormater
		 */
		public function StringFormater(  ) {}
		
		/**
		 * REVISION Add a way to dinamically change the format.
		 *
		 * @inheritDoc
		 */
		override public function format( m:ILogMessage ):String {
			var msg:String;
			
			switch( m.level ) {
				case LogLevel.FATAL:
				case LogLevel.ERROR:
					msg = "--" + (_includeLevel ? m.level.name : '') +  "@" + m.timestamp + " " + m.logger +( m.methodName ? "::" + m.methodName : "") + LS + m.message;
				break;
				
				default:
					msg = m.className + "." + m.methodName + " " + m.message;
				break;
			}
			
			
			return msg;
		}
		
		/**
		 *
		 * @param	...patterns
		 */
		override public function setLevelPatterns(...patterns):void {
			
		}
		
	}
	
}