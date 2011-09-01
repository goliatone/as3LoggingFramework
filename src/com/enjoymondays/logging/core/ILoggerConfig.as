package com.enjoymondays.logging.core {
	
	/**
	 *	<logging mode="debug|release|remote">
	 *		<debug threshold="ALL" >
	 *			<publisher>
	 *				<target   build = "com.enjoymondays.logging.publishers.AlconLogger" />
	 *				<formater build = "com.enjoymondays.logging.formaters.StringFormater" />
	 *				<debugger build = "com.enjoymondays.logging.debuggers.DefaultDebugger" />
	 *			</publisher>
	 *			<publisher>
	 *				<target   build = "com.enjoymondays.logging.publishers.FDTracer" delayed="true" />
	 *				<formater build = "com.enjoymondays.logging.formaters.StringFormater" />
	 *			</publisher>
	 *		</debug>
	 *		<release threshold="WARN" disabled="INFO,FATAL">
	 *			<publisher>
	 *				<target   build = "com.enjoymondays.logging.publishers.FDTracer" delayed="true" />
	 *				<formater build = "com.enjoymondays.logging.formaters.StringFormater" />
	 *			</publisher>
	 *			<disabledPackages>
	 *				<package id="com.enjoymondays.mvc.commands.implemented" />
	 *				<package id="com.enjoymondays.utils" />
	 *			</disabledPackages>
	 *			<levelFilters>
	 *				<filter package="com.enjoymondays.mvc.commands" level="INFO" />
	 *			</levelFilters>
	 *		</release>
	 *	</logging>
	 *
	 * ILoggerConfig.
	 *
	 *	@langversion ActionScript 3.0
	 *	@Flash 		 Player 9.0.28.0
	 *	@author 	 Emiliano Burgos
	 *	@url		 http://www.enjoy-mondays.com
	 *  @version 	 1.0
	 */
	public interface ILoggerConfig {
		
		/**
		 *
		 * @param	id
		 */
		function setId( id:String ):void;
		
		/**
		 *
		 * @param	xml
		 */
		function fromXML( xml:XML ):void;
		
		/**
		 *
		 * @param	mode
		 */
		function setMode( mode:String ):void;
		
		/**
		 *
		 */
		function reset( ):void;
		
		/**
		 *
		 */
		function get managerPackage( ):String;
		
		/**
		 *
		 */
		function get threshold():String;
		
		/**
		 *
		 */
		function get publishers():Array;
		
		/**
		 *
		 */
		function get levelFilters():Array;
		
		/**
		 *
		 */
		function get disabledLevels():Array;
		
		/**
		 *
		 */
		function get disabledPackages():Array;
		
		/**
		 *
		 */
		function get debugger():String;
		
		/**
		 *
		 */
		function get logger():String;
		
		/**
		 *
		 */
		function get notNullDebugger():Boolean;
		
		/**
		 *
		 */
		function get notNullLogger():Boolean;
	}
	
}