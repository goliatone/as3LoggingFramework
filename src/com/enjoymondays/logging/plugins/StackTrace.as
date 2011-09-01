package com.enjoymondays.logging.plugins {
	import com.enjoymondays.logging.core.IStackTrace;
	import flash.system.Capabilities;
	
	
	
	public class StackTrace implements IStackTrace {
		
		public static const NULL						:StackTrace = new StackTrace("", "", "", "" );
		
		/** @private **/
		private var _methodName							:String;
		
		/** @private **/
		private var _className							:String;
		
		/** @private **/
		private var _line								:String;
		
		/** @private **/
		private var _file								:String;
		
		/** @private **/
		private var _raw								:String;
		
		
		/**
		 *
		 * @param	methodName
		 * @param	className
		 * @param	line
		 */
		public function StackTrace( methodName:String, className:String, line:String, file:String ) {
			this.methodName = methodName;
			this.className = className;
			this.line = line;
			this.file = file;
		}
		
		/** @inheritDoc **/
		public function get methodName():String { return _methodName; }
		/** @private **/
		public function set methodName(value:String):void {
			_methodName = value;
		}
		
		/** @inheritDoc **/
		public function get className():String { return _className; }
		/** @private **/
		public function set className(value:String):void {
			_className = value;
		}
		
		/** @inheritDoc **/
		public function get line():String { return _line; }
		/** @private **/
		public function set line(value:String):void {
			_line = value;
		}
		
		/** @inheritDoc **/
		public function get file():String { return _file; }
		/** @private **/
		public function set file(value:String):void {
			_file = value;
		}
		
		/** @inheritDoc **/
		public function get raw():String { return _raw; }
		/** @private **/
		public function set raw(value:String):void {
			_raw = value;
		}
		
		/** @inheritDoc **/
		public function toString( ):String {
			return className +':' + methodName + ' @' + line;
		}
		
		/**
		 *
		 * @param	level
		 * @return
		 */
		static public function getStackTrace( level:int = 4 ):StackTrace {
			
			if ( !Capabilities.isDebugger ) return NULL;
			
			var stackTrace:String = new Error( ).getStackTrace( );
			
			var method:String, clazz:String, line:String, file:String, fullClass:String;
			
			var lines:Array = stackTrace.split( "\n" );
			
			if ( lines.length < level ) return NULL;
			
			var raw:String = lines[level];
			
			if ( ! raw ) return NULL;
			
			/*
			 *                                             -  METHOD  -                                               -  CLASS  -  -LINE-
			 * at com.skinnygeek.utils.testing::TestManager/initialize()[D:\DEV\AS3\freelance\xnographics\WpReig\tests\LoggerTest.as:34]
			 */
			method 	  = _getMethod( raw );
			line 	  = _getLineNumber( raw );
			clazz 	  = _getClassName( raw );
			file	  = _getFile( raw );
			//fullClass = _getFullClass( raw );
			
			var stack:StackTrace = new StackTrace( method, clazz, line, file );
			stack.raw = raw;
			//stack.fullClass = fullClass;
			
			return stack;
		}
		
		/**
		 *
		 * @param	stackLine
		 */
		static private function _getFile( stackLine:String ):String {
			
			if ( stackLine.indexOf("[") == -1 ) return "";
			
			var file:String = stackLine.split("[")[1];
			file = file.split("]")[0];
			file = file.split(".as:")[0];
			file += ".as";
			return file;
		}
		
		/**
		 *
		 * @param	stackLine
		 * @return
		 */
		static private function _getClassName ( stackLine:String ):String {
			if ( stackLine.indexOf("[") == -1 ) return stackLine;
			
			var clazz:String;
			clazz = stackLine.split("[")[0];
			clazz = clazz.replace( "\tat ", "" );
			clazz = clazz.split("/")[0];
			clazz = clazz.replace("::", ".");
			return clazz;
		}
		
		/**
		 *
		 * @param	stackLine
		 * @return
		 */
		static private function _getMethod ( stackLine:String ):String {
			if ( stackLine.indexOf("[") == -1 ) return "";
			
			var method:String;
			method = stackLine.split("[")[0];
			method = method.replace( "\tat ", "" );
			if ( method == "()" ) return "anonymous method";
			if( method.indexOf('/') != -1 ) method = method.split("/")[1];
			if( method.indexOf('::') != -1 ) method = method.split("::")[1];
			return method;
		}
		
		/**
		 *
		 * @param	stackLine
		 * @return
		 */
		static private function _getLineNumber( stackLine:String ):String {
			if ( stackLine.indexOf("[") == -1 ) return "";
			
			var line:String;
			line = stackLine.split("[")[1];
			if ( !line ) return "";
			line = line.split(".as:")[1];
			line = line.replace("]", "");
			return line;
		}
		
		
		static protected function _trace(o:*):void {
			//GLogger.trace( StackTrace +" : "+o );
		}
		
		
	}
}