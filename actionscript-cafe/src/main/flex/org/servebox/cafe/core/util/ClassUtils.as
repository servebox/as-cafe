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