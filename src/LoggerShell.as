package  {
	import com.enjoymondays.logging.config.LoggerConfig;
	import com.enjoymondays.logging.debuggers.NullDebugger;
	import com.enjoymondays.logging.filters.LoggerFilter;
	import com.enjoymondays.logging.filters.LoggerFilterManager;
	import com.enjoymondays.logging.formaters.converters.ClassConverter;
	import com.enjoymondays.logging.formaters.converters.DateConverter;
	import com.enjoymondays.logging.formaters.converters.FileConverter;
	import com.enjoymondays.logging.formaters.converters.LevelConverter;
	import com.enjoymondays.logging.formaters.converters.LineNumberConverter;
	import com.enjoymondays.logging.formaters.converters.LoggerPackageConverter;
	import com.enjoymondays.logging.formaters.converters.MessageConverter;
	import com.enjoymondays.logging.formaters.converters.StackConverter;
	import com.enjoymondays.logging.formaters.converters.StackPart;
	import com.enjoymondays.logging.formaters.PatternFormater;
	import com.enjoymondays.logging.formaters.XMLFormater;
	import com.enjoymondays.logging.Logger;
	import com.enjoymondays.logging.loggers.DefaultLogger;
	import com.enjoymondays.logging.loggers.NullLogger;
	import com.enjoymondays.logging.managers.LoggerManager;
	import com.enjoymondays.logging.managers.NullLoggerManager;
	import com.enjoymondays.logging.plugins.CacheLogger;
	import com.enjoymondays.logging.plugins.GarbageWatchDog;
	import com.enjoymondays.logging.plugins.GarbageWatchDogEvent;
	import com.enjoymondays.logging.plugins.ObjectDumper;
	import com.enjoymondays.logging.plugins.StackTrace;
	import com.enjoymondays.logging.plugins.StopWatchLogger;
	import com.enjoymondays.logging.publishers.AirLogger;
	import com.enjoymondays.logging.publishers.ArthropodLogger;
	import com.enjoymondays.logging.publishers.CompoundPublisher;
	import com.enjoymondays.logging.publishers.FirebugLogger;
	import com.enjoymondays.logging.publishers.JSFLTraceTarget;
	import com.enjoymondays.logging.vos.LoggerFilterVO;
	import com.enjoymondays.logging.vos.PatternVO;
	import com.enjoymondays.logging.vos.PublisherVO;
	import com.enjoymondays.logging.publishers.SGRemoteLogger;
	import com.enjoymondays.logging.publishers.SOSMaxLogger;
	import com.enjoymondays.logging.publishers.TraceLogger;
	import com.enjoymondays.logging.core.ILogger;
	import com.enjoymondays.logging.core.ILoggerConfig;
	import com.enjoymondays.logging.core.ILoggerFactory;
	import com.enjoymondays.logging.core.ILoggerManager;
	import com.enjoymondays.logging.core.LogLevel;
	import com.enjoymondays.logging.publishers.FDTracer;
	import com.enjoymondays.logging.debuggers.DefaultDebugger;
	import com.enjoymondays.logging.formaters.StringFormater;
	import com.enjoymondays.logging.publishers.AlconLogger;
	
	
	import flash.display.Sprite;

	
	/**
	 * <code>LoggerShell</code>.
	 *
	 *	@langversion ActionScript 3.0
	 *	@Flash 		 Player 9.0.28.0
	 *	@author 	 Emiliano Burgos
	 *	@url		 http://www.enjoy-mondays.com
	 * @version 	 1.0
	 */
	/**
	* @mxmlc -o=bin/assets/swf/LoggerShell.swf 
	*/
	public class LoggerShell extends Sprite {
		
		/**
		 * <code>LoggerShell</code>
		 * LoggerShell
		 */
		public function LoggerShell() {
			
			////////////////////////////////////////
			// APPENDERS
			////////////////////////////////////////
			FDTracer
			AlconLogger
			AirLogger
			ArthropodLogger
			CompoundPublisher
			FirebugLogger
			JSFLTraceTarget
			SGRemoteLogger
			SOSMaxLogger
			TraceLogger
			
			////////////////////////////////////////
			// VOS
			////////////////////////////////////////
			PublisherVO
			PatternVO
			LoggerFilterVO
			
			////////////////////////////////////////
			// DEBUGGERS
			////////////////////////////////////////
			DefaultDebugger
			NullDebugger
			
			////////////////////////////////////////
			// FORMATERS
			////////////////////////////////////////
			StringFormater
			XMLFormater
			
			PatternFormater
			//
				ClassConverter
				DateConverter
				FileConverter
				LevelConverter
				LineNumberConverter
				LoggerPackageConverter
				MessageConverter
				MessageConverter
				StackConverter
				StackPart
			////////////////////////////////////////
			// FILTERS
			////////////////////////////////////////
			LoggerFilter
			LoggerFilterManager
			
			////////////////////////////////////////
			// PLUGINS
			////////////////////////////////////////
			CacheLogger
			GarbageWatchDog
			GarbageWatchDogEvent
			ObjectDumper
			StackTrace
			StopWatchLogger
			
			////////////////////////////////////////
			// CORE
			////////////////////////////////////////
			Logger //LoggerFactory
			LoggerManager
			LoggerConfig
			
			DefaultLogger
			
			////////////////////////////////////////
			// NULLS
			////////////////////////////////////////
			NullLoggerManager
			NullDebugger
			NullLogger
		}
		
	}

}