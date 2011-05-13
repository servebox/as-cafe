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
	[RemoteClass(alias="org.servebox.cafe.core.transfer.TransferObject")]
	/**
	 * Transfer Object used as a data carrier, to return data to the client
	 */
	public class TransferObject
	{
		private var _header : TransferObjectHeader;
		
		/**
		 * give an header to the transfert object
		 * @param code internal error our succes code
		 * @param message human readable error or success message
		 */
		public function buildHeader( code : uint = 0, message : String = null ) : TransferObjectHeader {
			_header = new TransferObjectHeader();
			_header.code = code;
			_header.message = message;
			return _header;
		}
		
		/**
		 * The header of the transfer object.
		 */
		public function get transferObjectHeader() : TransferObjectHeader
		{
			return _header;
		}
		
		public function set transferObjectHeader( h : TransferObjectHeader ) : void
		{
			_header =h;
		}
	}
}