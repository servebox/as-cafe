/*
 * Servebox Java/Flex Foundry / $Id: TransferObjectHeader.java 759 2008-12-01 12:04:19Z adesmarais $
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


public class TransferObjectHeader implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private int m_code;
	private String m_message;
	
	public TransferObjectHeader()
	{
	}
	
	public TransferObjectHeader( int code , String message ) {
 			this.m_code = code;
 			if( message != null )
 				this.m_message = message;
	}
	
	public int getCode()
	{
		return m_code;
	}
	
	public String getMessage()
	{
		return m_message;
	}
	
	public void setCode( int code )
	{
		m_code = code;
	}
	
	public void setMessage( String message )
	{
		m_message = message;
	}
}
