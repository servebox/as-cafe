package org.servebox.cafe.core.modularity
{
	import org.servebox.cafe.core.spring.ApplicationContext;
	
	public class LocalApplicationUnitImpl implements ApplicationUnit
	{
		private var _id : String;
		private var _loadAtStartup  :Boolean = false;
		
		public function LocalApplicationUnitImpl()
		{
		}
		
		public function get id():String
		{
			return _id;
		}
		
		public function set id(value:String):void
		{
			_id = value;
		}
		
		public function get loadAtStartup():Boolean
		{
			return _loadAtStartup;
		}
		
		public function set loadAtStartup(value:Boolean):void
		{
			_loadAtStartup = value;
		}
		
		public function get configLocations():Array
		{
			return null;
		}
		
		public function set configLocations(value:Array):void
		{
		}
		
		public function prepare(parentContext:ApplicationContext):void
		{
		}
		
		public function start():void
		{
		}
	}
}