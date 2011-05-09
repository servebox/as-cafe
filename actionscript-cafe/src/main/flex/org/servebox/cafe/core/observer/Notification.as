package org.servebox.cafe.core.observer
{
	public class Notification implements INotification
	{
		private var _type:String;
		private var _cargoList:Array;
		
		/**
		* Creates a new Notification object.
		*/
		public function Notification( type:String, cargo : * = null){
		 	this._type = type;
			if( cargo != null )
			{
			 	this._cargoList = [cargo];
			}
	 	}
		
		public function getType():String
		{
			return _type;
		}
		
		public function setType(value:String):void
		{
			_type = value;
		}		
		public function getCargoList():Array
		{
			return _cargoList;
		}
		
		public function setCargoList(valueList:Array):void
		{
			_cargoList = valueList;
		}

 	} 
}