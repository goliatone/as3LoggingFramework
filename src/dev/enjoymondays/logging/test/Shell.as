package dev.enjoymondays.logging.test {
	import com.enjoymondays.logging.core.ILogger;
	import com.enjoymondays.logging.Logger;
	import com.skinnygeek.utils.color.Color;
	import com.skinnygeek.utils.GraphicsUtils;
	import flash.display.Sprite;
	import flash.events.Event;
	


	/**
	 * <code>Shell</code>.
	 *
	 *	@langversion ActionScript 3.0
	 *	@Flash 		 Player 9.0.28.0
	 *	@author 	 Emiliano Burgos
	 *	@url		 http://www.paginaswebflash.com
	 * @version 	 1.0
	 */
	public class Shell extends Sprite {
		
		private var _logger:ILogger = Logger.instance('Shell');
		
		/**
		 * <code>Shell</code>
		 * dev.enjoymondays.logging.test.Shell
		 */
		public function Shell() {
			
			if ( stage ) _init( );
			else addEventListener(Event.ADDED_TO_STAGE, _init );
		}
			
		private function _init( e:Event = null ):void {
			removeEventListener( Event.ADDED_TO_STAGE, _init );
			_logger.warn("We create shell.");
			_logger.warn("Initialize childs: %0", 23);
			GraphicsUtils.drawRect(this.graphics, 0xff3366, 1, 0, 0, 500, 555);
			
			var box:Box;
			for (var i:int = 0; i < 9; i++) {
				for ( var j:int = 0;  j < 10; j++) {
					box = new Box( "box_" + i + "_" + j);
					box.draw( Color.getRandomColor() );
					addChild(box);
					box.x = ( box.width + 5 ) * i + 5;
					box.y = (box.height + 5 ) * j + 5;
				}
			}
		}
		
	}

}