package com.enjoymondays.logging.debuggers {
	
	import com.enjoymondays.logging.core.IDebugger;
	import com.enjoymondays.logging.core.ILogger;
	import com.enjoymondays.logging.plugins.CacheLogger;
	import com.enjoymondays.logging.plugins.ObjectDumper;
	import com.enjoymondays.logging.plugins.StopWatchLogger;

	/**
	 * <code>DefaultDebugger</code>.
	 *
	 *	@langversion ActionScript 3.0
	 *	@Flash 		 Player 9.0.28.0
	 *	@author 	 Emiliano Burgos
	 *	@url		 http://www.enjoy-mondays.com
	 * @version 	 1.0
	 */
	public class DefaultDebugger implements IDebugger {
		
		private var _stopwatch						:StopWatchLogger;
		private var _cachewatch						:CacheLogger;
		private var _dumper							:ObjectDumper;
		private var _logger							:ILogger;
		
		/**
		 * <code>DefaultDebugger</code>
		 * com.enjoymondays.logging.debuggers.DefaultDebugger
		 */
		public function DefaultDebugger() {
			_stopwatch  = new StopWatchLogger;
			_cachewatch = new CacheLogger;
			_dumper 	= new ObjectDumper;
		}
		
		/**
		 * @inheritDoc
		 */
		public function setLogger( logger:ILogger ):void {
			_logger = logger;
			_stopwatch.setLogger( logger );
			_cachewatch.setLogger( logger );
		}
		
		/**
		 * @inheritDoc
		 */
		public function startStopwatch( title:String ):void {
			_stopwatch.start( title );
		}
		
		/**
		 * @inheritDoc
		 */
		public function stopStopwatch( ):void {
			_stopwatch.stop( );
		}
		
		/**
		 * @inheritDoc
		 */
		public function logGarbageCollection( obj : * , id : String = null ):void {
			_cachewatch.logGarbageCollection( obj, id );
		}
		
		/**
		 * @inheritDoc
		 */
		public function collectGarbage( ):void {
			_cachewatch.clear( );
		}
		
		/**
		 * @inheritDoc
		 */
		public function classToString( o:*, ...args ):void {
			var className:String = _dumper.classToString.call( null, [o, args]);
			_logger.info("Class to string: %0", className);
		}
		
		/**
		 * @inheritDoc
		 */
		public function print( o:*, indent:String = "" ):void {
			var result:String = _dumper.print( o );
			_logger.info("Print: %0", result );
		}
		
		/**
		 * @inheritDoc
		 */
		public function dump( o:*, indent:String = ""):String {
			return _dumper.print( o );
		}
		
	}

}