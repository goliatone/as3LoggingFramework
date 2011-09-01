package  {
	import com.enjoymondays.logging.core.LogLevel;
	import com.enjoymondays.logging.core.LogMessage;
	import com.enjoymondays.logging.formaters.PatternFormater;
	import com.enjoymondays.logging.plugins.StackTrace;
	import com.hexagonstar.util.debug.Debug;
	import flash.display.Sprite;
	import flash.events.Event;
	


	/**
	 * <code>FormatterTest</code>.
	 *
	 *	@langversion ActionScript 3.0
	 *	@Flash 		 Player 9.0.28.0
	 *	@author 	 Emiliano Burgos
	 *	@url		 http://www.paginaswebflash.com
	 * @version 	 1.0
	 */
	public class FormatterTest extends Sprite {
		
		
		/**
		 * <code>FormatterTest</code>
		 * .FormatterTest
		 */
		public function FormatterTest() {
			if ( stage ) _init( );
			else addEventListener(Event.ADDED_TO_STAGE, _init );
		}
			
		private function _init( e:Event = null ):void {
			removeEventListener( Event.ADDED_TO_STAGE, _init );
			
			//Debug.clear();
			
			var formater:PatternFormater = new PatternFormater;
			formater.defaultPattern = "File[ %F ] :: Line[%L] %n %d{H:i:s} (%5p) Class[%C{10}]::Method[%M] >> %n %m";
			//formater.defaultPattern = "%c{10} - %m%n";
			var level:LogLevel = LogLevel.INFO;
			var legend:String = "Este es un messsage";
			var time:String = new Date().getTime().toString();
			var stack:StackTrace = StackTrace.getStackTrace( 2 );
			
			var message:LogMessage = new LogMessage( level, legend, time, stack );
			message.logger = "com.skinnygeek.Test";
			
			var output:String = formater.format( message );
			
			Debug.clear();
			/*Debug.trace( new Error( ).getStackTrace( ) );
			Debug.trace( stack.raw );
			Debug.trace( stack.className );
			Debug.trace( stack.methodName );*/
			Debug.trace( output );
		}
	}

}