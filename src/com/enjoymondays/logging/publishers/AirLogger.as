package com.enjoymondays.logging.publishers {
	
	import com.enjoymondays.logging.core.ILoggerPublisher;
	import com.enjoymondays.logging.core.ILogMessage;
	import com.enjoymondays.logging.core.LogLevel;
	import com.enjoymondays.logging.core.LogMessage;
	import flash.events.SecurityErrorEvent;
	import flash.events.StatusEvent;
	import flash.net.LocalConnection;
	import flash.utils.clearInterval;
	import flash.utils.setInterval;
	
	/**
	 * ...
	 * @author Emiliano Burgos
	 */
	public class AirLogger extends AbstractPublisher implements ILoggerPublisher {
		
		public static const NAME			:String = "AIRLOG_CONSOLE";
		
		/** @private */
		protected static const LOCALCONNECTION_ID 	: String = "_AIRLOGGER_CONSOLE";
		/** @private */
		protected static const OUT_SUFFIX 			: String = "_IN";
		/** @private */
		protected static const IN_SUFFIX 			: String = "_OUT";
		
		/** @private */
		static protected var ALTERNATE_ID_IN : String = "";
		
		protected var _lcOut : LocalConnection;
		/** @private */
		protected var _lcIn : LocalConnection;
		/** @private */
		protected var _sID : String;
		
		/** @private */
		protected var _bIdentified : Boolean;
		/** @private */
		protected var _bRequesting : Boolean;
		
		/** @private */
		protected var _aLogStack : Array;
		/** @private */
		protected var _nPingRequest : Number;
		
		/** @private */
		protected var _sName : String;
		
		
		public function AirLogger() {
            //if ( !(access is ConstructorAccess) ) throw new PrivateConstructorException();

            try
            {
            	_lcOut = new LocalConnection();
				_lcOut.addEventListener( StatusEvent.STATUS, onStatus, false, 0, true);
	            _lcOut.addEventListener( SecurityErrorEvent.SECURITY_ERROR, onSecurityError, false, 0, true);
	
	            _lcIn = new LocalConnection();
	            _lcIn.client = this;
	            _lcIn.allowDomain( "*" );
	
				connect();
	
	            _aLogStack = new Array();
	
	            _bIdentified = false;
				_bRequesting = false;
				
            } catch ( e : Error )
            {
            	// TODO Notifier le AirLogger que le channel de requete est dÃ©ja occupÃ©
            	// se reconnecter sur un autre
            }
		}
		
		private function onSecurityError(e:SecurityErrorEvent):void {
			
		}
		
		private function onStatus(e:StatusEvent):void {
			
		}
		
		/**
		 * Connects to the AirLogger console.
		 */
		protected function connect () : void
		{
			var b : Boolean = true;
			
			while( b )
			{
				try
				{
		           _lcIn.connect( _getInConnectionName( ALTERNATE_ID_IN ) );
		
		           b = false;
		           break;
				}
				catch ( e : Error )
				{
					_lcOut.send( _getOutConnectionName(), "mainConnectionAlreadyUsed", ALTERNATE_ID_IN );
					
					ALTERNATE_ID_IN += "_";
				}
			}
		}
		
		public function setName ( s : String ) : void
		{
			_sName = s;
			
			if( _bIdentified )
			{
				_lcOut.send( _getOutConnectionName( _sID ), "setTabName", _sName  );
			}
		}
		
		public function setID ( id : String ) : void
		{
			try
			{
				clearInterval( _nPingRequest );
				_sID = id;
				
				_lcIn.close();
				_lcIn.connect( _getInConnectionName( _sID ) );
				
				_lcOut.send( _getOutConnectionName() , "confirmID", id, _sName  );
				
				_bIdentified = true;
				_bRequesting = false;
				
				var l : Number = _aLogStack.length;
				if( l != 0 )
				{
					for(var i : Number = 0; i < l; i++ )
					{
						_send( _aLogStack.shift() as AirLoggerEvent );
					}
				}
			}
			catch ( e : Error )
			{
				_lcIn.connect( _getInConnectionName( ALTERNATE_ID_IN ) );
				
				_lcOut.send( _getOutConnectionName() , "idAlreadyUsed", id );
			}
		}
		override public function unload( ):void {
			_lcIn.close();
		}
		
		override public function log(message:ILogMessage):void {
			_msg = _formatter.format( message );
			
			var evt : AirLoggerEvent = new AirLoggerEvent ( "log", _msg, message.level.value, new Date(), getType(message.level.value ) );
			
			_send( evt );
		}
		
		public function clearOutput( ):void {
			_send ( new AirLoggerEvent ( "clear" ) );
		}
		/**
		 * Gives focus to AirLogger console.
		 */
		public function focus() : void
		{
			_send ( new AirLoggerEvent ( "focus" ) );
		}
		
		public function getName():String{
			return NAME;
		}
		
		/** @private */
		protected function _send ( evt : AirLoggerEvent ) : void
		{
			if( _bIdentified )
			{
				_lcOut.send( _getOutConnectionName( _sID ), evt.type, evt );
			}
			else
			{
				_aLogStack.push( evt );
				
				if( !_bRequesting )
				{
					pingRequest();
					_nPingRequest = setInterval( pingRequest, 1000 );
					_bRequesting = true;
				}
			}
		}
		public function pingRequest () : void
		{
			_lcOut.send( _getOutConnectionName() , "requestID", ALTERNATE_ID_IN  );
		}
		/** @private */
		protected function _getInConnectionName ( id : String = "" ) : String
		{
			return LOCALCONNECTION_ID + id + IN_SUFFIX;
		}
		/** @private */
		protected function _getOutConnectionName ( id : String = "" ) : String
		{
			return LOCALCONNECTION_ID + id + OUT_SUFFIX;
		}
		
		private function getType ( type:int ):String {
			var myType:String;
			
			switch ( type )
			{
				case LogLevel.INFO: myType = 'LEVEL_INFO';  break;
				case LogLevel.LOG:  myType = 'LOG_ID';  break;
				case LogLevel.DEBUG: myType = 'LEVEL_DEBUG';  break;
				case LogLevel.WARN: myType = 'LEVEL_WARN'; break;
				case LogLevel.ERROR: myType = 'LEVEL_ERROR';  break;
				case LogLevel.FATAL:  	myType = 'LEVEL_FATAL'; 	break;
				default: myType = 'LEVEL_DEBUG';
			}
			
			return myType;
		}
		
	}
	
}


import flash.events.Event;

internal class AirLoggerEvent extends Event {
	public var message : *;
	public var level : uint;
	public var date : Date;
	public var messageType : String;
	
	public function AirLoggerEvent( sType : String, message : * = null, level : uint = 0, date : Date = null, messageType : String = null )
	{
		super( sType );
		
		this.message = message;
		this.level = level;
		this.date = date;
		this.messageType = messageType;
	}
}