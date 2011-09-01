package com.enjoymondays.logging.utils {
	
	
	/**
	 * TODO Support localized strings.
	 *
	 * Modifed from net.guttershark.util.DateUtils
	 *
	 * <code>DateUtils</code>.
	 *
	 *	@langversion ActionScript 3.0
	 *	@Flash 		 Player 9.0.28.0
	 *	@author 	 Emiliano Burgos
	 *	@url		 http://www.paginaswebflash.com
	 *  @version 	 1.0
	 */
	public class DateUtils {
		
		private static const MONTHS_EN					:Array = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
		private static const MONTHS_SHORT_EN			:Array = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
		private static const DAYS_EN					:Array = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
		private static const DAYS_SHORT_EN				:Array = ["Sun", "Mon", "Tue", "Wed", "Thur", "Fri", "Sat"];
		
		/**
		 * @private
		 */
		private var _currentDate						:Date;
		
		/**
		 * <code>DateUtils</code>
		 * com.enjoymondays.logging.utils.DateUtils
		 *
		 * @param	skin
		 * @param	style
		 */
		public function DateUtils() {
			_currentDate = new Date;
		}
		
		/**
			Formats a Date object for display. Acts almost identically to the PHP <code>date</code> function.
			<table border="1">
				<tr style="background-color:#e1e1e1;">
					<th style="width:150px;">Format character</th>
					<th>Description</th>
					<th style="width:200px;">Example returned values</th>
				</tr>
				<tr>
					<td>d</td>
					<td>Day of the month, 2 digits with leading zeros.</td>
					<td>01 to 31</td>
				</tr>
				<tr style="background-color:#f0f5f9;">
					<td>D</td>
					<td>A textual representation of a day, three letters.</td>
					<td>Mon through Sun</td>
				</tr>
				<tr>
					<td>j</td>
					<td>Day of the month without leading zeros.</td>
					<td>1 to 31</td>
				</tr>
				<tr style="background-color:#f0f5f9;">
					<td>l</td>
					<td>A full textual representation of the day of the week.</td>
					<td>Sunday through Saturday</td>
				</tr>
				<tr>
					<td>N</td>
					<td>ISO-8601 numeric representation of the day of the week.</td>
					<td>1 (for Monday) through 7 (for Sunday)</td>
				</tr>
				<tr style="background-color:#f0f5f9;">
					<td>S</td>
					<td>English ordinal suffix for the day of the month, 2 characters.</td>
					<td>st, nd, rd or th</td>
				</tr>
				<tr>
					<td>w</td>
					<td>Numeric representation of the day of the week.</td>
					<td>0 (for Sunday) through 6 (for Saturday)</td>
				</tr>
				<tr style="background-color:#f0f5f9;">
					<td>z</td>
					<td>The day of the year (starting from 0).</td>
					<td>0 through 365</td>
				</tr>
				<tr>
					<td>W</td>
					<td>ISO-8601 week number of year, weeks starting on Monday.</td>
					<td>Example: 42 (the 42nd week in the year)</td>
				</tr>
				<tr style="background-color:#f0f5f9;">
					<td>F</td>
					<td>A full textual representation of a month, such as January or March.</td>
					<td>January through December</td>
				</tr>
				<tr>
					<td>m</td>
					<td>Numeric representation of a month, with leading zeros.</td>
					<td>01 through 12</td>
				</tr>
				<tr style="background-color:#f0f5f9;">
					<td>M</td>
					<td>A short textual representation of a month, three letters.</td>
					<td>Jan through Dec</td>
				</tr>
				<tr>
					<td>n</td>
					<td>Numeric representation of a month, without leading zeros.</td>
					<td>1 through 12</td>
				</tr>
				<tr style="background-color:#f0f5f9;">
					<td>t</td>
					<td>Number of days in the given month.</td>
					<td>28 through 31</td>
				</tr>
				<tr>
					<td>L</td>
					<td>Determines if it is a leap year.</td>
					<td>1 if it is a leap year, 0 otherwise</td>
				</tr>
				<tr style="background-color:#f0f5f9;">
					<td>o or Y</td>
					<td>A full numeric representation of a year, 4 digits.</td>
					<td>Examples: 1999 or 2003</td>
				</tr>
				<tr>
					<td>y</td>
					<td>A two digit representation of a year.</td>
					<td>Examples: 99 or 03</td>
				</tr>
				<tr style="background-color:#f0f5f9;">
					<td>a</td>
					<td>Lowercase Ante meridiem and Post meridiem.</td>
					<td>am or pm</td>
				</tr>
				<tr>
					<td>A</td>
					<td>Uppercase Ante meridiem and Post meridiem.</td>
					<td>AM or PM</td>
				</tr>
				<tr style="background-color:#f0f5f9;">
					<td>B</td>
					<td>Swatch Internet time.</td>
					<td>000 through 999</td>
				</tr>
				<tr>
					<td>g</td>
					<td>12-hour format of an hour without leading zeros.</td>
					<td>1 through 12</td>
				</tr>
				<tr style="background-color:#f0f5f9;">
					<td>G</td>
					<td>24-hour format of an hour without leading zeros.</td>
					<td>0 through 23</td>
				</tr>
				<tr>
					<td>h</td>
					<td>12-hour format of an hour with leading zeros.</td>
					<td>01 through 12</td>
				</tr>
				<tr style="background-color:#f0f5f9;">
					<td>H</td>
					<td>24-hour format of an hour with leading zeros.</td>
					<td>00 through 23</td>
				</tr>
				<tr>
					<td>i</td>
					<td>Minutes with leading zeros.</td>
					<td>00 to 59</td>
				</tr>
				<tr style="background-color:#f0f5f9;">
					<td>s</td>
					<td>Seconds, with leading zeros.</td>
					<td>00 through 59</td>
				</tr>
				<tr>
					<td>I</td>
					<td>Determines if the date is in daylight saving time.</td>
					<td>1 if Daylight Saving Time, 0 otherwise</td>
				</tr>
				<tr style="background-color:#f0f5f9;">
					<td>O</td>
					<td>Difference to coordinated universal time (UTC) in hours.</td>
					<td>Example: +0200</td>
				</tr>
				<tr>
					<td>P</td>
					<td>Difference to Greenwich time (GMT/UTC) in hours with colon between hours and minutes.</td>
					<td>Example: +02:00</td>
				</tr>
				<tr style="background-color:#f0f5f9;">
					<td>e or T</td>
					<td>Timezone abbreviation.</td>
					<td>Examples: EST, MDT</td>
				</tr>
				<tr>
					<td>Z</td>
					<td>Timezone offset in seconds.</td>
					<td>-43200 through 50400</td>
				</tr>
				<tr style="background-color:#f0f5f9;">
					<td>c</td>
					<td>ISO 8601 date.</td>
					<td>2004-02-12T15:19:21+00:00</td>
				</tr>
				<tr>
					<td>r</td>
					<td>RFC 2822 formatted date.</td>
					<td>Example: Thu, 21 Dec 2000 16:01:07 +0200</td>
				</tr>
				<tr style="background-color:#f0f5f9;">
					<td>U</td>
					<td>Seconds since the Unix Epoch.</td>
					<td>Example: 1171479314</td>
				</tr>
			</table>
			
			@param dateToFormat: The Date object you wish to format.
			@param formatString: The format of the outputted date String. See the format characters options above.
			@usageNote You can prevent a recognized character in the format string from being expanded by escaping it with a preceding <code>^</code>.
			@example
				<code>
					trace(DateUtil.formatDate(new Date(), "l ^t^h^e dS ^of F Y h:i:s A"));
				</code>
		*/
		public function formatDate(dateToFormat:Date, formatString:String):String {
			var returnString:String = '';
			var char:String;
			var i:int = -1;
			var l:uint = formatString.length;
			var t:Number;
			
			while (++i < l) {
				char = formatString.substr(i, 1);
				
				if (char == '^')
					returnString += formatString.substr(++i, 1);
				else {
					switch (char) {
						// Day of the month, 2 digits with leading zeros
						case 'd' :
							returnString += _addLeadingZero(dateToFormat.getDate());
							break;
						// A textual representation of a day, three letters
						case 'D' :
							returnString += getDayAbbrAsString(dateToFormat.getDay());
							break;
						// Day of the month without leading zeros
						case 'j' :
							returnString += dateToFormat.getDate().toString();
							break;
						// A full textual representation of the day of the week
						case 'l' :
							returnString += getDayAsString(dateToFormat.getDay());
							break;
						// ISO-8601 numeric representation of the day of the week
						case 'N' :
							t = dateToFormat.getDay();
							
							if (t == 0)
								t = 7;
							
							returnString += t.toString();
							break;
						// English ordinal suffix for the day of the month, 2 characters
						case 'S' :
							returnString += _getOrdinalSuffix(dateToFormat.getDate());
							break;
						// Numeric representation of the day of the week
						case 'w' :
							returnString += dateToFormat.getDay().toString();
							break;
						// The day of the year (starting from 0)
						case 'z' :
							returnString += _addLeadingZero(getDayOfTheYear(dateToFormat)).toString();
							break;
						// ISO-8601 week number of year, weeks starting on Monday
						case 'W' :
							returnString += _addLeadingZero(getWeekOfTheYear(dateToFormat)).toString();
							break;
						// A full textual representation of a month, such as January or March
						case 'F' :
							returnString += getMonthAsString(dateToFormat.getMonth());
							break;
						// Numeric representation of a month, with leading zeros
						case 'm' :
							returnString += _addLeadingZero(dateToFormat.getMonth() + 1);
							break;
						// A short textual representation of a month, three letters
						case 'M' :
							returnString += getMonthAbbrAsString(dateToFormat.getMonth());
							break;
						// Numeric representation of a month, without leading zeros
						case 'n' :
							returnString += (dateToFormat.getMonth() + 1).toString();
							break;
						// Number of days in the given month
						case 't' :
							returnString += getDaysInMonth(dateToFormat.getMonth(), dateToFormat.getFullYear()).toString();
							break;
						// Whether it is a leap year
						case 'L' :
							returnString += (isLeapYear(dateToFormat.getFullYear())) ? '1' : '0';
							break;
						// A full numeric representation of a year, 4 digits
						case 'o' :
						case 'Y' :
							returnString += dateToFormat.getFullYear().toString();
							break;
						// A two digit representation of a year
						case 'y' :
							returnString += dateToFormat.getFullYear().toString().substr(-2);
							break;
						// Lowercase Ante meridiem and Post meridiem
						case 'a' :
							returnString += getMeridiem(dateToFormat.getHours()).toLowerCase();
							break;
						// Uppercase Ante meridiem and Post meridiem
						case 'A' :
							returnString += getMeridiem(dateToFormat.getHours());
							break;
						// Swatch Internet time
						case 'B' :
							returnString += _format(getInternetTime(dateToFormat), 3, null, '0');
							break;
						// 12-hour format of an hour without leading zeros
						case 'g' :
							t = dateToFormat.getHours();
							
							if (t == 0)
								t = 12;
							else if (t > 12)
								t -= 12;
							
							returnString += t.toString();
							break;
						// 24-hour format of an hour without leading zeros
						case 'G' :
							returnString += dateToFormat.getHours().toString();
							break;
						// 12-hour format of an hour with leading zeros
						case 'h' :
							t = dateToFormat.getHours() + 1;
							
							if (t == 0)
								t = 12;
							else if (t > 12)
								t -= 12;
							
							returnString += _addLeadingZero(t);
							break;
						// 24-hour format of an hour with leading zeros
						case 'H' :
							returnString += _addLeadingZero(dateToFormat.getHours());
							break;
						// Minutes with leading zeros
						case 'i' :
							returnString += _addLeadingZero(dateToFormat.getMinutes());
							break;
						// Seconds, with leading zeros
						case 's' :
							returnString += _addLeadingZero(dateToFormat.getSeconds());
							break;
						// Whether or not the date is in daylights savings time
						case 'I' :
							returnString += (isDaylightSavings(dateToFormat)) ? '1' : '0';
							break;
						// Difference to Greenwich time (GMT/UTC) in hours
						case 'O' :
							returnString += getFormattedDifferenceFromUTC(dateToFormat);
							break;
						case 'P' :
							returnString += getFormattedDifferenceFromUTC(dateToFormat, ':');
							break;
						// Timezone identifier
						case 'e' :
						case 'T' :
							returnString += getTimezone(dateToFormat);
							break;
						// Timezone offset (GMT/UTC) in seconds.
						case 'Z' :
							returnString += Math.round(getDifferenceFromUTCInSeconds(dateToFormat)).toString();
							break;
						// ISO 8601 date
						case 'c' :
							returnString += dateToFormat.getFullYear() + "-" + _addLeadingZero(dateToFormat.getMonth() + 1) + "-" + _addLeadingZero(dateToFormat.getDate()) + "T" + _addLeadingZero(dateToFormat.getHours()) + ":" + _addLeadingZero(dateToFormat.getMinutes()) + ":" + _addLeadingZero(dateToFormat.getSeconds()) + getFormattedDifferenceFromUTC(dateToFormat, ':');
							break;
						// RFC 2822 formatted date
						case 'r' :
							returnString += getDayAbbrAsString(dateToFormat.getDay()) + ', ' + dateToFormat.getDate() + ' ' + getMonthAbbrAsString(dateToFormat.getMonth()) + ' ' + dateToFormat.getFullYear() + ' ' + _addLeadingZero(dateToFormat.getHours()) + ':' + _addLeadingZero(dateToFormat.getMinutes()) + ':' + _addLeadingZero(dateToFormat.getSeconds()) + ' ' + getFormattedDifferenceFromUTC(dateToFormat);
							break;
						// Seconds since the Unix Epoch (January 1 1970 00:00:00 GMT)
						case 'U' :
							t = Math.round(dateToFormat.getTime() / 1000);
							returnString += t.toString();
							break;
						default :
							returnString += formatString.substr(i, 1);
					}
				}
			}
			
			
			return returnString;
		}
		
		/**
		 * 0 indexed array of months for use with <code>getMonth()</code>.
		 */
		public function get months( ):Array { return MONTHS_EN; }
		
		/**
		 * 0 indexed array of short months for use with <code>getMonth()</code>.
		 */
		public function get shortmonths():Array { return MONTHS_SHORT_EN }
		
		/**
		 * 0 indexed array of days for use with <code>getDay()</code>.
		 */
		public function get days():Array { return DAYS_EN }
		
		/**
		 * 0 indexed array of short days for use with <code>getDay()</code>.
		 */
		public function get shortdays():Array { return DAYS_SHORT_EN; }
		
		/**
		 * Get the month name by month number.
		 *
		 * @param n The 0 based month index.
		 */
		public function getMonth(n:int):String {
			return months[n];
		}
		
		/**
		 * Get the short month name by month number.
		 *
		 * @param n The 0 based month index.
		 */
		public function getShortMonth(n:int):String {
			return shortmonths[n];
		}
		
		/**
		 * Get the day name by day number.
		 *
		 * @param n The 0 based day index.
		 */
		public function getDay(n:int):String {
			return days[n];
		}
		
		
		
		/**
		 * Convert a DB formatted date string into a Flash Date Object.
		 *
		 * @param dbDate A date formatted like YYYY-MM-DD HH:MM:SS.
		 */
		public function fromString( dbdate:String ):Date {
			var tmp:Array = dbdate.split(" ");
			var dates:Array = tmp[0].split("-");
			var hours:Array = tmp[1].split(":");
			var d:Date = new Date(dates[0], dates[1] - 1, dates[2], hours[0], hours[1], hours[2]);
			return d;
		}
		
		//public function toString( date:Date ):String {
			//var year:String = date.getFullYear( ).toString( );
			//var month:String = date.getMonth( )
		//}
		
		
		/**
			Converts the month number into the full month name.
			
			@param month: The month number (0 for January, 1 for February, and so on).
			@return Returns a full textual representation of a month, such as January or March.
			@example
				<code>
					var myDate:Date = new Date(2000, 0, 1);
					
					trace(DateUtil.getMonthAsString(myDate.getMonth())); // Traces January
				</code>
		*/
		public function getMonthAsString(month:Number, months:Array = null ):String {
			months = months || MONTHS_EN;
			return months[month];
		}
		
		/**
			Converts the month number into the month abbreviation.
			
			@param month: The month number (0 for January, 1 for February, and so on).
			@return Returns a short textual representation of a month, three letters.
			@example
				<code>
					var myDate:Date = new Date(2000, 0, 1);
					
					trace(DateUtil.getMonthAbbrAsString(myDate.getMonth())); // Traces Jan
				</code>
		*/
		public function getMonthAbbrAsString(month:Number, length:int = 3, months:Array = null ):String {
			return getMonthAsString( month, months ).substr(0, length );
		}
		
		/**
			Converts the day of the week number into the full day name.
			
			@param day: An integer representing the day of the week (0 for Sunday, 1 for Monday, and so on).
			@return Returns a full textual representation of the day of the week.
			@example
				<code>
					var myDate:Date = new Date(2000, 0, 1);
					
					trace(DateUtil.getDayAsString(myDate.getDay())); // Traces Saturday
				</code>
		*/
		public function getDayAsString(day:Number, days:Array = null ):String {
			days = days || DAYS_EN;
			return days[day];
		}
		
		/**
			Converts the day of the week number into the day abbreviation.
			
			@param day: An integer representing the day of the week (0 for Sunday, 1 for Monday, and so on).
			@return Returns a textual representation of a day, three letters.
			@example
				<code>
					var myDate:Date = new Date(2000, 0, 1);
					
					trace(DateUtil.getDayAbbrAsString(myDate.getDay())); // Traces Sat
				</code>
		*/
		public function getDayAbbrAsString(day:Number,length:int = 3, days:Array = null ):String {
			return getDayAsString( day, days ).substr(0, length);
		}
		
		/**
			Finds the number of days in the given month.
			
			@param year: The full year.
			@param month: The month number (0 for January, 1 for February, and so on).
			@return The number of days in the month; 28 through 31.
			@example
				<code>
					var myDate:Date = new Date(2000, 0, 1);
					
					trace(DateUtil.getDaysInMonth(myDate.getFullYear(), myDate.getMonth())); // Traces 31
				</code>
		*/
		public function getDaysInMonth( year:Number, month:Number ):uint {
			return (new Date(year, ++month, 0)).getDate();
		}
		
		/**
			Determines if time is Ante meridiem or Post meridiem.
			
			@param hours: The hour to find the meridiem of (an integer from 0 to 23).
			@return Returns either <code>"AM"</code> or <code>"PM"</code>
			@example
				<code>
					trace(DateUtil.getMeridiem(17)); // Traces PM
				</code>
		*/
		public function getMeridiem(hours:Number):String {
			return (hours < 12) ? 'AM' : 'PM';
		}
		
		/**
			Determines the difference between two dates.
			
			@param startDate: The starting date.
			@param endDate: The ending date.
			@return Returns the difference in milliseconds between the two dates.
			@example
				<code>
					trace(ConversionUtil.millisecondsToDays(DateUtil.getTimeBetween(new Date(2007, 0, 1), new Date(2007, 0, 11)))); // Traces 10
				</code>
		*/
		public function getTimeBetween(startDate:Date, endDate:Date):Number {
			return endDate.getTime() - startDate.getTime();
		}
		
		
		/**
			Determines the difference to coordinated universal time (UTC) in seconds.
			
			@param d: Date object to find the time zone offset of.
			@return Returns the difference in seconds from UTC.
		*/
		public function getDifferenceFromUTCInSeconds(d:Date):int {
			return minutesToSeconds(d.getTimezoneOffset());
		}
		
		/**
			Determines the difference to coordinated universal time (UTC) in hours.
			
			@param d: Date object to find the time zone offset of.
			@return Returns the difference in hours from UTC.
		*/
		public function getDifferenceFromUTCInHours(d:Date):int {
			return minutesToHours(d.getTimezoneOffset());
		}
		
		
		/**
			Formats the difference to coordinated undefined time (UTC).
			
			@param d: Date object to find the time zone offset of.
			@param separator: The character(s) that separates the hours from minutes.
			@return Returns the formatted time difference from UTC.
		*/
		public function getFormattedDifferenceFromUTC(d:Date, separator:String = ""):String {
			var pre:String = (-d.getTimezoneOffset() < 0) ? '-' : '+';
			
			return pre + _addLeadingZero(Math.floor(getDifferenceFromUTCInHours(d))) + separator + _addLeadingZero(d.getTimezoneOffset() % 60);
		}
		
		/**
			Determines the time zone of the user from a Date object.
			
			@param d: Date object to find the time zone of.
			@return Returns the time zone abbreviation.
			@example
				<code>
					trace(DateUtil.getTimezone(new Date()));
				</code>
		*/
		public function getTimezone(d:Date):String {
			var timeZones:Array = new Array('IDLW', 'NT', 'HST', 'AKST', 'PST', 'MST', 'CST', 'EST', 'AST', 'ADT', 'AT', 'WAT', 'GMT', 'CET', 'EET', 'MSK', 'ZP4', 'ZP5', 'ZP6', 'WAST', 'WST', 'JST', 'AEST', 'AEDT', 'NZST');
			var hour:uint       = Math.round(12 + -(d.getTimezoneOffset() / 60));
			
			if (isDaylightSavings(d)) hour--;
			
			return timeZones[hour];
		}
		
		/**
			Determines if year is a leap year or a common year.
			
			@param year: The full year.
			@return Returns <code>true</code> if year is a leap year; otherwise <code>false</code>.
			@example
				<code>
					var myDate:Date = new Date(2000, 0, 1);
					
					trace(DateUtil.isLeapYear(myDate.getFullYear())); // Traces true
				</code>
		*/
		public function isLeapYear(year:Number):Boolean {
			return getDaysInMonth(year, 1) == 29;
		}
		
		/**
			Determines if or not the date is in daylight saving time.
			
			@param d: Date to find if it is during daylight savings time.
			@return Returns <code>true</code> if daylight savings time; otherwise <code>false</code>.
		*/
		public function isDaylightSavings(d:Date):Boolean {
			var months:uint = 12;
			var offset:uint = d.getTimezoneOffset();
			var offsetCheck:Number;
			
			while (months--) {
				offsetCheck = (new Date(d.getFullYear(), months, 1)).getTimezoneOffset();
				
				if (offsetCheck != offset)
					return (offsetCheck > offset);
			}
			
			return false;
		}
		
		/**
			Converts current time into Swatch internet time or beats.
			
			@param d: Date object to convert.
			@return Returns time in beats (0 to 999).
		*/
		public function getInternetTime(d:Date):Number {
			var beats:uint = ((d.getUTCHours() + 1 + minutesToHours(d.getUTCMinutes()) + secondsToHours(d.getUTCSeconds())) / 0.024);
			return (beats > 1000) ? beats - 1000 : beats;
		}
		
		
		/**
			Gets the current day out of the total days in the year (starting from 0).
			
			@param d: Date object to find the current day of the year from.
			@return Returns the current day of the year (0-364 or 0-365 on a leap year).
		*/
		public function getDayOfTheYear(d:Date):uint {
			var firstDay:Date = new Date(d.getFullYear(), 0, 1);
			return (d.getTime() - firstDay.getTime()) / 86400000;
		}
		
		/**
			Determines the week number of year, weeks start on Mondays.
			
			@param d: Date object to find the current week number of.
			@return Returns the the week of the year the date falls in.
		*/
		public function getWeekOfTheYear(d:Date):uint {
			var firstDay:Date    = new Date(d.getFullYear(), 0, 1);
			var dayOffset:uint   = 9 - firstDay.getDay();
			var firstMonday:Date = new Date(d.getFullYear(), 0, (dayOffset > 7) ? dayOffset - 7 : dayOffset);
			var currentDay:Date  = new Date(d.getFullYear(), d.getMonth(), d.getDate());
			var weekNumber:uint  = ( millisecondsToDays( currentDay.getTime() - firstMonday.getTime()) / 7) + 1;
			
			return (weekNumber == 0) ? getWeekOfTheYear(new Date(d.getFullYear() - 1, 11, 31)) : weekNumber;
		}
		
		///////////
		public function millisecondsToSeconds(milliseconds:Number):Number {
			return milliseconds / 1000;
		}
		
		/**
			Converts milliseconds to minutes.
			
			@param milliseconds: The number of milliseconds.
			@return Returns the number of minutes.
		*/
		public function millisecondsToMinutes(milliseconds:Number):Number {
			return secondsToMinutes(millisecondsToSeconds(milliseconds));
		}
		
		/**
			Converts milliseconds to hours.
			
			@param milliseconds: The number of milliseconds.
			@return Returns the number of hours.
		*/
		public function millisecondsToHours(milliseconds:Number):Number {
			return minutesToHours(millisecondsToMinutes(milliseconds));
		}
		
		/**
			Converts milliseconds to days.
			
			@param milliseconds: The number of milliseconds.
			@return Returns the number of days.
		*/
		public function millisecondsToDays(milliseconds:Number):Number {
			return hoursToDays(millisecondsToHours(milliseconds));
		}
		
		/**
			Converts seconds to milliseconds.
			
			@param seconds: The number of seconds.
			@return Returns the number of milliseconds.
		*/
		public function secondsToMilliseconds(seconds:Number):Number {
			return seconds * 1000;
		}
		
		/**
			Converts seconds to minutes.
			
			@param seconds: The number of seconds.
			@return Returns the number of minutes.
		*/
		public function secondsToMinutes(seconds:Number):Number {
			return seconds / 60;
		}
		
		/**
			Converts seconds to hours.
			
			@param seconds: The number of seconds.
			@return Returns the number of hours.
		*/
		public function secondsToHours(seconds:Number):Number {
			return minutesToHours(secondsToMinutes(seconds));
		}
		
		/**
			Converts seconds to days.
			
			@param seconds: The number of seconds.
			@return Returns the number of days.
		*/
		public function secondsToDays(seconds:Number):Number {
			return hoursToDays(secondsToHours(seconds));
		}
		
		/**
			Converts minutes to milliseconds.
			
			@param minutes: The number of minutes.
			@return Returns the number of milliseconds.
		*/
		public function minutesToMilliseconds(minutes:Number):Number {
			return secondsToMilliseconds(minutesToSeconds(minutes));
		}
		
		/**
			Converts minutes to seconds.
			
			@param minutes: The number of minutes.
			@return Returns the number of seconds.
		*/
		public function minutesToSeconds(minutes:Number):Number {
			return minutes * 60;
		}
		
		/**
			Converts minutes to hours.
			
			@param minutes: The number of minutes.
			@return Returns the number of hours.
		*/
		public function minutesToHours(minutes:Number):Number {
			return minutes / 60;
		}
		
		/**
			Converts minutes to days.
			
			@param minutes: The number of minutes.
			@return Returns the number of days.
		*/
		public function minutesToDays(minutes:Number):Number {
			return hoursToDays(minutesToHours(minutes));
		}
		
		/**
			Converts hours to milliseconds.
			
			@param hours: The number of hours.
			@return Returns the number of milliseconds.
		*/
		public function hoursToMilliseconds(hours:Number):Number {
			return secondsToMilliseconds(hoursToSeconds(hours));
		}
		
		/**
			Converts hours to seconds.
			
			@param hours: The number of hours.
			@return Returns the number of seconds.
		*/
		public function hoursToSeconds(hours:Number):Number {
			return minutesToSeconds(hoursToMinutes(hours));
		}
		
		/**
			Converts hours to minutes.
			
			@param hours: The number of hours.
			@return Returns the number of minutes.
		*/
		public function hoursToMinutes(hours:Number):Number {
			return hours * 60;
		}
		
		/**
			Converts hours to days.
			
			@param hours: The number of hours.
			@return Returns the number of days.
		*/
		public function hoursToDays(hours:Number):Number {
			return hours / 24;
		}
		
		/**
			Converts days to milliseconds.
			
			@param days: The number of days.
			@return Returns the number of milliseconds.
		*/
		public function daysToMilliseconds(days:Number):Number {
			return secondsToMilliseconds(daysToSeconds(days));
		}
		
		/**
			Converts days to seconds.
			
			@param days: The number of days.
			@return Returns the number of seconds.
		*/
		public function daysToSeconds(days:Number):Number {
			return minutesToSeconds(daysToMinutes(days));
		}
		
		/**
			Converts days to minutes.
			
			@param days: The number of days.
			@return Returns the number of minutes.
		*/
		public function daysToMinutes(days:Number):Number {
			return hoursToMinutes(daysToHours(days));
		}
		
		/**
			Converts days to hours.
			
			@param days: The number of days.
			@return Returns the number of hours.
		*/
		public function daysToHours(days:Number):Number {
			return days * 24;
		}///////////
		
		/**
		 *
		 * @param	value
		 * @return
		 */
		private function _addLeadingZero(value:Number):String {
			return (value < 10) ? '0' + value : value.toString();
		}
		
		private function _getOrdinalSuffix(value:int):String {
			if (value >= 10 && value <= 20) return 'th';
			
			if (value == 0) return '';
			
			switch (value % 10) {
				case 3: return 'rd'; break
				case 2: return 'nd'; break
				case 1: return 'st'; break
				default: return 'th'; break
			}
		}
		
		/**
		 *
		 * @param	value
		 * @param	minLength
		 * @param	thouDelim
		 * @param	fillChar
		 * @return
		 */
		private function _format(value:Number, minLength:uint, thouDelim:String = null, fillChar:String = null):String {
			var num:String = value.toString();
			var len:uint   = num.length;
			
			if (thouDelim != null) {
				var numSplit:Array = num.split('');
				var counter:uint = 3;
				var i:uint       = numSplit.length;
				
				while (--i > 0) {
					counter--;
					if (counter == 0) {
						counter = 3;
						numSplit.splice(i, 0, thouDelim);
					}
				}
				
				num = numSplit.join('');
			}
			
			if (minLength != 0) {
				if (len < minLength) {
					minLength -= len;
					
					var addChar:String = (fillChar == null) ? '0' : fillChar;
					
					while (minLength--)
						num = addChar + num;
				}
			}
			
			return num;
		}
		
	}
	
}