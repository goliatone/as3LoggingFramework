package com.enjoymondays.logging.plugins {
	
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.Dictionary;
	import flash.utils.Timer;

	

	/**
	 * <code>GarbageWatchDog</code> watches a given object until it gets garbage collected.
	 * Because <code>GarbageWatchDog</code> holds the reference to the given object within a
	 * <code>Dictionary</code> with weak keys enabled, <code>GarbageWatchDog</code> does not prevent
	 * the monitored object to get garbage collected.
	 * 
	 * Idea found at http://www.danielhai.com/blog/?p=49
	 * 
	 */
	public class GarbageWatchDog extends EventDispatcher {
		
		private var _dictionary								:Dictionary = new Dictionary( true );
		private var _timer 									:Timer = new Timer( 500 );
		private var _id										:String;
		
		
		
		public function GarbageWatchDog(obj : *, id : String) {
			if(_dictionary[obj] == 1) return;
			_dictionary[obj] = 1;
			_id = id;
			
			_timer.addEventListener( TimerEvent.TIMER, run );
			_timer.start( );
		}
		
		public function run(e : TimerEvent) : void {
			
			for (var obj:Object in _dictionary ) return; 
			
			
			_timer.removeEventListener( TimerEvent.TIMER, run );
			_timer.stop( );
			_timer = null;
			
			dispatchEvent(new GarbageWatchDogEvent( GarbageWatchDogEvent.COLLECTED, _id ) );
			
		}
	}
}
