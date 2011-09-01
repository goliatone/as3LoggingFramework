package com.enjoymondays.logging.vos {
	


	/**
	 * <code>PatternVO</code>.
	 *
	 *	@langversion ActionScript 3.0
	 *	@Flash 		 Player 9.0.28.0
	 *	@author 	 Emiliano Burgos
	 *	@url		 http://www.enjoy-mondays.com
	 * @version 	 1.0
	 */
	public class PatternVO {
		
		public var pattern						:String;
		public var level						:String;
		public var fallback						:Boolean;
		
		/**
		 * <code>PatternVO</code>
		 * com.enjoymondays.logging.vos.PatternVO
		 * 
		 * @param	pattern
		 * @param	level
		 * @param	fallback
		 */
		public function PatternVO( pattern:String = null, level:String = "ALL", fallback:Boolean = false ) {
			this.pattern = pattern;
			this.level = level;
			this.fallback = fallback;
		}
		
		public function toString():String {
			return "[ PatternVO => pattern: " + pattern + ", level: " + level + ", fallback: " + fallback + "]";
		}
		
	}

}