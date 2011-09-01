package com.enjoymondays.logging.publishers {
	
	//import com.hexagonstar.util.debug.Debug;
	import com.enjoymondays.logging.core.ILoggerPublisher;
	import com.enjoymondays.logging.core.ILogMessage;
	import com.enjoymondays.logging.core.LogLevel;
	import com.enjoymondays.logging.publishers.AbstractPublisher;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	
	/**
	 * <code>SGRemoteLogger</code>.
	 * REVISION We would need a way to configure this object two ways.
	 * -on from the application itself.
	 * -from the server with a response. Also, in that case, it should propagate the response to whom might be interested.
	 *
	 *	@langversion ActionScript 3.0
	 *	@Flash 		 Player 9.0.28.0
	 *	@author 	 Emiliano Burgos
	 *	@url		 http://www.enjoy-mondays.com
	 * @version 	 1.0
	 */
	public class SGRemoteLogger extends AbstractPublisher implements ILoggerPublisher {
		
		
		
		public static const NAME				:String = "SKINNY_GEEK_REMOTE_DDBB_LOGGER";
		
		
		private var _remote							:URLLoader;
		private var _request						:URLRequest;
		private var _parameters						:URLVariables;
		
		override protected function _init( ):void {
			
			_remote = new URLLoader( );
			_remote.addEventListener( Event.COMPLETE, _onComplete );
			//_remote.addEventListener( HTTPStatusEvent.HTTP_STATUS, _onStatus );
			
			_request = new URLRequest( 'http://localhost/skinnytracks.com/index.php/welcome/log' );
			_request.method = 'POST';
			
			_parameters = new URLVariables;
		}
		
		static public var onCompleteCallback:Function;
		private function _onComplete(e:Event):void {
			onCompleteCallback( _remote.data );
		}
		
		
		/**
		 * @inheritDoc
		 */
		override public function log( message:ILogMessage ):void {
			
			
			//_msg = _formatter.format( message );
			
			//_parameters.l = 5;
			//WE SHOULD MAKE IT SO THAT IT MATCHES AND WE SEND IT DIRECTLY.
			_parameters.l = _getType( message.level );
			_parameters.m = message.message;
			_request.data = _parameters;
			_remote.load( _request );
			
		}
		
		
		
		/**
		 *
		 * @param	level
		 * @return
		 * @private
		 */
		private function _getType ( level:LogLevel ):int {
			
			var myType:int;
			
			switch ( level ) {
				case LogLevel.INFO: 	myType = 1; break;
				case LogLevel.LOG:		myType = 2; break;
				case LogLevel.DEBUG:	myType = 3; break;
				case LogLevel.WARN:		myType = 4;	break;
				case LogLevel.ERROR:	myType = 5;	break;
				case LogLevel.FATAL:	myType = 6; break;
				default: myType = 3;
			}
			
			return myType;
		}
		
		/**
		 * @inheritDoc
		 */
		public function getName():String {
			return NAME;
		}
		
		
	}
}
