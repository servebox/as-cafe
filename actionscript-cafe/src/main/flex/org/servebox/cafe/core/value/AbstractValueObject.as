
package org.servebox.cafe.core.value
{
	import flash.utils.ByteArray;
	import flash.utils.getQualifiedClassName;
	
	import org.servebox.cafe.core.util.StringHash;

	/**
	 * AbstractValueObject is used to ease IBasicObject implementation on value objects.
	 * All Value Object must extends AbstractValueObject
	 * e.g.
	 * <pre>
	 * CustomerVO extends AbstractValueObject
	 * </pre>
	 * 
 	 * Note : From Flex Foundry
	 * 
	 * @author A.Desmarais
	 * 
	 */	
	public class AbstractValueObject implements IBasicObject
	{
		
		/**
		 * Creates a new BasicObject object.
		 */
		public function AbstractValueObject()
		{
			_internalInstanceId = getInstanceId();
		}
		
		private var _internalInstanceId : uint;
		
		/**
		 * The internal instance id of the object.
		 */
		public function get internalInstanceId():uint {
			return _internalInstanceId;
		}
		
		/**
		 * Generates a unique unsigned integer id at instanciation
		 */
		public final function getInstanceId() : uint
		{
			return uint( Math.round( Math.random() * new Number( int.MAX_VALUE ) ) );
		}
		
		/**
		 * @inheritDoc
		 */
		public function hashCode():int
		{
			var bA : ByteArray = new ByteArray();
			bA.writeObject( this );
			return __hashValue( bA.toString() );
		}
		
		/**
		 * @inheritDoc
		 */
		public function equals( value : IBasicObject ) : Boolean
		{
			return this == value;
		}
		
		/**
		 * @inheritDoc
		 */
		public function toString():String
		{
			return "[" + getQualifiedClassName( this ) + "@"+ hashCode() +"]";
		}
		
		/**
		 * Returns the hash value of a string.
		 */
		private function __hashValue( value : String ) : int
		{
			return StringHash.ELFHash( value );
		}
	}
}