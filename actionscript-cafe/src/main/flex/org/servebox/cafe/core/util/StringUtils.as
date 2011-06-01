/*
* actionscript-cafe StringUtils 18 avr. 2011 adesmarais
* 
* Created by Servebox 
* Copyright 2010 Servebox (c) All rights reserved. You may not use, distribute
* or modify this code under its source or binary form
* without the express authorization of ServeBox. Contact : info@servebox.com
*/

package org.servebox.cafe.core.util
{
	
	/**
	 * StringUtils a helper class with a static methods to handle strings.
	 *
	 */
	public class StringUtils 
	{
		/**
		 * Splits a string using an array of separators.
		 */
		public static function split(toSplit:String, seps:Array):Array
		{
			var r : Array = new Array();
			while( true )
			{
				var found : Boolean = false;
				var foundAt : int = int.MAX_VALUE;
				var foundSep : String;
				
				for( var  i : int = 0; i < seps.length; i++ )
				{
					var localFoundAt : int = toSplit.indexOf( seps[i] );
					if( localFoundAt > -1 && localFoundAt < foundAt )
					{
						foundAt = localFoundAt;
						found = true;
						foundSep = seps[i];
					}
				}
				if( found )
				{
					if( foundAt > 0 )
					{
						r.push( toSplit.substring( 0, foundAt ) );
					}
					toSplit = toSplit.substring( foundAt + foundSep.length, toSplit.length );
					continue;
				}
				else
				{
					r.push( toSplit );
					break;
				}
			}
			return r;
		}
		
		/**
		 * Splits a string using an array of separators, and includes the separators inside the returning array.
		 */
		public static function splitIncludingSeps(toSplit:String, seps:Array):Array
		{
			var r : Array = new Array();
			while( true )
			{
				var found : Boolean = false;
				var foundAt : int = int.MAX_VALUE;
				var foundSep : String;
				
				for( var  i : int = 0; i < seps.length; i++ )
				{
					var localFoundAt : int = toSplit.indexOf( seps[i] );
					if( localFoundAt > -1 && localFoundAt < foundAt )
					{
						foundAt = localFoundAt;
						found = true;
						foundSep = seps[i];
					}
				}
				if( found )
				{
					if( foundAt > 0 )
					{
						r.push( toSplit.substring( 0, foundAt ) );
						r.push( foundSep );
					}else{
						r.push( foundSep );
					}
					toSplit = toSplit.substring( foundAt + foundSep.length, toSplit.length );
				}
				else
				{
					r.push( toSplit );
					break;
				}
			}
			return r;
		}
		
		/**
		 * Removes a character from a String.
		 * @param toStrip The string to remove characters from.
		 * @param char The character to remove.
		 * @return The string with removed characters.
		 */
		public static function stripChar( toStrip:String, char:String ):String
		{
			var i:int;
			while( ( i = toStrip.indexOf( char ) ) > -1 )
			{
				toStrip = toStrip.substring( 0, i ) + toStrip.substring( i+1, toStrip.length );
			}
			return toStrip;
		}
		
		/**
		 * Reverses a String.
		 * @param string The string to reverse.
		 */
		public static function reverse( string : String):String
		{
			var ar:Array = string.split();
			ar.reverse();
			return ar.join();
		}
		
		/**
		 * Checks whether a string begins with a pattern.
		 * @param str The string on which to perform the search.
		 * @param pattern The pattern to search.
		 * @caseSensitive Indicates whether the search should be case sensitive or not. Default is true.
		 */
		public static function startsWith( str : String, pattern : String, caseSensitive : Boolean = true ) : Boolean
		{
			if ( str == null )
				return false;
			if( str.length >= pattern.length &&
				( caseSensitive && str.substr( 0, pattern.length ) == pattern ||
					!caseSensitive && str.substr( 0, pattern.length ).toLowerCase() == pattern.toLowerCase() ) )
			{
				return true;
			}
			return false;
		}
		
		/**
		 * Checks whether a string ends with a pattern.
		 * @param str The string on which to perform the search.
		 * @param pattern The pattern to search.
		 * @caseSensitive Indicates whether the search should be case sensitive or not. Default is true.
		 */
		public static function endsWith( str : String, pattern : String, caseSensitive : Boolean = true ) : Boolean
		{
			if( str.length >= pattern.length && ( caseSensitive && str.substr( str.length - pattern.length, pattern.length ) == pattern || !caseSensitive && str.substr( str.length  - pattern.length, pattern.length ).toLowerCase() == pattern.toLowerCase() ) )
			{
				return true;
			}
			return false;
		}
		
		/**
		 * Formats a String occurence with the first character in upper case and the next ones in lower case.
		 * @return The formatted String.
		 */
		public static function upperCaseFirst( string : String ) : String
		{
			if ( string.length < 1){
				return "";
			} else {
				return string.substring( 0, 1).toUpperCase() + string.substring( 1, string.length).toLowerCase() ;				
			}
			
		}
		
		/**
		 * Searches a query in a string an returns its position.
		 */
		public static function contains( string : String, query : String ) : Boolean
		{
			return string.indexOf( query ) > -1 ;
		}
		
		/**
		 * Compares two strings . Returns a negative integer, zero, or a positive integer as the first argument is less than, equal to, or greater than the second.
		 */
		public static function compare( s1 : String , s2 : String ) : int
		{
			if ( s1 > s2 )
				return 1;
			else if ( s1 == s2 )
				return 0;
			else if ( s1 < s2 )
				return -1;
			else
				return 0; 
		}
		
	}
}