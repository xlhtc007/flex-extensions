////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2009 CodeCatalyst, LLC - http://www.codecatalyst.com/
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

package com.codecatalyst.data
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	public class NumericRange
	{
		// ========================================
		// Protected properties
		// ========================================
		
		/**
		 * Backing variable for <code>minimum</code property.
		 * 
		 * @see #minimum
		 */
		protected var _minimum:Number = NaN;
		
		/**
		 * Backing variable for <code>maximum</code> property.
		 * 
		 * @see #maximum
		 */
		protected var _maximum:Number = NaN;
		
		// ========================================
		// Public properties
		// ========================================

		[Bindable("minimumChanged")]
		/**
		 * The minimum value for a given numeric range.
		 */
		public function get minimum():Number
		{
			return _minimum;
		}

		[Bindable("maximumChanged")]
		/**
		 * The maximum value for a given numeric range.
		 */
		public function get maximum():Number
		{
			return _maximum;
		}

		// ========================================
		// Constructor
		// ========================================
		
		/**
		 * Constructor.
		 */
		public function NumericRange( minimum:Number = NaN, maximum:Number = NaN )
		{
			super();
			
			_minimum = minimum;
			_maximum = maximum;
		}
	}
}