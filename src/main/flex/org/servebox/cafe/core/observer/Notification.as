package org.servebox.cafe.core.observer
{
	public class Notification implements INotification
	{
		private var _type:String;
		private var _cargo:Object;
		
		/**
		* Creates a new Notification object.
		*/
		public function Notification( type:String, cargo:Object ){
		 	this._type = type;
		 	this._cargo = cargo;
	 	}
		
		public function getType():String
		{
			return _type;
		}
		
		public function setType(value:String):void
		{
			_type = value;
		}		
		public function getCargo():Object
		{
			return _cargo;
		}
		
		public function setCargo(value:Object):void
		{
			_cargo = value;
		}

 	} 
}