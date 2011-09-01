package com.enjoymondays.logging.vos {
	import com.enjoymondays.logging.core.ILoggerFormatter;
	import com.enjoymondays.logging.core.ILoggerPublisher;
	import com.enjoymondays.logging.core.IPublisherVO;
	


	/**
	 * REVISION Make regular VO!
	 *
	 * <code>PublisherVO</code>.
	 *
	 *	@langversion ActionScript 3.0
	 *	@Flash 		 Player 9.0.28.0
	 *	@author 	 Emiliano Burgos
	 *	@url		 http://www.enjoy-mondays.com
	 *  @version 	 1.0
	 */
	public class PublisherVO implements IPublisherVO {
		
		/** @private **/
		protected var _publisher						:ILoggerPublisher;
		
		/** @private **/
		protected var _formater							:ILoggerFormatter;
		
		/** @private **/
		protected var _delayed							:Boolean = false;
		
		/** @private **/
		protected var _targetBuild						:String;
		
		/** @private **/
		protected var _formaterBuild					:String;
		
		/** @private **/
		protected var _formaterPatterns					:Array;
		
		/** @private **/
		protected var _config							:XML;
		
		/**
		 * <code>PublisherVO</code>
		 * com.enjoymondays.logging.vos.PublisherVO
		 *
		 * @param	publisher
		 * @param	formater
		 */
		public function PublisherVO( publisher:ILoggerPublisher = null, formater:ILoggerFormatter = null ) {
			this.formater  = formater;
			this.publisher = publisher;
			formaterPatterns = new Array;
		}
		
		/** @inheritDoc **/
		public function get publisher():ILoggerPublisher { return _publisher; }
		/** @private **/
		public function set publisher(value:ILoggerPublisher):void {
			_publisher = value;
		}
		
		/** @inheritDoc **/
		public function get formater():ILoggerFormatter { return _formater; }
		/** @private **/
		public function set formater(value:ILoggerFormatter):void {
			_formater = value;
		}
		
		/** @inheritDoc **/
		public function get delayed():Boolean { return _delayed; }
		/** @private **/
		public function set delayed(value:Boolean):void {
			_delayed = value;
		}
		
		/** @inheritDoc **/
		public function get targetBuild():String { return _targetBuild; }
		/** @private **/
		public function set targetBuild(value:String):void {
			_targetBuild = value;
		}
		
		/** @inheritDoc **/
		public function get formaterBuild():String { return _formaterBuild; }
		/** @private **/
		public function set formaterBuild(value:String):void {
			_formaterBuild = value;
		}
		
		/** @inheritDoc **/
		public function get formaterPatterns():Array { return _formaterPatterns; }
		/** @private **/
		public function set formaterPatterns(value:Array):void {
			_formaterPatterns = value;
		}
		
		/** @inheritDoc **/
		public function get config():XML { return _config; }
		/** @private **/
		public function set config(value:XML):void {
			_config = value;
		}
		
		
		/** @inheritDoc **/
		public function toString():String {
			return "[ PublisherVO => target: " + targetBuild + ", formater: " + formaterBuild + ", delayed: " + delayed + "]";
		}
	}

}