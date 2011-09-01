package com.enjoymondays.logging.publishers {
	import com.enjoymondays.logging.core.ILoggerPublisher;
	
	/**
	 * ...
	 * @author Emiliano Burgos
	 */
	public class ArthropodLogger extends AbstractPublisher implements ILoggerPublisher {
		
		public function ArthropodLogger() 
		{
			
		}
		
	}
	
}
/*


package com.carlcalderon.arthropod {
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.IBitmapDrawable;
	import flash.display.Stage;
	import flash.events.StatusEvent;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	import flash.net.LocalConnection;
	import flash.system.System;
	import flash.utils.ByteArray;

	public class Debug {
		
		
		public static const NAME		:String = 'Debug';
		public static const VERSION		:String = '0.74';
		
		
		
		 
		public static var password		:String = 'CDC309AF';
		
		public static var RED			:uint = 0xCC0000;
		public static var GREEN			:uint = 0x00CC00;
		public static var BLUE			:uint = 0x6666CC;
		public static var PINK			:uint = 0xCC00CC;
		public static var YELLOW		:uint = 0xCCCC00;
		public static var LIGHT_BLUE	:uint = 0x00CCCC;
		
		
		public static var ignoreStatus		:Boolean = true;
	
		public static var secure			:Boolean = false;
		
		
		public static var secureDomain		:String	 = '*';
		
		
		public static var allowLog			:Boolean = true;
		
		
		private static const DOMAIN			:String = 'com.carlcalderon.Arthropod';
		private static const CHECK			:String = '.161E714B6C1A76DE7B9865F88B32FCCE8FABA7B5.1';
		private static const TYPE			:String = 'app';
		private static const CONNECTION		:String = 'arthropod';
		
		private static const LOG_OPERATION		:String = 'debug';
		private static const ERROR_OPERATION	:String = 'debugError';
		private static const WARNING_OPERATION	:String = 'debugWarning';
		private static const ARRAY_OPERATION	:String = 'debugArray';
		private static const BITMAP_OPERATION	:String = 'debugBitmapData';
		private static const OBJECT_OPERATION	:String = 'debugObject';
		private static const MEMORY_OPERATION	:String = 'debugMemory';
		private static const CLEAR_OPERATION	:String = 'debugClear';
		
		private static var lc					:LocalConnection 	= new LocalConnection();
		private static var hasEventListeners	:Boolean 			= false;
		
		
		public static function log ( message:*, color:uint = 0xFEFEFE ) :Boolean {
			return send ( LOG_OPERATION, String ( message ) , color ) ;
		}
		
		
		public static function error ( message:* ) :Boolean {
			return send ( ERROR_OPERATION, String ( message ) , 0xCC0000 ) ;
		}
		
		
		public static function warning ( message:* ) :Boolean {
			return send ( WARNING_OPERATION, String ( message ) , 0xCCCC00 ) ;
		}
		
		
		public static function clear ( ) :Boolean {
			return send ( CLEAR_OPERATION, 0, 0x000000 ) ;
		}
		
		
		public static function array ( arr:Array ) :Boolean {
			return send ( ARRAY_OPERATION, arr,null ) ;
		}
		
		
		public static function bitmap ( bmd:*, label:String = null ) :Boolean {
			var bm:BitmapData = new BitmapData ( 100, 100, true, 0x00FFFFFF ) ;
			var mtx:Matrix = new Matrix ( ) ;
			var s:Number = 100 / (( bmd.width >= bmd.height ) ? bmd.width : bmd.height ) ;
			mtx.scale ( s, s ) ;
			bm.draw ( bmd, mtx,null,null,null,true ) ;
			var bounds:Rectangle = new Rectangle ( 0, 0, Math.floor ( bmd.width * s ) , Math.floor ( bmd.height * s ) ) ;
			return send ( BITMAP_OPERATION, bm.getPixels ( bounds ), { bounds:bounds, lbl:label } ) ;
		}
		
		public static function snapshot ( stage:Stage, label:String=null ) :Boolean {
			if ( stage )
				return bitmap ( stage, label ) ;
			return false;
		}
		
		
		public static function object ( obj:* ) :Boolean {
			return send ( OBJECT_OPERATION, obj, null ) ;
		}
		
	
		public static function memory ( ) :Boolean {
			return send ( MEMORY_OPERATION, System.totalMemory, null ) ;
		}
		
	
		private static function send( operation:String, value:*, prop:* ):Boolean {
			if (!secure) 	lc.allowInsecureDomain('*');
			else 			lc.allowDomain(secureDomain);
			if (!hasEventListeners) {
				if ( ignoreStatus ) lc.addEventListener(StatusEvent.STATUS, ignore);
				else 				lc.addEventListener(StatusEvent.STATUS, status);
				hasEventListeners = true;
			}
			if(allowLog){
				try {
					lc.send ( TYPE + '#' + DOMAIN + CHECK + ':' + CONNECTION , operation, password, value, prop ) ;
					return true;
				} catch (e:*) {
					return false;
				}
			}
			return false;
		}
		
		
		private static function status(e:StatusEvent):void {
			trace( 'Arthropod status:\n' + e.toString() );
		}
		
		
		private static function ignore(e:StatusEvent):void { }
		
	}
	
}
*/