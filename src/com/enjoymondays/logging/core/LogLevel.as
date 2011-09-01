package com.enjoymondays.logging.core {
	
	/**
	 * <code>LogLevel</code>.
	 *
	 *	@langversion ActionScript 3.0
	 *	@Flash 		 Player 9.0.28.0
	 *	@author 	 Emiliano Burgos
	 *	@url		 http://www.enjoy-mondays.com
	 *  @version 	 1.0
	 */
	public class LogLevel implements ILogLevel {
		
		
		public static var OFF				:LogLevel = new LogLevel( "OFF"		, 0x0000 );
		
		public static var LOG				:LogLevel = new LogLevel( "LOG"		, 0x01 );
		public static var DEBUG				:LogLevel = new LogLevel( "DEBUG"	, 0x02 );
		public static var INFO				:LogLevel = new LogLevel( "INFO"	, 0x04 );
		public static var WARN				:LogLevel = new LogLevel( "WARN"	, 0x08 );
		public static var ERROR				:LogLevel = new LogLevel( "ERROR"	, 0x10 );
		public static var FATAL				:LogLevel = new LogLevel( "FATAL"	, 0x20 );
		
		public static var ALL				:LogLevel = new LogLevel( "ALL"		, 0xFFFF );
		
		
		private var _name					:String;
		private var _value					:int;
		
		/**
		 * <code>LogLevel</code>.
		 * com.enjoymondays.logging.core.LogLevel
		 *
		 * @param	name
		 * @param	value
		 */
		public function LogLevel( name:String, value:int ){
			_name = name;
			_value = value;
		}
		
		public function get name( ):String {
			return _name;
		}
		
		public function get value( ):int {
			return _value;
		}
		
		
		
		public function valueOf( ):int {
			return _value;
		}
		
		/**
		 *
		 * @param	level
		 * @return
		 */
		public function passes( level:ILogLevel ):Boolean {
			return !filters( level );
		}
		
		/**
		 *
		 * @param	level
		 * @return
		 */
		public function filters( level:ILogLevel, extrict:Boolean = false ):Boolean {
			if ( _value == ALL.value ) return false;
			if ( _value == OFF.value ) return true;
			if ( extrict ) return _value != level.value;
			else return !( level.value > _value );
		}
		
		/**
		 * 
		 * @param	level
		 * @return
		 */
		public function equalTo( level:ILogLevel ):Boolean {
			return _value == level.value;
		}
		
		/**
		 * 
		 * @param	name
		 * @return
		 */
		public static function getFromName( name:String ):LogLevel {
			return LogLevel[ name.toUpperCase() ];
		}
		
		/**
		 * @see Object#toString()
		 */
		public function toString( ):String {			
			return "[com.enjoymondays.logging.core.LogLevel => name: "+name+", value:"+value+ "]";
		}
	}
	
}