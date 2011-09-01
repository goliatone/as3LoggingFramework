package com.enjoymondays.logging.publishers {
	
	import com.enjoymondays.logging.core.ILoggerPublisher;
	import com.enjoymondays.logging.core.ILogMessage;
	import com.enjoymondays.logging.core.LogLevel;
	import com.enjoymondays.logging.publishers.AbstractPublisher;
	
	import com.hexagonstar.util.debug.Debug;
	
	/**
	 * ...
	 * @author Emiliano Burgos
	 */
	public class AlconLogger extends AbstractPublisher implements ILoggerPublisher {
		
		Debug.clear( );
		
		public static const NAME				:String = "ALCON_CONSOLE";
		
		/**
		 * Private properties
		 *
		 */
		private var LOG_ID				:int;
		private var TEXT_COLOR			:Number;
		private var BG_COLOR			:Number;
		
		/**
		 *
		 * @param	delayed
		 */
		public function AlconLogger( delayed:Boolean = false ) {
			super( delayed );
		}
		
		/**
		 * @inheritDoc
		 */
		override public function log( message:ILogMessage ):void {
			
			
			_msg = _formatter.format( message );
			Debug.trace( _msg, _getType( message.level ) );
		}
		
		
		
		/**
		 * @inheritDoc
		 */
		override public function delimiter( char:String = "-" ):void {
			Debug.delimiter( );
		}
		
		/**
		 * @inheritDoc
		 */
		override public function clear( ):void {
			Debug.clear( );
		}
		
		
		private function _getType ( level:LogLevel ):int {
			
			var myType:int;
			
			switch ( level ) {
				case LogLevel.INFO:
				case LogLevel.LOG:
					myType = Debug.LEVEL_INFO;
				break;
				case LogLevel.DEBUG:
					myType = Debug.LEVEL_DEBUG;
				break;
				case LogLevel.WARN:
					myType = Debug.LEVEL_WARN;
				break;
				case LogLevel.ERROR:
					myType = Debug.LEVEL_ERROR;
				break;
				case LogLevel.FATAL:
					myType = Debug.LEVEL_FATAL;
				break;
				default: myType = Debug.LEVEL_DEBUG;
			}
			
			return myType;
		}
		
		
		public function getName():String {
			return NAME;
		}
		
		
	}
}
