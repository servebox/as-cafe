/*
* actionscript-cafe ClassUtils 18 avr. 2011 adesmarais
* 
* Created by Servebox 
* Copyright 2010 Servebox (c) All rights reserved. You may not use, distribute
* or modify this code under its source or binary form
* without the express authorization of ServeBox. Contact : info@servebox.com
*/
package org.servebox.cafe.core.util
{
	/**
	 * DateUtils is a helper class with a lot of static methods to handle dates.
	 */
	public class DateUtils
	{
		/**
		 * Returns the last day for a given month and year.
		 * @param fullYear The year.
		 * @param month The month. (0-11)
		 * @return The last day in month.
		 */
		public static function getLastDayInMonth( fullYear : int , month : int) : int
		{
			var date : Date = new Date( fullYear , month , 28 );
			var toReturn : int;
			do
			{
				toReturn = date.getDate();
				date.setDate( date.getDate() + 1 );
			}while( date.getMonth() == month );
			return toReturn;
		}
		
		/**
		 * Adds given values to a date, using a mask. The mask parameter can take the following values :<br>
		 * - d : Days.<br>
		 * - m : Months.<br>
		 * - y : Years.<br>
		 * @param date The date to add value to.
		 * @param mask The mask to apply on addition.
		 * @param addValue The value to add. Can be negative.
		 * @return The new date.
		 */
		public static function dateAdd( date : Date , mask : String , addValue : int ) : Date
		{
			var newDate : Date = dateCopy( date );
			switch( mask )
			{
				case "d" : newDate.setDate( newDate.getDate() + addValue );
					break;
				case "m" : newDate.setMonth( newDate.getMonth() + addValue );
					break;
				case "y" : newDate.setFullYear( newDate.getFullYear() + addValue );
					break;
			}
			
			return newDate;
		}
		
		/**
		 * Creates a fresh new clone of the passed date.
		 * @return A new Date, clone of an existing one.
		 * @param date The date to copy.
		 */
		public static function dateCopy( date : Date ) : Date
		{
			var newDate : Date = new Date( date.getFullYear() , date.getMonth() , date.getDate() , date.getHours() , date.getMinutes() , date.getSeconds() , date.getMilliseconds() );
			return newDate;
		}
		
		/**
		 * Checks if a date is an open date (excluding saturday/sunday).
		 * @param date The date to check.
		 * @return A boolean indicating if the given date is an open one.
		 */
		public static function isOpenDate( date : Date ) : Boolean
		{
			if( date.getDay() == 0 || date.getDay() == 6 ) return false;
			return true;
		}
		
		/**
		 * Adds days to a given date, including only open dates.
		 * @param date The date.
		 * @param daysToAdd The number of days to add. Can be negative.
		 * @return The new date.
		 */
		public static function dateAddOpenDatesOnly( date : Date , daysToAdd : int ) : Date
		{
			var newDate : Date = dateCopy( date );
			var direction : int = ( daysToAdd < 0 ? - 1 : 1 );
			while( daysToAdd != 0 )
			{
				newDate = dateAdd( newDate , "d" , direction );
				if( isOpenDate( newDate ) )
				{
					daysToAdd -= direction;
				}
			}
			
			return newDate;
		}
		
		/**
		 * Returns the current date, with hh:mm:ss-ms set to 00:00:00-000.
		 * @return The current date.
		 */
		public static function getCurrentDate() : Date
		{
			return getMidnightDateCopy( new Date() );
		}
		
		/**
		 * Returns the copy of a date, with the time set to 00:00:00-000.
		 * @param date The date to copy.
		 * @return The new date.
		 */
		public static function getMidnightDateCopy( date : Date ) : Date
		{
			return new Date( date.getFullYear() , date.getMonth() , date.getDate() , 0 , 0 , 0 , 0 );
		}
		
		/**
		 * Returns the difference between to dates, with the parameter mask as the unit. The mask parameter can take the following values :<br>
		 * - d : Days.<br>
		 * - m : Months.<br>
		 * - y : Years.<br>
		 * <b>The method do not consider hours, minutes, seconds and milliseconds.</b>
		 * @return The difference ( date1 - date2).
		 * @param date1 The first operand.
		 * @param date2 The second operand.
		 * @param mask The unit to use.
		 */
		public static function dateDiff( date1 : Date , date2 : Date , mask : String ) : Number
		{
			var first : Date = getMidnightDateCopy( date1 );
			var second : Date = getMidnightDateCopy( date2 );
			// difference expressed in ms
			var diffMs : Number = first.getTime() - second.getTime();
			var conversionRate : int;
			switch( mask )
			{
				case "d" : conversionRate = 86400000 ;
					break;
				case "m" : conversionRate = 86400000 * 30 ;
					break;
				case "y" : conversionRate = 86400000 * 365 ;
					break;
			}
			
			return  Math.floor( diffMs / conversionRate );
		}
		
		/**
		 * Dates comparator function.
		 * @return a negative value if obj1 &lt; obj2,  zero is obj1 == obj2, a positive value is obj1 &gt; obj2.
		 */
		public static function dateComparator( obj1 : Date , obj2 : Date ) : Number
		{
			if ( obj1 == null )
			{
				if ( obj2 == null ) return 0;
				else return - 1;
			}else
			{
				if ( obj2 == null ) return 1;
				else
				{
					var date1InMs : Number = obj1.getTime();
					var date2InMs : Number = obj2.getTime();
					if ( date1InMs > date2InMs ) return 1;
					else if ( date1InMs < date2InMs ) return - 1;
					else return 0;
				}
			}
		}
		
		/**
		 * Used to return a date typed in without any separators
		 */
		public static function getSeparatorsOff ( value : String ) : String 
		{
			value = StringUtils.stripChar( value, " ");
			value = StringUtils.stripChar( value, "/");
			value = StringUtils.stripChar( value, "\"");
			value = StringUtils.stripChar( value, "-");
			value = StringUtils.stripChar( value, ".");
			return value;
		}
		
		/**
		 * Use this fucntion to validate a property using two dates
		 */
		
		public static function validateInterval( beginDate : Date, endDate : Date ) : Boolean
		{
			if ( beginDate == null || endDate == null)
				return false;
			else if( DateUtils.dateComparator(endDate, beginDate) >= 0 )
				return true
			else return false;
		}
		
		/**
		 * This function is used to validate an interval in a specified date range
		 */
		
		public static function validateIntervalInRange ( beginDate : Date, endDate : Date, range : Array ) : Boolean
		{
			if ( beginDate == null || endDate == null || range == null)
				return false;
			else if( validateInterval(beginDate, endDate) == true && DateUtils.dateComparator(range[0], beginDate) <=0 && DateUtils.dateComparator(range[1], endDate) >= 0)
				return true
			else return false;
		}
		
		/**
		 * Sets the selectable date range for a date component
		 */
		public static function setRange ( beginDate : Date, endDate : Date ) : Object
		{
			var range : Object = new Object();
			range.rangeStart = beginDate;
			range.rangeEnd = endDate;
			return range;
		}
		
		public static function getDayNumber( date : Date ) : int
		{
			if ( date.day == 0 )
			{
				return 7;
			}
			else
			{
				return date.day;
			}
		}
		
	}
}