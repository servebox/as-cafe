package org.servebox.cafe.core.command
{
	import flash.events.Event;
	
	public interface ICommand
	{
		function execute( e : Event = null ) : void;
	}
}