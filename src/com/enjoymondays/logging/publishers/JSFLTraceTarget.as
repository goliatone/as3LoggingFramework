package com.enjoymondays.logging.publishers {
	
	import adobe.utils.MMExecute;	
	import com.enjoymondays.logging.core.ILogMessage;
	
	/**
	 * Logs messages to the Flash IDE's trace window when the application
	 * is running as a WindowSWF
	 *
	 * @author john
	 */
	public class JSFLTraceTarget extends AbstractPublisher {
		
		static public const NAME:String = 'JSFLTraceTarget';
		
		
		override public function log(message:ILogMessage):void {
			MMExecute("fl.trace(\"" + message.message );
		}
		
		
		
		public function getName( ):String {
			return NAME;
			
		}
		
	}
}