package com.enjoymondays.logging.debuggers {
	import com.enjoymondays.logging.core.IDebugger;
	import com.enjoymondays.logging.core.ILogger;
	


	/**
	 * <code>NullDebugger</code>.
	 *
	 *	@langversion ActionScript 3.0
	 *	@Flash 		 Player 9.0.28.0
	 *	@author 	 Emiliano Burgos
	 *	@url		 http://www.enjoy-mondays.com
	 * @version 	 1.0
	 */
	public class NullDebugger implements IDebugger {
		
		/**
		 * <code>NullDebugger</code>
		 * com.enjoymondays.logging.debuggers.NullDebugger
		 */
		public function NullDebugger( ) {
			
		}
		
		/**
		 * @inheritDoc
		 */
		public function startStopwatch( title:String ):void { }
		
		/**
		 * @inheritDoc
		 */
		public function stopStopwatch():void { }
		
		/**
		 * @inheritDoc
		 */
		public function logGarbageCollection(obj:*, id:String = null):void { }
		
		/**
		 * @inheritDoc
		 */
		public function collectGarbage():void { }
		
		/**
		 * @inheritDoc
		 */
		public function classToString(o:*, ...args):void { }
		
		/**
		 * @inheritDoc
		 */
		public function print(o:*, indent:String = ""):void { }
		
		/**
		 * @inheritDoc
		 */
		public function dump(o:*, indent:String = ""):String { return ""; }
		
		/**
		 * @inheritDoc
		 */
		public function setLogger(logger:ILogger):void { }
		
	}

}