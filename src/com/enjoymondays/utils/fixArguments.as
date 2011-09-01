package  com.enjoymondays.utils {
	
	/**
	 * Utility to fix concatenated methods that take ...rest arguments.
	 * This allows us to provide both an array and a contatenation of items.
	 *
	 * @param	parameters
	 * @return	Array
	 *
	 * @example Using the fixArguments:
	 * <listing>
	 *  argumentsFail( ["uno","dos","tres"] );
	 *  argumentsFixed( "uno","dos","tres" );
	 *  argumentsFixed( ["uno","dos","tres"] );
	 *
	 * public function argumentsFail( ...parameters ):void {
	 *    for each( var msg:String in parameters ) trace(msg);
	 * }
	 *
	 * public function argumentsFixed( ...parameters ):void {
	 * 	  parameters = fixArguments( parameters );
	 *    for each( var msg:String in parameters ) trace(msg);
	 * }
	 * </listing>
	 */
	public function fixArguments( parameters:Array ):Array {
		return (parameters.length == 1 && (parameters[0] is Array) ) ? (parameters[0] as Array) : parameters;
	}

}