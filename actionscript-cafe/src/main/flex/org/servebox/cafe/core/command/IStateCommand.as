package org.servebox.cafe.core.command
{
	import flash.events.IEventDispatcher;

	public interface IStateCommand extends ICommand, IEventDispatcher
	{
		[Bindable("executable_Change")]
		function get executable() : Boolean;
		
		function set executable( value :Boolean ) : void;
		
		function addParameter( key : String , value : Object ) : void;
	}
}