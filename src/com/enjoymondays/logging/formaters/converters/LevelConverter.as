package com.enjoymondays.logging.formaters.converters {
	import com.enjoymondays.logging.core.ILogMessage;
	import com.enjoymondays.logging.core.ILogMessageConverter;
	
	
	/**
	 * Converts log message to a level's name.
	 */
	public class LevelConverter extends AbstractLayouter {
		
		/**
		 * The number of characters for priority.
		 * @default	0
		 * @private
		 */
		private var _precision						:int = 0;
		
		/**
		 * Constructor.
		 * 
		 */
		public function LevelConverter() { }
		
		/**
		 * Returns the level's name of log message.
		 * 
		 * @param message The log message that will converted to an specified value.
		 * 
		 * @return The name of level.
		 * 
		 * @see com.enjoymondays.logging.core.LogMessage
		 * @see com.enjoymondays.logging.formaters.converters.ILogMessageConverter#convert
		 */
		override public function convert( message:ILogMessage ):String {
			
			var levelName:String = message.level.name;
			
			//if ( _precision == 0 ) _precision = levelName.length;
			//
			//if ( _precision <= levelName.length ) return levelName.substr( 0, _precision );
			//
			//var n:int = _precision - levelName.length;
			//for (var i:int = 0; i < n; i++) {
				//levelName += " ";
			//}
			
			return levelName;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function get options():* { return super.options; }
		/**
		 * @inheritDoc
		 */
		override public function set options(value:*):void {
			_precision = int(value);
			super.options = value;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function get id():String { return "LevelConverter"; }
	}
}