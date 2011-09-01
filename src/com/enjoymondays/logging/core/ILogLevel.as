package  com.enjoymondays.logging.core {
	
	/**
	 * ILogLevel.
	 *
	 *	@langversion ActionScript 3.0
	 *	@Flash 		 Player 9.0.28.0
	 *	@author 	 Emiliano Burgos
	 *	@url		 http://www.enjoy-mondays.com
	 * @version 	 1.0
	 */
	public interface ILogLevel {
		
		/**
		 *
		 */
		function get name( ):String
		
		/**
		 *
		 */
		function get value( ):int
		
		/**
		 *
		 * @return
		 */
		function valueOf( ):int
		
		/**
		 *
		 * @param	level
		 * @return
		 */
		function passes( level:ILogLevel ):Boolean
		
		/**
		 *
		 * @param	level
		 * @return
		 */
		function filters( level:ILogLevel, extrict:Boolean = false ):Boolean
		
		/**
		 *
		 * @param	level
		 * @return
		 */
		function equalTo( level:ILogLevel ):Boolean
		
		/**
		 * @see Object#toString()
		 */
		function toString( ):String
	}
	
}