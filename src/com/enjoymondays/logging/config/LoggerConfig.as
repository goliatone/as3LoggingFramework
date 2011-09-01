package com.enjoymondays.logging.config {
	
	import com.enjoymondays.logging.core.ILoggerConfig;
	import com.enjoymondays.logging.vos.LoggerFilterVO;
	import com.enjoymondays.logging.vos.PatternVO;
	import com.enjoymondays.logging.vos.PublisherVO;
	//import com.hexagonstar.util.debug.Debug;
	


	/**
	 * <code>LoggerConfig</code>.
	 *
	 *	@langversion ActionScript 3.0
	 *	@Flash 		 Player 9.0.28.0
	 *	@author 	 Emiliano Burgos
	 *	@url		 http://www.enjoy-mondays.com
	 * @version 	 1.0
	 */
	public class LoggerConfig implements ILoggerConfig {
		
		/**
		 *
		 */
		static public const DEBUG				:String = "debug";
		
		/**
		 *
		 */
		static public const REMOTE				:String = "remote";
		
		/**
		 *
		 */
		static public const RELEASE				:String = "release";
		
		/**
		 *
		 */
		static public var DEFAULT_DEBUGGER_ID	:String = "NullDebugger";
		
		/**
		 *
		 */
		static public var DEFAULT_LOGGER_ID		:String = "NullLogger";
		
		/**
		 *
		 */
		static public var DEFAULT_MANAGER_PACKAGE	:String = "com.enjoymondays.logging.managers.LoggerManager";
		
		
		
		/** @private **/
		protected var _id						:String;
		
		/** @private **/
		private var _mode						:String = DEBUG;
		
		/** @private **/
		private var _config						:XML;
		
		/** @private **/
		private var _setup						:XMLList;
		
		/** @private **/
		private var _managerPackage				:String = DEFAULT_MANAGER_PACKAGE;
		
		/** @private **/
		protected var _logger					:String = DEFAULT_LOGGER_ID;
		
		/** @private **/
		protected var _debugger					:String = DEFAULT_DEBUGGER_ID;
		
		/** @private **/
		protected var _threshold				:String = "ALL";
		
		/** @private **/
		protected var _publishers				:Array;
		
		/** @private **/
		protected var _levelFilters				:Array;
		
		/** @private **/
		protected var _disabledLevels			:Array;
		
		/** @private **/
		protected var _disabledPackages			:Array;
		
		
		/**
		 * <code>LoggerConfig</code>
		 * com.enjoymondays.logging.config.LoggerConfig
		 */
		public function LoggerConfig() {
			/*
			 * Let's set up our mode based on compiler
			 * variable. We can modiffy this in loggerconfig.xml
			 */
			/*
			CONFIG::debug {  _mode = DEBUG;	}
			CONFIG::release { _mode = RELEASE; }
			*/
			
		}
		
		/**
		 * @inheritDoc
		 */
		public function setId( id:String ):void {
			_id = id;
		}
		
		/**
		 * @inheritDoc
		 */
		public function setMode(mode:String):void {
			_mode = mode;
		}
		
		/**
		 * @inheritDoc
		 */
		public function reset( ):void {
			
			_config = null;
			_setup  = null;
			
			_publishers  	  = [ ];
			_levelFilters     = [ ];
			_disabledLevels   = [ ];
			_disabledPackages = [ ];
		}
		
		/**
		 * @inheritDoc
		 */
		public function fromXML(xml:XML):void {
			
			/*
			 * Make sure we initialize all data containers.
			 */
			reset( );
			
			
			_config = xml;
			
			if ( _config.hasOwnProperty("@mode") ) _mode = _config.@mode;
			
			_setup = _config[_mode];
			
			/*
			 * Get, if set, the global threshold
			 */
			if ( _setup.hasOwnProperty("@threshold") ) _threshold = _setup.@threshold;
			
			/*
			 * If set, get disabled LogLevel's
			 */
			if ( _setup.hasOwnProperty("@disabled") ) _disabledLevels = _setup.@disabled.split(",");
			
			/*
			 *
			 */
			if ( _setup.hasOwnProperty("debugger") ) _debugger = _setup.debugger.@build;
			
			/*
			 *
			 */
			if ( _setup.hasOwnProperty("logger") ) _logger = _setup.logger.@build;
			
			/**
			 *
			 */
			if ( _setup.hasOwnProperty("manager") ) _managerPackage = _setup.manager.@build;
			
			/*
			 * Let's handle publishers:
			 * <publisher>
			 *		<target   build = "com.enjoymondays.logging.publishers.AlconLogger" />
			 *		<formater build = "com.enjoymondays.logging.formaters.StringFormater" />
			 *		<debugger build = "com.enjoymondays.logging.debuggers.DefaultDebugger" />
			 * </publisher>
			 */
			if ( _setup.hasOwnProperty("publisher") ) {
				
				var publishers:XMLList = _setup.publisher;
				var vo:PublisherVO, pvo:PatternVO;
				var formater:String, debugger:String, delayed:Boolean;
				for each( var publisher:XML in publishers ) {
					vo = new PublisherVO;
					/*
					 * We get the target info.
					 */
					if ( publisher.hasOwnProperty("target")) {
						vo.targetBuild = publisher.target.@build;
						if( publisher.target.hasOwnProperty("@delayed") ) vo.delayed = (publisher.target.(@delayed == "true") );
					}
					
					/*
					 * Build formater info.
					 */
					if ( publisher.hasOwnProperty("formater")  ) {
						vo.formaterBuild = publisher.formater.@build;
						
						if ( publisher.formater.hasOwnProperty("pattern") ) {
							for each( var node:XML in publisher.formater.pattern ) {
								pvo = new PatternVO;
								pvo.pattern = node.toString();
								if ( node.hasOwnProperty("@level") ) pvo.level = node.@level;
								if ( node.hasOwnProperty("@fallback" ) &&
									 node.(@fallback == "true" ) ) pvo.fallback = true;
								vo.formaterPatterns.push( pvo );
								//Debug.trace("we have pattern " + pvo.toString(), Debug.LEVEL_WARN );
							}
						}
					}
					
					/*
					 * If we have a config node, send it along the vo.
					 * Publisher should know what to do with it.
					 */
					if ( publisher.hasOwnProperty("config") ) {
						var config:XML = new XML( publisher.config.toXMLString());
						vo.config = config;
					}
					
					_publishers.push( vo );
					
				}
			}
			
			/*
			 * Let's handle disabled packages
			 * <package id="com.enjoymondays.mvc.commands.implemented" />
			 */
			if ( _setup.hasOwnProperty("disabledPackages") ) {
				var disabledPackages:XMLList = _setup.disabledPackages;
				var id:String;
				for each( var pack:XML in disabledPackages ) {
					id = pack["package"].@id;
					_disabledPackages.push( id );
				}
			}
			
			/*
			 * Let's handle filters
			 * <filter target="com.enjoymondays.mvc.commands" level="INFO" />
			 */
			if ( _setup.hasOwnProperty("levelFilters") ) {
				var levelFilters:XMLList = _setup.levelFilters.filter;
				var target:String, level:String,fvo:LoggerFilterVO;
				for each( var filter:XML in levelFilters ) {
					target = filter.@target;
					level = filter.@level;
					fvo = new LoggerFilterVO( target, level );
					_levelFilters.push( fvo );
				}
			}
		}
		
		/** @inheritDoc */
		public function get notNullLogger():Boolean { return _logger != DEFAULT_LOGGER_ID	}
		
		
		/** @inheritDoc */
		public function get managerPackage():String { return _managerPackage; }
		
		/** @inheritDoc */
		public function get notNullDebugger():Boolean { return _debugger != DEFAULT_DEBUGGER_ID	}
		
		/** @inheritDoc */
		public function get threshold():String { return _threshold; }
		
		/** @inheritDoc */
		public function get publishers():Array { return _publishers; }
		
		/** @inheritDoc */
		public function get levelFilters():Array { return _levelFilters; }
		
		/** @inheritDoc */
		public function get disabledLevels():Array { return _disabledLevels; }
		
		/** @inheritDoc */
		public function get disabledPackages():Array { return _disabledPackages; }
		
		/** @inheritDoc */
		public function get debugger():String { return _debugger; }
		
		/** @inheritDoc */
		public function get logger():String { return _logger; }
		
	}

}