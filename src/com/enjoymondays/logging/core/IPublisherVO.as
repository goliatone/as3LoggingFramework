package com.enjoymondays.logging.core {
	
	/**
	 * IPublisherVO.
	 *
	 *	@langversion ActionScript 3.0
	 *	@Flash 		 Player 9.0.28.0
	 *	@author 	 Emiliano Burgos
	 *	@url		 http://www.paginaswebflash.com
	 * @version 	 1.0
	 */
	public interface IPublisherVO {
		
		/**
		 *
		 */
		function get publisher():ILoggerPublisher;
		/** @private **/
		function set publisher(value:ILoggerPublisher):void;
		
		/**
		 *
		 */
		function get formater():ILoggerFormatter;
		/** @private **/
		function set formater(value:ILoggerFormatter):void;
		
		/**
		 *
		 */
		function get delayed():Boolean;
		/** @private **/
		function set delayed(value:Boolean):void;
		
		/**
		 *
		 */
		function get targetBuild():String;
		/** @private **/
		function set targetBuild(value:String):void;
		
		/**
		 *
		 */
		function get formaterBuild():String;
		/** @private **/
		function set formaterBuild(value:String):void;
		
		/**
		 *
		 */
		function get formaterPatterns():Array;
		/** @private **/
		function set formaterPatterns(value:Array):void;
		
		/**
		 *
		 */
		function get config( ):XML;
		/** @private **/
		function set config(v:XML):void;
		
		
		/**
		 *
		 * @return
		 */
		function toString():String;
	}
	
}