package com.enjoymondays.logging.plugins {
	
	import flash.net.LocalConnection;
	import flash.system.System;
	import flash.utils.getQualifiedClassName;
	import flash.utils.Timer;
	
	/**
	 * <code>CacheLogger</code>.
	 *
	 *	@langversion ActionScript 3.0
	 *	@Flash 		 Player 9.0.28.0
	 *	@author 	 Emiliano Burgos
	 *	@url		 http://www.enjoy-mondays.com
	 * @version 	 1.0
	 */
	public class CacheLogger extends AbstractDebuggerPlugin {
		
		/** auto-clean memory size limit [mb] @default=0 */
		private var _sizeLimit						:Number = 0;
		
		/** auto-check memory size time delay [milisec] @default=0 if set to 0 = 'do not check'*/
		private var _checkDelay						:Number = 0;
		
		/** current memory usage */
		private var currentRamUsage					:Number = 0;
		
		/** timer instance */
		private var checkTimer						:Timer;
		
		/**
		 * <code>CacheLogger</code>.
		 * com.enjoymondays.logging.plugins.CacheLogger
		 */
		public function CacheLogger(  ) { }
		
		
		
		/**
		 * @inheritDoc
		 */
		public function logGarbageCollection( obj : *, id : String = null ):void {
			if (id == null) id = getQualifiedClassName( obj );
			_logger.info( "GarbageWatchDogEvent.ADDED =>" + id );
			var watchDog:GarbageWatchDog = new GarbageWatchDog( obj, id );
			watchDog.addEventListener( GarbageWatchDogEvent.COLLECTED, _onGarbageCollected );
		}
		
		private function _onGarbageCollected( event:GarbageWatchDogEvent ):void {
			GarbageWatchDog(event.target).removeEventListener( GarbageWatchDogEvent.COLLECTED, _onGarbageCollected );
			//log( LogLevel.GARBAGE, event.id, true);
			_logger.info( "GarbageWatchDogEvent.COLLECTED =>" +event.id );
		}
		
		/**
		 * Explicitly invoke the garbage collector
		 * @return	nothing
		 */
		public function clear():void {
			
			_logger.info("Cache.clear() called :: memory usage exceeded ::\tmemory usage: "+currentRamUsage+"mb\tmemory limit: "+_sizeLimit+"mb");
			
			try {
				new LocalConnection().connect('forceCollectHack');
				new LocalConnection().connect('forceCollectHack');
			} catch (e:*) {}
			_logger.info("\tmemory usage [after clean()]: "+_getCurrentRamUsage()+"mb");
		}
		
		private function _getCurrentRamUsage():Number {
			return Math.floor( System.totalMemory / (1024 * 1024) * 100 ) / 100;
		}
		
		
		
	}
	
}