package com.enjoymondays.logging.loggers {
	import com.enjoymondays.logging.core.ILoggerFormatter;
	import com.enjoymondays.logging.core.ILoggerPublisher;
	import com.enjoymondays.logging.core.LogLevel;
	import com.enjoymondays.logging.debuggers.NullDebugger;
	import com.enjoymondays.logging.managers.NullLoggerManager;
	
	import com.enjoymondays.logging.core.IDebugger;
	import com.enjoymondays.logging.core.ILogger;
	import com.enjoymondays.logging.core.ILoggerManager;
	


	/**
	 * <code>NullLogger</code>.
	 *
	 *	@langversion ActionScript 3.0
	 *	@Flash 		 Player 9.0.28.0
	 *	@author 	 Emiliano Burgos
	 *	@url		 http://www.paginaswebflash.com
	 * @version 	 1.0
	 */
	public class NullLogger implements ILogger {
		
		private var _nullDebugger				:IDebugger = new NullDebugger;
		private var _nullManager				:ILoggerManager;
		/**
		 * <code>NullLogger</code>
		 * com.enjoymondays.logging.loggers.NullLogger
		 */
		public function NullLogger() { }
		
		
		
		
		public function setManager(manager:ILoggerManager):void{}
		
		/**
		 * @inheritDoc
		 */
		public function trace( message:*, ...parameters:Array ):void {
			log( LogLevel.LOG, message, parameters );
		}
		
		/**
		 * @inheritDoc
		 */
		public function debug(message:*, ...parameters:Array):void {
			log( LogLevel.DEBUG, message, parameters );
		}
		
		/**
		 * @inheritDoc
		 */
		public function info(message:*, ...parameters:Array):void{
			log( LogLevel.INFO, message, parameters );
		}
		
		/**
		 * @inheritDoc
		 */
		public function warn( message:*, ...parameters:Array ):void {
			log( LogLevel.WARN, message, parameters );
		}
		
		/**
		 * @inheritDoc
		 */
		public function error( message:*, ...parameters:Array ):void {
			log( LogLevel.ERROR, message, parameters );
		}
		
		/**
		 * @inheritDoc
		 */
		public function fatal( message:*, ...parameters:Array ):void {
			log( LogLevel.FATAL, message, parameters );
		}
		
		/**
		 * @inheritDoc
		 */
		public function log( level:LogLevel, message:*, ...parameters:Array ):void {
			trace(level.toString(), " ", message, parameters);
		}
		
		
		public function clear():void{ }
		
		public function delimiter():void { }
		
		
		public function setDebugger(debugger:IDebugger):void { }
		
		
		public function setPackage(pack:String):void { }		
		
		public function addPublisher(publisher:ILoggerPublisher, formater:ILoggerFormatter):void { }
		
		public function removePublisher(publisher:ILoggerPublisher):void { }
		
		
		public function get manager():ILoggerManager{ return _nullManager }
		
		public function get debugger():IDebugger{ return _nullDebugger }
		
		public function get packagePath():String { return '';  }
		
		public function get name():String{ return ''; }
		
	}

}