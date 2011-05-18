/*
 * Servebox ActionScript Commons / $Id: DictionaryTable.as 54 2007-03-23 17:03:05Z J.F.Mathiot $
 * 
 * Copyright 2006 ServeBox Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License. You may obtain a copy
 * of the License at
 * 
 * http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software distributed under
 * the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
 * either express or implied. See the License for the specific language governing permissions
 * and limitations under the License.
 */
 
 package org.servebox.cafe.net
{
	import flash.external.*;
	import flash.utils.*;
    
    /**
     * The URLUtils utility class contains useful url static methods.
     */
	public class URLUtils
	{
		/**
		 * Returns the host URI.
		 */
		public static function getHostURL( url : String ) : String
		{
			if( url.substring( 0, 7).toLowerCase() == "file://" )
			{
				throw new Error("Cannot retrieve host URI for an application launched directly from the file system, use http:// instead.");
			}
			var httpPos:int = url.indexOf("http://") + ("http://").length;
			return "http://" + url.substring( httpPos, url.indexOf( "/",  httpPos + 1 ) );
		}

		/**
		 * Returns the query string.
		 */
		public static function getCurrentQueryString() : String 
		{
			return ExternalInterface.call("window.location.href.toString");
		}
        
        /**
         * Returns an array of the parameters in the query string.
         */
		public static function readQueryString() : Array
		{
			var queryString : String;
			var all : String;
			var params : Array;
			try 
			{
				all =  ExternalInterface.call("window.location.href.toString");
				queryString = ExternalInterface.call("window.location.search.substring", 1);
				if(queryString)
				{
					params = queryString.split('&');
					var length:uint = params.length;
					for (var i:uint=0,index:int=-1; i<length; i++) 
					{
						var keyAndValues:String = params[i];
						if((index = keyAndValues.indexOf("=")) > 0)
						{
							var key:String = keyAndValues.substring(0,index);
							var value:String = keyAndValues.substring(index+1);
							params[key] = value;
						}
					}
					return params;
				}
			} catch( e : Error ) { trace("ExternalInterface error, cant get current queryString"); }
			
			return null;
		}

	}
}