package org.servebox.cafe.core.command
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class AbstractCommand extends EventDispatcher implements ICommand
	{
		public function AbstractCommand(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		public function execute( e : Event = null ) : void
		{
		}
	}
}