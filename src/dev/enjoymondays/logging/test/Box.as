package dev.enjoymondays.logging.test {
	import com.enjoymondays.logging.core.ILogger;
	import com.enjoymondays.logging.Logger;
	import com.skinnygeek.utils.color.Color;
	import com.skinnygeek.utils.GraphicsUtils;
	import flash.display.Sprite;
	


	/**
	 * <code>Box</code>.
	 *
	 *	@langversion ActionScript 3.0
	 *	@Flash 		 Player 9.0.28.0
	 *	@author 	 Emiliano Burgos
	 *	@url		 http://www.paginaswebflash.com
	 * @version 	 1.0
	 */
	public class Box extends Sprite {
		
		private var _logger:ILogger;
		/**
		 * <code>Box</code>
		 * dev.enjoymondays.logging.test.Box
		 */
		public function Box(id:String) {
			_logger = Logger.instance(id);
			_logger.info("Box %0 created!",id);
		}
		
		public function draw(color:Color):void {
			//GraphicsUtils.dashRect(graphics, 0, 0, 50, 50);
			_logger.info("We crate box with color: %0", color.name);
			GraphicsUtils.drawRect(graphics, color.hexValue, 1, 0, 0, 50, 50);
		}
		
	}

}