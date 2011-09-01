package com.enjoymondays.logging.publishers {
	
	import com.enjoymondays.logging.core.ILogMessage;
	import com.enjoymondays.logging.formaters.XMLFormater;
	import flash.events.AsyncErrorEvent;
	import flash.events.Event;
	import flash.events.SecurityErrorEvent;
	import flash.events.StatusEvent;
	import flash.net.LocalConnection;
	
	
	/**
	 * ...
	 * @author Emiliano Burgos
	 */
	public class GLoggerConsole extends AbstractPublisher {
		
		public static const NAME				:String = "GLOOGER_CONSOLE";
		
		/**
		 * Private properties
		 *
		 */
		private var _localConnection			:LocalConnection;
		private var _xmlFormater				:XMLFormater;
		
		public function GLoggerConsole() {
		}
		
		
		/**
		 * Executes when the SOSMaxOutput is instantiated
		 *
		 */
		override protected function _init ():void {
			_localConnection = new LocalConnection;
			_localConnection.addEventListener(AsyncErrorEvent.ASYNC_ERROR, _catchErrors );
			_localConnection.addEventListener(SecurityErrorEvent.SECURITY_ERROR, _catchErrors )
			_localConnection.addEventListener(StatusEvent.STATUS, _onStatus );
			
			_localConnection.allowDomain( "*" );
			_xmlFormater = new XMLFormater( );
		}
		
		override public function log(message:ILogMessage):void {
			try {
				//_localConnection.send( ConnectionHelper.connectionID, ConnectionHelper.ENTRY_POINT, record.getMessage().toString() );
				//var b:ByteArray = new ByteArray
				//b.writeObject( record )
				//record.message = record.message.toString( );
				//_localConnection.send( ConnectionHelper.connectionID, ConnectionHelper.ENTRY_POINT, _xmlFormater.formatMessage( record ) );
			}
			catch ( error:Error ) { };
		}
		
		
		/**
		 * Sends a message to the GLogger output
		 * @param Messagetype
		 * @param Title
		 * @param [optional] Message
		 *
		 */
		public function sendMessage ( type:int, title:*, message:* = null ):void {
			//throw GErrorConst.formatMessage( GErrorConst.DEPRECATED_METHOD, 'sendMessage', getName() );
		}
		
		
		/**
		 * Clears the output
		 *
		 */
		public function clearOutput( ):void {
			try
			{
				_localConnection.send( "_glogger_debugger_lc", "clear" );
			}
			catch ( error:Error ) {};
		}
		
		
		/**
		 * Unloads the BraemarOutput and disconnects the localconnection
		 *
		 */
		override public function unload( ):void {
			_localConnection = null;
		}
		
		
		
		
		private function _onStatus( e:StatusEvent ):void {
			
		}
		
		private function _catchErrors( e:Event ):void {
			
		}
		
	}
}
