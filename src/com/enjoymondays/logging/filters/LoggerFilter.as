package com.enjoymondays.logging.filters {
	
	import com.enjoymondays.logging.core.ILoggerFilter;
	import com.enjoymondays.logging.core.ILoggerFilterManager;
	import com.enjoymondays.logging.core.ILogLevel;
	
	/**
	 * <code>LoggerFilter</code>.
	 *
	 *	@langversion ActionScript 3.0
	 *	@Flash 		 Player 9.0.28.0
	 *	@author 	 Emiliano Burgos
	 *	@url		 http://www.enjoy-mondays.com
	 *  @version 	 1.0
	 */
	public class LoggerFilter implements ILoggerFilter {
		
		/** @private **/
		protected var _priority					:int = 0;
		
		/** @private **/
		protected var _package					:String;
		
		/** @private **/
		protected var _level					:ILogLevel;
		
		/** @private **/
		protected var _manager					:ILoggerFilterManager;
		
		/** @private **/
		protected var _enabled					:Boolean = true;
		
		/** @private **/
		protected var _extrict					:Boolean = false;
		
		/** @private **/
		internal var _isRoot					:Boolean = false;
		
		
		/**
		 * <code>LoggerFilter</code>
		 * com.enjoymondays.logging.filters.LoggerFilter
		 */
		public function LoggerFilter( packageFilter:String, level:ILogLevel, enabled:Boolean = true ) {
			_package = packageFilter;
			_level = level;
			_enabled = enabled;
		}
		
		/* INTERFACE com.enjoymondays.logging.core.ILoggerFilter */
		
		public function get parent( ):ILoggerFilter {
			if ( _isRoot ) return null;
			var name:String = _package.substring( 0, _package.lastIndexOf(".") );
			return _manager.getLogFilterFor( name );
		}
		
		/**
		 *
		 * @param	l
		 */
		public function setLevel( l:ILogLevel, lock:ILoggerFilterManager ):void {
			_level = l;
		}
		
		/**
		 *
		 * @param	m
		 */
		internal function setManager( m:ILoggerFilterManager ):void {
			_manager = m;
		}
		
		public function filter( level:ILogLevel ):Boolean {
			return _level.filters( level, extrict );
			//if ( _manager.isDisabledFor( level ) ) return true;
			//if ( packageFilter && name.indexOf( packageFilter ) == -1 ) return true;
			//if ( _manager.notActive( this ) )	return true;
			//if ( _level.filters( level ) ) 		return true;
			//return false;
		}
		
		/**
		 *
		 * @return
		 */
		public function toString( ):String {
			return "[ LoggerFilter => level: " + level + ", filterPackage: " + filterPackage + "]";
		}
		
		/**
		 *
		 */
		public function get priority( ):int { return _priority }
		
		/**
		 *
		 */
		public function get level():ILogLevel { return _level }
		
		/**
		 *
		 */
		public function get filterPackage():String { return _package }
		
		/**
		 *
		 */
		public function get extrict():Boolean { return _extrict; }
		
		/**
		 *
		 */
		public function set extrict(value:Boolean):void {
			_extrict = value;
		}
		
	}

}