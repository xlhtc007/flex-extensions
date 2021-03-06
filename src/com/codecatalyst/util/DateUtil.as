////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2008 CodeCatalyst, LLC - http://www.codecatalyst.com/
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.	
////////////////////////////////////////////////////////////////////////////////

package com.codecatalyst.util
{
	
	public class DateUtil
	{
		// ========================================
		// Public constants
		// ========================================
		
		/**
		 * Time expressed as milliseconds.
		 */
		public static const MILLISECOND:Number 	= 1;
		public static const SECOND:Number 		= MILLISECOND * 1000;
		public static const MINUTE:Number 		= SECOND * 60;
		public static const HOUR:Number 		= MINUTE * 60;
		public static const DAY:Number 			= HOUR * 24;
		public static const WEEK:Number 		= DAY * 7;
		public static const MONTH:Number 		= DAY * 30; 				// NOTE: Imprecise.
		public static const YEAR:Number   		= DAY * 365; 				// NOTE: Imprecise.
		
		/**
		 * Days of the week.
		 */
		public static const SUNDAY:Number 		= 0;
		public static const MONDAY:Number 		= 1;
		public static const TUESDAY:Number 		= 2;
		public static const WEDNESDAY:Number 	= 3;
		public static const THURSDAY:Number 	= 4;
		public static const FRIDAY:Number 		= 5;
		public static const SATURDAY:Number 	= 6;
		
		// ========================================
		// Public methods
		// ========================================
		
		/**
		 * Comparator function for two Dates.
		 */
		public static function compare( a:Date, b:Date ):int
		{
			return NumberUtil.compare( a.time, b.time );
		}
		
		/**
		 * Calculates the duration in milliseconds between two dates.
		 */
		public static function duration( startDate:Date, endDate:Date ):Number
		{
			return ( endDate.getTime() - startDate.getTime() );
		}
		
		/**
		 * Returns the minimum (i.e. earlier) date of the two specified dates.
		 */
		public static function min( date1:Date, date2:Date ):Date
		{
			return ( date1.getTime() <= date2.getTime() ) ? date1 : date2;
		}
		
		/**
		 * Returns the maximum (i.e. later) date of the two specified dates.
		 */
		public static function max( date1:Date, date2:Date ):Date
		{
			return ( date1.getTime() >= date2.getTime() ) ? date1 : date2;
		}
		
		/**
		 * Returns the 'floor' for the specified date - i.e. rounded down relative to the specified time unit.
		 */
		public static function floor( date:Date, unit:Number ):Date
		{
			var result:Date = new Date( date.time );
			
			switch ( unit )
			{
				case YEAR:
					result.month = 0;
					result.date = 1;
					result.hours = 0;
					result.minutes = 0;
					result.seconds = 0;
					result.milliseconds = 0;
					break;
				
				case MONTH:
					result.date = 1;
					result.hours = 0;
					result.minutes = 0;
					result.seconds = 0;
					result.milliseconds = 0;
					break;
				
				case DAY:
					result.hours = 0;
					result.minutes = 0;	
					result.seconds = 0;
					result.milliseconds = 0;
					break;
				
				case HOUR:
					result.minutes = 0;
					result.seconds = 0;
					result.milliseconds = 0;
					break;
				
				case MINUTE:
					result.seconds = 0;
					result.milliseconds = 0;
					break;
				
				case SECOND:
					result.milliseconds = 0;
					break;
				
				default:
					throw new Error( "Unsupported unit specified." );
			}
			
			return result;
		}
		
		/**
		 * Returns the 'ceiling' for the specified date - i.e. rounded up relative to the specified time unit.
		 */
		public static function ceil( date:Date, unit:Number ):Date
		{
			var result:Date = floor( date, unit );
			
			// NOTE: This logic assumes Date's implementation properly handles overflow values.
			
			switch ( unit )
			{
				case YEAR:
					result.fullYear += 1;
					break;
				
				case MONTH:
					result.month += 1;
					break;
				
				case DAY:
					result.date += 1;
					break;
				
				case HOUR:
					result.hours += 1;
					break;
				
				case MINUTE:
					result.minutes += 1;
					break;
				
				case SECOND:
					result.seconds += 1;
					break;
				
				default:
					throw new Error( "Unsupported unit specified." );
			}
			
			return result;
		}
		
		/**
		 * Returns the occurance of the day for the specified Date within the current month.
		 */
		public static function occurranceOfDayInMonth( date:Date ):int
		{
			var occurrance:int = 1;
			
			var previousWeek:Date = new Date( date.getTime() - WEEK );
			while ( previousWeek.month == date.month )
			{
				previousWeek.setTime( previousWeek.getTime() - WEEK );
				
				occurrance++;
			}
			
			return occurrance;
		}
		
		/**
		 * Returns a Boolean indicating whether the specified Date is the last occurance of the day within the current month.
		 */
		public static function lastOccuranceOfDayInMonth( date:Date ):Boolean
		{
			var nextWeek:Date = new Date( date.getTime() + WEEK );
			
			return ( nextWeek.month != date.month );
		}
	}
}