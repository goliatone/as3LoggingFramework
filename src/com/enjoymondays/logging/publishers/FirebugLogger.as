package com.enjoymondays.logging.publishers {
	
	import com.enjoymondays.logging.core.ILogMessage;
	import com.enjoymondays.logging.core.LogLevel;
	
	import flash.external.ExternalInterface;
	
	/**
	 * ...
	 * @author Emiliano Burgos
	 */
	public class FirebugLogger extends AbstractPublisher {
		
		public static var NAME:String = 'FirebugLogger';
		
		override public function log(message:ILogMessage):void {
			if( ! ExternalInterface.available) return;
			
			_msg = _formatter.format( message );
			
	    	switch( message.level ) {
				case LogLevel.INFO: 
					ExternalInterface.call("console.info", _msg );
				break;
				case LogLevel.LOG:
					ExternalInterface.call("console.log", _msg );
				break;
				case LogLevel.DEBUG:
					ExternalInterface.call("console.debug", _msg );
				break;
				case LogLevel.WARN:
					ExternalInterface.call("console.warn", _msg );
				break;
				case LogLevel.ERROR:						
				case LogLevel.FATAL: 
					ExternalInterface.call("console.error", _msg );
				break;
				default: 
					ExternalInterface.call("console.debug", _msg );
				break;			
			}	
	    	
		}
		
		
		
		public function getName():String {
			return NAME;
		}
		
		
	}
	
}