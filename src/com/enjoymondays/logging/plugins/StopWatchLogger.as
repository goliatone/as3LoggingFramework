package com.enjoymondays.logging.plugins {
	import com.enjoymondays.logging.core.ILogger;
	import com.enjoymondays.logging.utils.StopWatch;
	
	/**
	 * <code>StopWatchLogger</code>.
	 *
	 *	@langversion ActionScript 3.0
	 *	@Flash 		 Player 9.0.28.0
	 *	@author 	 Emiliano Burgos
	 *	@url		 http://www.enjoy-mondays.com
	 *  @version 	 1.0
	 */
	public class StopWatchLogger extends AbstractDebuggerPlugin {
		
		/** @private **/
		private var _stopwatch						:StopWatch;
		
		/**
		 * <code>StopWatchLogger</code>.
		 * com.enjoymondays.logging.plugins.StopWatchLogger
		 */
		public function StopWatchLogger( ) {
			_stopwatch = new StopWatch;
		}
		
		/**
		 *
		 * @param	title
		 */
		public function start( title:String = '' ):void {
			_stopwatch.start( title );
		}
		
		/**
		 *
		 */
		public function stop( ):void {
			if ( !_stopwatch.started ) return;
			_stopwatch.stop( );
			_logger.info( _stopwatch.toString() );
		}
		
	}
	
}