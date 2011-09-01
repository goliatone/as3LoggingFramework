package com.enjoymondays.logging.vos {
	import com.enjoymondays.logging.core.ILogMessageConverter;
	


	/**
	 * <code>FormatLayoutVO</code>.
	 *
	 *	@langversion ActionScript 3.0
	 *	@Flash 		 Player 9.0.28.0
	 *	@author 	 Emiliano Burgos
	 *	@url		 http://www.paginaswebflash.com
	 * @version 	 1.0
	 */
	public class FormatLayoutVO {
		
		public var converter					:ILogMessageConverter;
		public var matchPattern					:RegExp;
		public var replacePattern				:RegExp;
		
		/**
		 * <code>FormatLayoutVO</code>
		 * com.enjoymondays.logging.vos.FormatLayoutVO
		 */
		public function FormatLayoutVO() {
			
		}
		
	}

}