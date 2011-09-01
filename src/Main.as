package {
	
	import com.enjoymondays.logging.core.ILogger;
	import com.enjoymondays.logging.Logger;
	import dev.enjoymondays.logging.test.Shell;
	
	
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	
	/**
	 * ...
	 * @author Emiliano Burgos
	 */
	public class Main extends Sprite {
		
		private var _logger					:ILogger;
		private var _bean					:ApplicationDomain;
		
		
		
		public function Main():void {
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(evnt:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			//var l:Logger;
			
			//new LoggerShell;
			//Debug.clear();
			//Debug.trace("INIT");
			
			//_testFormater();
			_loadSheel( );
			//_loadConfig( );
			//Debug.trace("done");
			
		}
		
		private function _testFormater( ):void {
			//var formater:PatternFormater = new PatternFormater;
			//formater.conversionPattern = "%d{H:i:s} [%5p] %c{10} >> %n %m";
			//formater.conversionPattern = "%c{10} - %m%n";
			//var level:LogLevel = LogLevel.INFO;
			//var legend:String = "Este es un messsage";
			//var time:String = new Date().getTime().toString();
			//var stack:StackTrace = StackTrace.getStackTrace( );
			//
			//var message:LogMessage = new LogMessage( level, legend, time, stack );
			//message.logger = "com.skinnygeek.TEst";
			//
			//var output:String = formater.format( message );
			//Debug.trace( output );
		}
		
		private function _loadSheel( ):void {
			
			var url:String = "assets/swf/LoggerShell.swf";
			var loader:Loader = new Loader( );
			loader.contentLoaderInfo.addEventListener( Event.COMPLETE, _onLoaded );
			loader.load(new URLRequest( url ) );
			/*
			var loaderVO:LoaderVO = new LoaderVO( url );
			var command:LoaderCommand = new LoaderCommand( loaderVO );
			command.addEventListener(Event.COMPLETE, _onLoaded );
			command.execute(null);
			*/
		}
		
		private function _onLoaded(e:Event):void {
			//Debug.trace("LOADED");
			/*
			var command:LoaderCommand = e.currentTarget as LoaderCommand;
			_bean = command.applicationDomain;
			*/
			_bean = e.target.applicationDomain;
			_loadConfig();
		}
		
		private function _loadConfig( ):void {
			
			var loader:URLLoader = new URLLoader();
			
			/*var loader:ModelLoader = new ModelLoader;*/
			loader.addEventListener( Event.COMPLETE, _onModelLoaded );
			loader.load( new URLRequest("assets/xml/loggerconfig.xml"));
		}
		
		private function _onModelLoaded(e:Event):void {
			
			
			var xml:XML = XML( e.target.data as String );
			xml.@mode = 'debug';
			//xml.@mode = 'remote';
			//xml.@mode = 'release';
			
			var FACTORY:Class = loaderInfo.applicationDomain.getDefinition("com.enjoymondays.logging.Logger") as Class;
			var factory:Logger = FACTORY['factory'];
			factory.initialize( _bean, xml );
			
			//_createLogger( );
			//_runTest( );
			_loadTest();
			
		}
		
		private function _loadTest():void{
			var shell:Shell = new Shell;
			addChild( shell );
			shell.x = Math.round((stage.stageWidth - shell.width) / 2);
			shell.y = Math.round((stage.stageHeight - shell.height) / 2);
		}
		
		private function _runTest():void {
			var a:ILogger = Logger.instance( 'ObjectUtils' );
			var b:ILogger = Logger.instance( 'ArrayUtils' );
			var c:ILogger = Logger.instance( 'View' );
			var d:ILogger = Logger.instance( 'BaseCommand' );
			var e:ILogger = Logger.instance( 'PreloadAssetsCommand' );
			
			
			//LoggerManager.factory.disableLevels( LogLevel.INFO, LogLevel.DEBUG, LogLevel.WARN );
			//LoggerManager.factory.disablePackages( "com.skinnygeek.mvc.commands.implemented" );
			//LoggerManager.factory.addLevelFilter( "com.skinnygeek.mvc.view", LogLevel.INFO );
			//LoggerManager.factory.addLevelFilter( "com.skinnygeek.mvc.commands", LogLevel.INFO );
			
			//_logger.info("logger %0 name is %1", "a",a.name );
			//_logger.info("logger %0 name is %1", "b",b.name );
			//_logger.info("logger %0 name is %1", "c",c.name );
			//_logger.info("logger %0 name is %1", "d",d.name );
			//_logger.info("logger %0 name is %1", "e", e.name );
			
			a.info("WE ARE OK %0",a.name );
			b.info("WE ARE OK %0",b.name );
			c.info("INFO ARE OK %0",c.name );
			c.warn("WARN ARE OK %0",c.name );
			d.info("INFO OK %0",d.name );
			d.warn("WARN OK %0",d.name );
			e.info("INFO OK %0",e.name );
			e.warn("WARN OK %0",e.name );
			e.error("ERROR OK %0",e.name );
		}
		
		private function _createLogger( ):void {
			
			_logger  = Logger.instance( Main );
			
			_logger.debugger.startStopwatch( "Test");
			
			var o:Object = { };
			o.name = "Pepe";
			o.age = 23;
			o.book = { };
			o.book.title = "Good Morning";
			o.book.isbn = 21435346;
			
			_logger.debugger.print( o );
			
			_logger.debugger.logGarbageCollection( 0, "Pepe");
			
			o = null;
			
			_logger.debugger.stopStopwatch();
		}
		
		private function _onError(e:IOErrorEvent):void {
			//Debug.trace("error");
		}
	}
	
}