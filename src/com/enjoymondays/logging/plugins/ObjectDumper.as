package com.enjoymondays.logging.plugins {
	
	import com.enjoymondays.utils.fixArguments;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.utils.getQualifiedClassName;
	
	
	


	/**
	 * <code>ObjectDumper</code>.
	 *
	 *	@langversion ActionScript 3.0
	 *	@Flash 		 Player 9.0.28.0
	 *	@author 	 Emiliano Burgos
	 *	@url		 http://www.enjoy-mondays.com
	 * @version 	 1.0
	 */
	public class ObjectDumper extends AbstractDebuggerPlugin {
		
		/**
		 * <code>ObjectDumper</code>
		 * com.enjoymondays.logging.plugins.ObjectDumper
		 */
		public function ObjectDumper() {
		}
		
		/**
		 *
		 * @param	o
		 * @param	indent
		 * @return
		 */
		public function print( o:*, indent:String = "" ):String {
			if ( o is DisplayObjectContainer ) return printDisplayObject( o, indent );
			else return printObject( o, indent );
		}
		
		/**
		 *
		 * @param	o
		 * @param	indent
		 * @return
		 */
		public function printObject( o:*, indent:String = "" ):String {
			var output:String="";
			if (indent == "") { indent = "\t"; } else { indent += "\t"; }
			var type:String = ( o.constructor == Array ) ? "Array" : "Object";
			output += "("+type+")=>\n";
			if( o.constructor == Array || o.constructor == Object ) {
				for (var p:String in o ) {
					if ( !o[p] ) continue;
					if( o[p].constructor == Array || o[p].constructor == Object ) {
						output += indent + "[" + p + "]";
						output += printObject( o[p], indent );
					} else { output += indent + "[" + p + "]:" + o[p] + "\n"; }
				}
			}
			return output;
		}
		
		/**
		 *
		 * @param	container
		 * @param	indent
		 * @param	...args
		 * @return
		 */
		public function printDisplayObject( container:DisplayObjectContainer, indent:String = "", ...args ):String {
			var child:DisplayObject;
			var output:String="";
			
			args = fixArguments( args );
			indent += "\t";
			output = classToString( container, args )+" => \n";
		    for (var i:uint=0; i < container.numChildren; i++) {
		        child = container.getChildAt(i);
				if (child is DisplayObjectContainer) {
					output += indent
		            output += printDisplayObject( DisplayObjectContainer(child), indent + "\t", args );
		        } else output += indent + classToString( child, args ) + "\n";
				
		    }
			return output;
		}
		
		/**
		 *
		 * @param	o
		 * @param	...args
		 * @return
		 */
		public function classToString( o:*, ...args ):String {
			var str:String =  getPackageOrClass( o );
			var prs:String = '';
			var params:Array = fixArguments( args );
			if ( params.length > 0 )
				for each ( var key:String in params ) {
					if ( key.indexOf( '.' ) != -1 ) prs += " " + key + ":" + evalDependencyChain( o, key );
					if ( o.hasOwnProperty( key ) ) prs += " " + key + ":" + o[key];
				}
				
			if ( prs.length > 0 ) str += ";";
			return "[ " + str + prs + " ]";
		}
		
		/**
		 *
		 * @param	target
		 * @param	toEval
		 * @return
		 */
		public function evalDependencyChain( target:Object, toEval:String ):Object {
			
			var a:Array = toEval.split( "." );
			var l:int = a.length;
			var p:String;
			for ( var i:int = 0; i < l; i++ ) {
				p = a[ i ];
				
				if ( target.hasOwnProperty( p ) ) target = target[ p ];
				else if ( target is DisplayObjectContainer && DisplayObjectContainer(target).getChildByName( p ) ) {
					target = DisplayObjectContainer(target).getChildByName( p );
					//GLogger.trace("OBJECT UTILS: FOUND ONE CHILD "+p);
				}else {
					//GLogger.trace("OBJECT UTILS: NO TARGET FOUND "+p);
					return null;
				}
			}
			
			return target;
		}
		
		/**
		 *
		 * @param	o
		 * @param	replaceDots
		 * @param	index
		 * @return
		 */
		public function getPackageOrClass(o:*, replaceDots:Boolean = true, index:int = 1 ):String {
			var name:String = getQualifiedClassName( o );
			if ( replaceDots && name.indexOf("::") != -1 ) name = name.split("::")[index];
			return name;
		}
	}

}