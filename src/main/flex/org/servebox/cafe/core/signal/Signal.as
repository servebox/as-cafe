/*
* actionscript-cafe Signal 18 avr. 2011 adesmarais
* 
* Created by Servebox 
* Copyright 2010 Servebox (c) All rights reserved. You may not use, distribute
* or modify this code under its source or binary form
* without the express authorization of ServeBox. Contact : info@servebox.com
*/
package org.servebox.cafe.core.signal
{
	import org.servebox.cafe.core.observer.INotification;
	import org.servebox.cafe.core.observer.Notification;
	
	public class Signal extends Notification implements INotification
	{
		public function Signal(type:String, cargo:*)
		{
			super(type, cargo);
		}
	}
}