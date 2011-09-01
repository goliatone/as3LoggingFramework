package com.enjoymondays.logging.filters {
	
	import com.enjoymondays.logging.core.ILoggerFilter;
	import com.enjoymondays.logging.core.ILoggerFilterManager;
	import com.enjoymondays.logging.core.ILogLevel;
	import com.enjoymondays.logging.core.LogLevel;
	import flash.utils.Dictionary;
	


	/**
	 * <code>LoggerFilterManager</code>.
	 *
	 *	@langversion ActionScript 3.0
	 *	@Flash 		 Player 9.0.28.0
	 *	@author 	 Emiliano Burgos
	 *	@url		 http://www.enjoy-mondays.com
	 *  @version 	 1.0
	 */
	public class LoggerFilterManager implements ILoggerFilterManager {
		
		/** @private **/
		protected var _filters							:Dictionary  = new Dictionary;
		
		/** @private **/
		private var _rootFilter							:ILoggerFilter;
		
		/**
		 * <code>LoggerFilterManager</code>
		 * com.enjoymondays.logging.filters.LoggerFilterManager
		 *
		 */
		public function LoggerFilterManager() {
			_rootFilter = new LoggerFilter( "root", LogLevel.ALL )
			LoggerFilter(_rootFilter)._isRoot = true;
		}
		
		/**
		 *
		 * @param	pk
		 * @param	level
		 * @return
		 */
		public function isFiltered( pk:String, level:ILogLevel ):Boolean {
			var f:ILoggerFilter = getLogFilterFor( pk );
			//Debug.trace("PACKAGE " + pk + " LEVEL " + level.name +", FILTER "+f.level.name, Debug.LEVEL_ERROR );
			//return f.level.filters( level );
			return f.filter( level );
		}
		
		/**
		 *
		 * @param	pk
		 * @param	level
		 */
		public function addLogFilter( pk:String, level:ILogLevel, extrict:Boolean = false ):void {
			if ( _filters[ pk ] ) return;
			var filter:LoggerFilter = new LoggerFilter( pk, level );
			filter.extrict = extrict;
			filter.setManager( this );
			_filters[ pk ] = filter;
			
		}
		
		/**
		 *
		 * @param	pk
		 * @return
		 */
		public function contains( pk:String ):Boolean {
			return Boolean( _filters[ pk ] );
		}
		
		/**
		 *
		 * @param	pk
		 * @param	level
		 */
		public function update( pk:String, level:ILogLevel ):void {
			var filter:LoggerFilter = _filters[ pk ];
			filter.setLevel( level, this );
		}
		
		/**
		 *
		 * @param	name
		 * @return
		 */
		public function getLogFilterFor( name:String ):ILoggerFilter {
			
			while( _filters[ name ] == null) {
				/*
				 * if there's no dot, this was a top level package,
				 * so the only thing left is the root
				 */
				var dotIndex:int = name.lastIndexOf(".");
				if ( dotIndex == -1 ) return rootFilter;
				
				// search the next package up
				name = name.substring( 0, dotIndex );
			}
			
			return _filters[ name ];
		}
		
		
		
		//public function
		/**
		 * @private
		 */
		private function get rootFilter( ):ILoggerFilter { return _rootFilter; }
	}

}