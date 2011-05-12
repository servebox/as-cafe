/*
* actionscript-cafe class_name 18 avr. 2011 adesmarais
* 
* Created by Servebox 
* Copyright 2010 Servebox (c) All rights reserved. You may not use, distribute
* or modify this code under its source or binary form
* without the express authorization of ServeBox. Contact : info@servebox.com
*/
package org.servebox.cafe.core.transfer
{
	[Bindable]
	[RemoteClass(alias="org.servebox.cafe.core.transfer.TransferObjectHeader")]
	/**
	 * See transfert object.
	 */
	public class TransferObjectHeader
	{
		private var _code : uint;
		private var _message : String;
		
		/**
		 * Creates a new TransferObjectHeader object.
		 */
		public function TransferObjectHeader() {
		}
		
		/**
		 * The TransferObjectHeader code.
		 */
		public function get code() : int
		{
			return _code;
		}
		
		public function set code( v : int ) : void
		{
			_code = v;
		}
		
        /**
         * The TransferObjectHeader message.
         */
		public function get message() : String
		{
			return _message;
		}
		
		public function set message( v : String ) : void
		{
			_message = v;
		}
	}
}