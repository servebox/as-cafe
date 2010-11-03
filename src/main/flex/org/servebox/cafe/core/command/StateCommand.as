package org.servebox.cafe.core.command
{
	import flash.events.IEventDispatcher;

	public interface StateCommand extends Command, IEventDispatcher
	{
		[Bindable("executable_Change")]
		function get executable() : Boolean;
		
		function set executable( value :Boolean ) : void;
	}
}