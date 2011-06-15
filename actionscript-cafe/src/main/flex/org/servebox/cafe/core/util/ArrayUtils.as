/*
* actionscript-cafe ArrayUtils 15 jui. 2011 gtriki
* 
* Created by Servebox 
* Copyright 2010 Servebox (c) All rights reserved. You may not use, distribute
* or modify this code under its source or binary form
* without the express authorization of ServeBox. Contact : info@servebox.com
*/
 
package org.servebox.cafe.core.util
{
	import mx.collections.ArrayCollection;
	
	/**
	 * The ArrayUtils utility class contains advanced array manipulation static methods.
	 */
	public class ArrayUtils
	{
		/**
		 * Returns a copy of the source Array instance.
		 */
		public static function arrayCopy( src:Array ):Array
		{
			return src.slice( 0 );
		}
		
		/**
		 * Returns a copy of the source ArrayCollection instance.
		 */
		public static function arrayCollectionCopy( src : ArrayCollection ) : ArrayCollection
		{
			return new ArrayCollection( arrayCopy( src.source ) );
		}
		
		/**
		 * Adds an object to an array without duplicated values.
		 * @return The object added.
		 */
		public static function addUniqueToArray( obj : Object , array : Array ) : Object
		{
                for(var i : int = 0; i < array.length; i++ )
                {
                        if( array[i] == obj ) {
                                return array[i];
                        }
                }
                array.push( obj );
                return obj;
        }
        
        /**
         * Deletes an item matching a given property value.
         */
        public static function deleteFromArrayByPropertyName( compare : *, propertyToCompare : String, sourceArray : Array ) : void
        {
			for(var i : int = 0; i < sourceArray.length; i++)
			{
				if( sourceArray[i].hasOwnProperty( propertyToCompare ) && sourceArray[i][propertyToCompare] == compare )
				{
					sourceArray.splice( i , 1 );
				}
			}
		}
	}
}