package com.enjoymondays.logging.vos {
	


	/**
	 * <code>LoggerFilterVO</code>.
	 *
	 *	@langversion ActionScript 3.0
	 *	@Flash 		 Player 9.0.28.0
	 *	@author 	 Emiliano Burgos
	 *	@url		 http://www.enjoy-mondays.com
	 *  @version 	 1.0
	 */
	public class LoggerFilterVO {
		
		/**
		 *
		 */
		public var level									:String;
		
		/**
		 *
		 */
		public var enabled									:Boolean;
		
		/**
		 *
		 */
		public var packageFilter							:String;
		
		
		/**
		 * <code>LoggerFilterVO</code>
		 * com.enjoymondays.logging.vos.LoggerFilterVO
		 *
		 * @param	packageFilter
		 * @param	level
		 * @param	enabled
		 */
		public function LoggerFilterVO( packageFilter:String = null, level:String = null, enabled:Boolean = true ) {
			this.enabled = enabled;
			this.level = level;
			this.packageFilter = packageFilter;
		}
		
		/**
		 *
		 * @return
		 */
		public function toString():String {
			return "[ LoggerFilterVO => packageFilter: " + packageFilter + ", level: " + level + ", enabled: " + enabled + "]";
		}
		
	}

}