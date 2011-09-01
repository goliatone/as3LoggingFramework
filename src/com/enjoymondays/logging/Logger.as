package com.enjoymondays.logging {
	
	import com.enjoymondays.logging.core.ILogger;
	import com.enjoymondays.logging.core.ILoggerConfig;
	import com.enjoymondays.logging.core.ILoggerFactory;
	import com.enjoymondays.logging.core.ILoggerFormatter;
	import com.enjoymondays.logging.core.ILoggerManager;
	import com.enjoymondays.logging.core.ILoggerPublisher;
	import com.enjoymondays.logging.core.IPublisherVO;
	
	import flash.system.ApplicationDomain;
	

	/**
	 * This class is still named <code>Logger</code> for backwards
	 * compatibility with my previous implementation. Although in
	 * the current architecture, LoggerManager would feet the bill
	 * better.
	 *
	 *	@langversion ActionScript 3.0
	 *	@Flash 		 Player 9.0.28.0
	 *	@author 	 Emiliano Burgos
	 *	@url		 http://www.enjoy-mondays.com
	 *  @version 	 1.0
	 */
	public class Logger implements ILoggerFactory {
		
		static private var _oLF								:Logger;
		
		/** @private **/
		private var _mode									:String;
		
		/** @private **/
		private var _bean									:ApplicationDomain;
		
		/** @private **/
		protected var _manager								:ILoggerManager;
		
		/**
		 * <code>Logger</code>
		 * com.enjoymondays.logging.Logger
		 */
		public function Logger( /*lock:LoggerFactoryLock*/ ) {
			
		}
		
		/**
		 *
		 */
		static public function get factory( ):Logger { return _oLF ||= new Logger(/*LoggerFactoryLock*/) ; }
		
		/**
		* Returns the logger for the specified class. If classType is a String, that
		* string is used as the class name.
		* For any other object, the class type of that object is used.
		* Most commonly, a Class object would be used.
		*
		* <p>If this is called multiple times for the
		* same classType, the same logger will be returned rather than creating a new
		* one.
		* </p>
		*/
		public static function instance( classType:* ):ILogger {
			return factory.getLogger( classType );
		}
		
		/**
		 *
		 * @param	bean
		 * @param	xml
		 */
		public function initialize(bean:ApplicationDomain, xml:XML):void {
			setBean( bean );
			var config:ILoggerConfig = buildConfig( xml );
			buildManager( config.managerPackage );
			configure( config );
		}
		
		/**
		 * @inheritDoc
		 */
		public function setManager( manager:ILoggerManager ):void {
			_manager = manager;
		}
		
		/**
		 * @inheritDoc
		 */
		public function setBean( bean:ApplicationDomain ):void {
			_bean = bean;
		}
		
		/**
		 *
		 * @param	managerPackage
		 */
		public function buildManager(managerPackage:String):void {
			var MANAGER:Class = _bean.getDefinition( managerPackage ) as Class;
			_manager = new MANAGER
		}
		
		/**
		 *
		 * @param	xml
		 * @return
		 */
		public function buildConfig( xml:XML ):ILoggerConfig {
			var configPackage:String = xml.@build;
			var CONFIG:Class = _bean.getDefinition(configPackage) as Class;
			
			var config:ILoggerConfig = new CONFIG;
			config.fromXML( xml );
			
			return config;
		}
		
		/**
		 * @inheritDoc
		 */
		public function configure( config:ILoggerConfig ):void {
			
			/*
			 * Let's set the used logger:
			 * - NullLogger
			 * - DefaultLogger
			 */
			if ( config.notNullLogger ) {
				var logger:String = config.logger;
				var LOGGER:Class = _bean.getDefinition( logger ) as Class;
				_manager.setLogger( LOGGER );
				//Debug.trace( getQualifiedClassName( DEBUGGER ) );
			}
			
			
			/*
			 * Let's set the used debugger:
			 * - NullDebugger
			 * - DefaultDebugger
			 */
			if ( config.notNullDebugger ) {
				var debugger:String = config.debugger;
				var DEBUGGER:Class = _bean.getDefinition( debugger ) as Class;
				_manager.setDebugger( DEBUGGER );
				//Debug.trace( getQualifiedClassName( DEBUGGER ) );
			}
			
			/*
			 * Create all publishers:
			 */
			var publishers:Array = config.publishers;
			//Debug.trace( publishers.length );
			
			var target:String, formater:String, patterns:Array, delayed:Boolean,
			TARGET:Class, FORMATER:Class, aTarget:ILoggerPublisher,aFormater:ILoggerFormatter;
			for each( var publisher:IPublisherVO in publishers ) {
				
				target   = publisher.targetBuild;
				formater = publisher.formaterBuild;
				delayed  = publisher.delayed;
				patterns = publisher.formaterPatterns;
				
				TARGET 	 = _bean.getDefinition( target ) as Class;
				FORMATER = _bean.getDefinition( formater ) as Class;
				
				/*
				 *
				 */
				aTarget = new TARGET( delayed );
				aTarget.configure( publisher.config );
				
				/*
				 * We can configure our formater.
				 */
				aFormater = new FORMATER( );
				aFormater.setLevelPatterns( patterns );
				
				/*
				 * REVISION create instance, configure instance, and pass that.
				 */
				_manager.addPublisher( aTarget, aFormater );
				
			}
			
			/*
			 * Set global threshold.
			 */
			var threshold:String = config.threshold.toUpperCase();
			_manager.setGlobalThreshold( threshold );
			
			/**
			 * Set disabled levels.
			 */
			var disabledLevels:Array = config.disabledLevels;
			_manager.disableLevels( disabledLevels );
			
			
			/*
			 * Set disabled packages:
			 */
			var PACKAGES:Array = config.disabledPackages;
			_manager.disablePackages( PACKAGES );
			
		}
		
		/**
		 * @inheritDoc
		 */
		public function getLogger( forItem:* ):ILogger {
			return _manager.getLogger( forItem );
		}
	}
}

//internal class LoggerFactoryLock {}