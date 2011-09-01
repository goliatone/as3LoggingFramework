package com.enjoymondays.logging.plugins {
	
	import flash.events.Event;
	
	/**
	 * GarbageWatchDogEvent.
	 *
	 *	@langversion ActionScript 3.0
	 *	@Flash 		 Player 9.0.28.0
	 *	@author 	 Emiliano Burgos 
	 *	@url		 http://www.enjoy-mondays.com
	 * @version 	 1.0
	 */
	public class GarbageWatchDogEvent extends Event {
		
		public static const COLLECTED 					:String = "GarbageCollected";
		
		private var _id:String;
		/**
		 * GarbageWatchDogEvent.
		 */
		public function GarbageWatchDogEvent(type:String, id:String, bubbles:Boolean=false, cancelable:Boolean=false) { 
			super(type, bubbles, cancelable);
			_id = id;
		} 
		
		public function get id( ):String {
			return _id.split("::").join(".");
		}
		/**
		 * @inheritDoc		 
		 */
		public override function clone( ):Event { 
			return new GarbageWatchDogEvent(type, id, bubbles, cancelable);
		} 
		
		/**
		 * @inheritDoc		 
		 */
		public override function toString( ):String { 
			return formatToString("GarbageWatchDogEvent", "type", "id", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}