package org.servebox.cafe.core.command
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class AbstractStateCommand extends EventDispatcher implements IStateCommand
	{
		public function AbstractStateCommand(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		public function get executable():Boolean
		{
			return false;
		}
		
		public function set executable(value:Boolean):void
		{
		}
		
		public function execute():void
		{
		}
	}
}