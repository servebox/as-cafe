/*
 * Servebox Java/Flex Foundry / $Id: TransferObject.java 759 2008-12-01 12:04:19Z adesmarais $
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

package org.servebox.cafe.transfer;

import java.io.Serializable;


public class TransferObject implements ITransferObject, Serializable {

	private static final long serialVersionUID = 1L;
	
	private TransferObjectHeader m_header = null;
	
	public TransferObject()
	{
		buildDefaultHeader();
	}

	public TransferObject( TransferObjectHeader header )
	{
		m_header = header;
	}
	
	public TransferObject( int code, String message )
	{
		buildHeader( code, message );
	}

	/* (non-Javadoc)
	 * @see org.servebox.cafe.transfer.ITransferObject#buildHeader(int, java.lang.String)
	 */
	public TransferObjectHeader buildHeader( int code, String message )
	{
		return m_header = new TransferObjectHeader( code, message );
	}
	
	/* (non-Javadoc)
	 * @see org.servebox.cafe.transfer.ITransferObject#buildDefaultHeader()
	 */
	public TransferObjectHeader buildDefaultHeader()
	{
		return m_header = new TransferObjectHeader( 0, "" );
	}
	
	/* (non-Javadoc)
	 * @see org.servebox.cafe.transfer.ITransferObject#getHeader()
	 */
	public TransferObjectHeader getTransferObjectHeader()
	{
		return m_header;
	}

	public void setTransferObjectHeader(TransferObjectHeader header) {
		this.m_header = header;
	}
	
	
}
