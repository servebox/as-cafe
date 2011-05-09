
package org.servebox.cafe.core.value
{
	/**
	 * All value object should implement IBasicObject
	 *   
	 * @author A.Desmarais
	 * 
	 * 
	 * 
	 */	
	public interface IBasicObject
	{
		/**
		 * Returns the hashcode of the object.
		 */
		function hashCode() : int;
		
		/**
		 * Returns the string representation of the specified object.
		 */
		function toString() : String;
		
		/**
		 * Object comparison mechanism. By default, the comparison is
		 * performed using the <code>==</code> operator. The definition
		 * of your own equals method is strongly encouraged.
		 */
		function equals( value : IBasicObject ) : Boolean;
	}
}