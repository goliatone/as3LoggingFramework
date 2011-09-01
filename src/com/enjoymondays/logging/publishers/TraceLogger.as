package com.enjoymondays.logging.publishers {
	
	import com.enjoymondays.logging.core.ILogMessage;
	
	/**
	 * ...
	 * @author Emiliano Burgos
	 */
	public class TraceLogger extends AbstractPublisher {
		
		public static const NAME				:String = "TRACE_CONSOLE";
		
		
		
		
		
		
		override public function log( message:ILogMessage ):void {
			if( message.message != null ) trace( message.methodName +"\n\t" + message.message );
		}
		
	}
	
}