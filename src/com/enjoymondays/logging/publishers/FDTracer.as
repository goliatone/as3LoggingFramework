package com.enjoymondays.logging.publishers {
	
	
	import com.enjoymondays.logging.core.ILoggerPublisher;
	import com.enjoymondays.logging.core.ILogMessage;
	import com.enjoymondays.logging.core.LogLevel;
	
	import org.flashdevelop.utils.FlashConnect;
	import org.flashdevelop.utils.TraceLevel;
	
	
	
	
	/**
	 * ...
	 * @author Emiliano Burgos
	 */
	public class FDTracer extends AbstractPublisher implements ILoggerPublisher {
		
		public static var NAME						:String = 'FDTracer';
		
		/**
		 *
		 * @param	delayed
		 */
		public function FDTracer( delayed:Boolean = false ) {
			super( delayed );
		}
		
		/**
		 * @inheritDoc
		 */
		override public function log( message:ILogMessage ):void {
			
			//if ( message.message == LogMessage.EMPTY && message.object ) message.message = dumpObject( message.object );
			
			_msg = _formatter.format( message );
			
			switch( message.level ) {
				case LogLevel.INFO:
					FlashConnect.trace( _msg, TraceLevel.INFO );
				break;
				case LogLevel.LOG:
				case LogLevel.DEBUG:
					FlashConnect.trace( _msg, TraceLevel.DEBUG );
				break;
				case LogLevel.WARN:
					FlashConnect.trace( _msg, TraceLevel.WARNING);
				break;
				case LogLevel.ERROR:
					FlashConnect.trace( _msg, TraceLevel.ERROR );
				break;
				case LogLevel.FATAL:
					FlashConnect.trace( _msg, TraceLevel.FATAL );
				break;
				default:
					FlashConnect.trace( _msg, TraceLevel.DEBUG );
				break;
			}
		}
		override public function delimiter( char:String = "-" ):void {
			if ( char == "-" ) FlashConnect.trace( "----------------------------", TraceLevel.INFO );
			else FlashConnect.trace( char, TraceLevel.INFO );
		}
		public function getName( ):String {
			return NAME;
		}
	}
}