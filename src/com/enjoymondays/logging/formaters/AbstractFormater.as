package com.enjoymondays.logging.formaters {
	import com.enjoymondays.logging.core.ILoggerFormatter;
	import com.enjoymondays.logging.core.ILogMessage;
	import com.enjoymondays.utils.fixArguments;
	import com.enjoymondays.logging.vos.PatternVO;
	import flash.utils.Dictionary;
	
	
	


	/**
	 * <code>AbstractFormater</code>.
	 *
	 *	@langversion ActionScript 3.0
	 *	@Flash 		 Player 9.0.28.0
	 *	@author 	 Emiliano Burgos
	 *	@url		 http://www.enjoy-mondays.com
	 * @version 	 1.0
	 */
	public class AbstractFormater implements ILoggerFormatter {
		
		public static const DEFAULT_PATTERN				:String = "%m%n";
		
		/**
		 * @private
		 */
		protected var _defaultPattern					:String = DEFAULT_PATTERN;
		
		protected var _patterns							:Dictionary;
		
		/**
		 * <code>AbstractFormater</code>
		 * com.enjoymondays.logging.formaters.AbstractFormater
		 */
		public function AbstractFormater() {
			
		}
		
		public function format( message:ILogMessage ):String {
			return message.message;
		}
		
		/**
		 *
		 * @param	name
		 */
		public function getPatternFor( level:String ):String {
			level = level.toUpperCase();
			if ( _patterns && _patterns[ level ] ) return  _patterns[ level ];
			else return defaultPattern;
		}
		
		/**
		 *
		 * @param	...patterns
		 */
		public function setLevelPatterns( ...patterns ):void {
			patterns = fixArguments( patterns );
			
			_patterns = new Dictionary;
			
			var fallback:String, allLevels:String;
			for each( var vo:PatternVO in patterns ) {
				_patterns[ vo.level.toUpperCase() ] = vo.pattern;
				if ( vo.level.toUpperCase() == "ALL" ) allLevels = vo.pattern;
				if ( vo.fallback ) fallback = vo.pattern;
			}
			
			/*
			 * If a pattern is flaged with fallback = true we use it
			 * as defaultPattern.
			 * If not, and we have a LogLevel.ALL pattern, we use that
			 * as defaultPattern.
			 * If not, we use DEFAULT_PATTERN
			 */
			if ( fallback ) defaultPattern = fallback;
			else if ( allLevels ) defaultPattern = allLevels;
		}
		
		public function isStackNeeded( level:String ):Boolean {
			return true;
		}
		
		public function get defaultPattern():String { return _defaultPattern || DEFAULT_PATTERN; }
		
		public function set defaultPattern(value:String):void {
			_defaultPattern = value;
		}
	}

}