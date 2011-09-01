package com.enjoymondays.logging.plugins {
	
	
	import com.enjoymondays.logging.core.ILogger;
	import com.enjoymondays.logging.core.IDebuggerPlugin;
	


	/**
	 * <code>AbstractDebuggerPlugin</code>.
	 *
	 *	@langversion ActionScript 3.0
	 *	@Flash 		 Player 9.0.28.0
	 *	@author 	 Emiliano Burgos
	 *	@url		 http://www.enjoy-mondays.com
	 * @version 	 1.0
	 */
	public class AbstractDebuggerPlugin implements IDebuggerPlugin {
		
		protected var _logger							:ILogger;
		
		/**
		 * <code>AbstractDebuggerPlugin</code>
		 * com.enjoymondays.logging.plugins.AbstractDebuggerPlugin
		 */
		public function AbstractDebuggerPlugin() {
			
		}
		
		/**
		 * 
		 * @param	logger
		 */
		public function setLogger( logger:ILogger ):void {
			_logger = logger;
		}
	}

}