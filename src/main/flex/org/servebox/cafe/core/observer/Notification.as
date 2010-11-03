package org.servebox.cafe.core.observer
{
	public class Notification
	{
		private var _type:String;
		private var _cargo:*;
		
		/**
		* Creates a new Notification object.
		*/
		public function Notification( type:String, cargo:* ){
		 	this._type = type;
		 	this._cargo = _cargo;
	 	}
		
		public function getType():String
		{
			return _type;
		}
		
		public function setType(value:String):void
		{
			_type = value;
		}		
		public function getCargo():*
		{
			return _cargo;
		}
		
		public function setCargo(value:String):void
		{
			_cargo = value;
		}

 	} 
}