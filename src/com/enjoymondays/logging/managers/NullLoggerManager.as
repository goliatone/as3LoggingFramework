package com.enjoymondays.logging.managers {
	import com.enjoymondays.logging.core.ILogger;
	import com.enjoymondays.logging.core.ILoggerFormatter;
	import com.enjoymondays.logging.core.ILoggerManager;
	import com.enjoymondays.logging.core.ILoggerPublisher;
	import com.enjoymondays.logging.core.ILogLevel;
	import com.enjoymondays.logging.loggers.NullLogger;
	


	/**
	 * <code>NullLoggerManager</code>.
	 *
	 *	@langversion ActionScript 3.0
	 *	@Flash 		 Player 9.0.28.0
	 *	@author 	 Emiliano Burgos
	 *	@url		 http://www.paginaswebflash.com
	 * @version 	 1.0
	 */
	public class NullLoggerManager implements ILoggerManager {
		
		//private var _nullLogger:ILogger = new NullLogger;
		/**
		 * <code>NullLoggerManager</code>
		 * com.enjoymondays.logging.managers.NullLoggerManager
		 */
		public function NullLoggerManager() {
			
		}
		
		public function getLogger(classType:*):ILogger {
			return new NullLogger;
		}
		
		public function setDebugger(debugger:Class):void {}
		
		public function removeLogger(classType:*):void{ }
		
		public function disablePackages(...packages):void{ }
		
		public function addLevelFilter(pk:String, level:ILogLevel, extrict:Boolean = false):void{ }
		
		public function setGlobalThreshold(threshold:*):void{ }
		
		public function disableLevels(...levels):void{ }
		
		public function enableLevels(...levels):void{ }
		
		public function addPublisher(publisher:ILoggerPublisher, formater:ILoggerFormatter):void{ }
		
		public function makeActiveLogger(logger:ILogger = null):void{ }
		
		public function loggerDisabled(name:String, loggerPackage:String, level:ILogLevel):Boolean { return false; }
		
		public function setLogger(logger:Class):void { }
		
		
	}

}