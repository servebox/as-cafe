package org.servebox.cafe.core.command
{
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	
	public interface ICommand
	{
		function execute( e : Event = null ) : void;
	}
}