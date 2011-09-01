package com.enjoymondays.logging.formaters {
	
	import com.enjoymondays.logging.core.ILogMessage;
	import com.enjoymondays.logging.core.ILogMessageConverter;
	import com.enjoymondays.logging.formaters.converters.ClassConverter;
	import com.enjoymondays.logging.formaters.converters.DateConverter;
	import com.enjoymondays.logging.formaters.converters.FileConverter;
	import com.enjoymondays.logging.formaters.converters.LevelConverter;
	import com.enjoymondays.logging.formaters.converters.LineNumberConverter;
	import com.enjoymondays.logging.formaters.converters.MessageConverter;
	import com.enjoymondays.logging.formaters.converters.MethodConverter;
	import com.enjoymondays.logging.vos.FormatLayoutVO;
	
	
	
	
	/**
	 * <code>PatternFormater</code> is used to format the message that gets logged by a particular Target.
	 * <br/>
	 * Inbuilt patterns:<br/>
	 *
	 * <b>%d</b> 		: Date of the log.<br/>
	 * <b>%F</b>		: File of the log, uses StackTrace.<br/>
	 * <b>%p</b>		: The log message.<br/>
	 * <b>%C</b>		: Class.<br/>
	 * <b>%M</b>		: Method name<br/>
	 * <b>%m</b>		: Message.<br/>
	 * <b>%n</b>		: New line.<br/>
	 * <b>%L</b>		: Line number.<br/>
	 *
	 *
	 *	@langversion ActionScript 3.0
	 *	@Flash 		 Player 9.0.28.0
	 *	@author 	 Emiliano Burgos
	 *	@url		 http://www.enjoy-mondays.com
	 *  @version 	 1.0
	 */
	public class PatternFormater extends AbstractFormater {
		
		/**
		 *
		 */
		public static const PATTERN_DATE				:RegExp	= /(?<=%d{).*?(?=})/g;
		/** @private **/
		public static const REPLACE_DATE				:RegExp	= /%d{.*?}/;
		
		/**
		 *
		 */
		public static const PATTERN_FILE				:RegExp	= /%F/g;
		/** @private **/
		public static const REPLACE_FILE				:RegExp	= /%F/;
		
		/**
		 *
		 */
		public static const PATTERN_LEVEL				:RegExp	= /(?<=%)\d*(?=p)/g;
		/** @private **/
		public static const REPLACE_LEVEL				:RegExp	= /%\d*p/;
		
		/**
		 *
		 */
		public static const PATTERN_CLASS				:RegExp	= /(?<=%C{)\d*(?=})/g;
		/** @private **/
		public static const REPLACE_CLASS				:RegExp	= /%C{\d*}/;
		
		/**
		 *
		 */
		public static const PATTERN_METHOD				:RegExp	= /%M/g;
		/** @private **/
		public static const REPLACE_METHOD				:RegExp	= /%M/;
		
		/**
		 *
		 */
		public static const PATTERN_MESSAGE				:RegExp	= /%m/g;
		/** @private **/
		public static const REPLACE_MESSAGE				:RegExp	= /%m/;
		
		/**
		 *
		 */
		public static const PATTERN_CATEGORY			:RegExp	= /(?<=%C{)\d*(?=})/g;
		/** @private **/
		public static const REPLACE_CATEGORY			:RegExp	= /%C{\d*}/;
		
		/**
		 *
		 */
		public static const PATTERN_NEW_LINE			:RegExp	= /%n/g;
		/** @private **/
		public static const REPLACE_NEW_LINE			:RegExp	= /%n/g;
		
		/**
		 *
		 */
		public static const PATTERN_LINE_NUMBER			:RegExp	= /%L/g;
		/** @private **/
		public static const REPLACE_LINE_NUMBER			:RegExp	= /%L/;
		
		/** @private **/
		private var _formatLayouts						:Object;
		
		/** @private **/
		public var initialized							:Boolean = _initialize( );
		
		/**
		 * Constructor.
		 */
		public function PatternFormater(  ) {
			super();
		}
		
		/**
		 *
		 * @param	message
		 * @return	String Final message formated based on pattern.
		 */
		override public function format( message:ILogMessage ):String {
			
			var result:String = getPatternFor( message.level.name );
			
			for each( var layout:FormatLayoutVO in _formatLayouts ) result = _executeConverter( result, message, layout );
			
			result = result.replace( REPLACE_NEW_LINE, "\n");
			
			return result;
		}
		
		
		
		/**
		 *
		 * @param	matchPattern
		 * @param	replacePattern
		 * @param	Converter
		 */
		public function addFormatLayout( matchPattern:RegExp, replacePattern:RegExp, Converter:Class ):void {
			
			var vo:FormatLayoutVO = new FormatLayoutVO;
			vo.matchPattern = matchPattern;
			vo.replacePattern = replacePattern;
			vo.converter = new Converter;
			
			_formatLayouts[ vo.converter.id ] = vo;
		}
		
		/**
		 *
		 * @param	level
		 * @return
		 */
		override public function isStackNeeded( level:String ):Boolean {
			PATTERN_FILE.lastIndex = 0;
			PATTERN_METHOD.lastIndex = 0;
			PATTERN_LINE_NUMBER.lastIndex = 0;
			
			var pattern:String = getPatternFor( level );
			
			return PATTERN_FILE.test(pattern) || PATTERN_METHOD.test(pattern) || PATTERN_LINE_NUMBER.test(pattern);
		}
		
		/**
		 *
		 * @param	result
		 * @param	message
		 * @param	vo
		 * @return
		 * @private
		 */
		protected function _executeConverter( result:String, message:ILogMessage, vo:FormatLayoutVO ):String {
			
			var i:int, n:int, matches:Array, converter:ILogMessageConverter;
			converter = vo.converter;
			
			matches = result.match( vo.matchPattern );
			n = matches.length;
			for (i = 0; i < n; i++) {
				converter.options = matches[i];
				result = result.replace( vo.replacePattern, converter.convert( message ) );
			}
			
			return result;
		}
		
		/**
		 * @return
		 * @private
		 */
		protected function _initialize( ):Boolean {
			
			_formatLayouts = new Object;
			
			addFormatLayout( PATTERN_DATE, REPLACE_DATE, DateConverter );
			addFormatLayout( PATTERN_LEVEL, REPLACE_LEVEL, LevelConverter );
			addFormatLayout( PATTERN_MESSAGE, REPLACE_MESSAGE, MessageConverter );
			addFormatLayout( PATTERN_CLASS, REPLACE_CLASS, ClassConverter );
			addFormatLayout( PATTERN_METHOD, REPLACE_METHOD, MethodConverter );
			addFormatLayout( PATTERN_FILE, REPLACE_FILE, FileConverter );
			addFormatLayout( PATTERN_LINE_NUMBER, REPLACE_LINE_NUMBER, LineNumberConverter );
			
			
			return true;
		}
		
	}
}