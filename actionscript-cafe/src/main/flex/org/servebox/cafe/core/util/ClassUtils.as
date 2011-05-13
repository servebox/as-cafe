/*
 * Servebox ActionScript Commons / $Id: ClassUtils.as 56 2007-03-23 17:08:45Z J.F.Mathiot $
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
 
package org.servebox.cafe.core.util
{
	import flash.utils.getQualifiedClassName;
	import flash.display.DisplayObject;
	
    /**
     * ClassUtils is a class containing static methods to handle objects.
     */
	public class ClassUtils
	{
		
		/**
		 * Extracts the short name of a Class
		 * ex: spark.components::Label ==> Label
		 */
		public static function extractShortClassName( fullClassName : String ) : String
		{
			var shortClassName : String = fullClassName ;
			if ( fullClassName.indexOf('::') != -1 ){
				shortClassName = fullClassName.substring( fullClassName.indexOf('::') + 2, fullClassName.length );
			} 
			return shortClassName;
		}
		
		/**
		 * Retrieves the fully qualified class name (with dots only) of a class.
		 */
		public static function getStandardFullyQualifiedClassName( clazzOrInstance : Object ) : String
		{
			var fqcnFlex : String = getQualifiedClassName( clazzOrInstance );
			var fqcn : String = fqcnFlex.replace( "::", "." );
			return fqcn;
		}
		
		/**
		 * Returns an instance of "className", with "args" arguments
		 */
		public static function initializeObject ( className:Class , args:Object ) : *
		{
			var obj :* = new className();
			for( var arg:String in args )
			{
				
				try {
					obj[arg] = args[arg];
				} catch ( e:Error ) {
					throw("Cannot set property " + arg + " on an instance of " + className + "."); 
				}
			}
			return obj;
		}		
		
		/**
		 * Returns an instance of "className", with "args" arguments
		 */
		public static function initializeDisplayObject ( className:Class , args:Object ) : DisplayObject
		{
			var obj:DisplayObject = DisplayObject( ClassUtils.initializeObject( className, args ) );
			return obj;
		}				
	}
}