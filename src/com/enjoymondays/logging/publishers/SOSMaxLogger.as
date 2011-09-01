package com.enjoymondays.logging.publishers {
	
	
	import com.enjoymondays.logging.core.ILoggerPublisher;
	import com.enjoymondays.logging.core.ILogMessage;
	import com.enjoymondays.logging.core.LogLevel;
	import flash.events.IOErrorEvent;
	import flash.net.XMLSocket;
	
	/**
	 * ...
	 * @author Emiliano Burgos
	 */
	public class SOSMaxLogger extends AbstractPublisher implements ILoggerPublisher {
		
		public static const NAME				:String = "SOSMAX_CONSOLE";
		
		/**
		 * Private properties
		 *
		 */
		private var _socket:XMLSocket;
		private var _type:String;
		
		public function SOSMaxLogger(){
		}
		
		/**
		 * Executes when the SOSMaxOutput is instantiated
		 * REVISION Add error to GMVCError list.
		 */
		override protected function _init ():void {
			
 			this._socket = new XMLSocket( );
			try {
				// Connect to SOSMax
				this._socket.addEventListener( IOErrorEvent.IO_ERROR, this._onError );
				this._socket.connect( "localhost", 4444 );
			} catch ( error:Error ) { /*_onError( ) */};
		}
		
		
		/**
		 * Sends a message to the SOSMax output
		 * @param Messagetype
		 * @param Title
		 * @param [optional] Message
		 *
		 */
		/**
		 * @inheritDoc
		 */
		override public function log( message:ILogMessage ):void {
			if ( ! _socket.connected ) return;
			
			//if ( message.message == LogMessage.EMPTY && message.object ) message.message = dumpObject( message.object );
			
			_type = getType( message.level );
			//_msg = _formatter.format( message );
			//we should use a xml formater.
			_socket.send( "!SOS<showFoldMessage key='" + _type + "'>"
		 						+ "<title>" + message.className +":" + message.methodName + "</title>"
							    + "<message>" + message.message + "</message>"
		   						+ "</showFoldMessage>" );
		}
		
		
		
		/**
		 * Clears the output
		 * @inheritDoc
		 */
		override public function clear( ):void {
			_socket.send( "!SOS<clear/>" );
		}
		
		
		private function getType ( type:LogLevel ):String {
			
			var myType:String;
			switch ( type ) {
				case LogLevel.INFO: myType = "info"; break;
				case LogLevel.LOG: myType = "trace"; break;
				case LogLevel.DEBUG: myType = "debug"; break;
				case LogLevel.WARN: myType = "warning"; break;
				case LogLevel.ERROR: myType = "error"; break;
				case LogLevel.FATAL: myType = "fatal"; break;
			}
			
			return myType;
		}
		
		
		private function _onError ( event:IOErrorEvent ):void {
			//throw new GMVCError ( GMVCError.LOGGER_FAIL_TO_CONNECT );
		}
		
		/**
		 * Unloads the output and disconnects the XMLSocket connection
		 *
		 */
		override public function unload( ):void {
			this._socket.removeEventListener( IOErrorEvent.IO_ERROR, this._onError );
			this._socket = null;
		}
		
		public function getName():String {
			return NAME;
		}
		
		
	}
}
