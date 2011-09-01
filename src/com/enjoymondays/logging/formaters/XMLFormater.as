package com.enjoymondays.logging.formaters {
	import com.enjoymondays.logging.core.ILoggerFormatter;
	import com.enjoymondays.logging.core.ILogMessage;
	
	/**
	 * <code>XMLFormater</code>.
	 *
	 *	@langversion ActionScript 3.0
	 *	@Flash 		 Player 9.0.28.0
	 *	@author 	 Emiliano Burgos 
	 *	@url		 http://www.enjoy-mondays.com
	 * @version 	 1.0
	 */
	public class XMLFormater extends AbstractFormater {
		private var _xml:XML;
		
		/**
		 * <code>XMLFormater</code>.
		 * com.enjoymondays.logging.formaters.XMLFormater
		 */
		public function XMLFormater(  ) { }
		
		
		/**
		 * 
		 * @param	message
		 * @return
		 */
		override public function format( message:ILogMessage ):String {
			_xml = new XML( "<Log/>" );
			_xml.@timestamp = message.timestamp;
			_xml.@level = message.level.name;
			_xml.@logger = message.logger;
			//_xml.message = <![CDATA[ {send} ]]>;
			_xml.message = message.message;
			return _xml.toString( );
		}		
	}
	
}