/*
* actionscript-cafe class_name 18 avr. 2011 adesmarais
* 
* Created by Servebox 
* Copyright 2010 Servebox (c) All rights reserved. You may not use, distribute
* or modify this code under its source or binary form
* without the express authorization of ServeBox. Contact : info@servebox.com
*/
package org.servebox.cafe.core.observer
{
	public interface INotification
	{
		function getType():String;
		function setType(value:String):void;
		function getCargo():Object;
		function setCargo(value:Object):void;
	}
}