package org.servebox.cafe.core.command.impl
{
	import flash.events.Event;
	
	import org.servebox.cafe.core.command.ICommand;
	
	public class CompositeCommand implements ICommand
	{
		private var _nestedCommands : Array = [];
		
		public function get nestedCommands():Array
		{
			return _nestedCommands;
		}

		public function set nestedCommands(value:Array):void
		{
			_nestedCommands = value;
		}

		public function addCommand( command : ICommand ) : void
		{
			nestedCommands.push( command );
		}
		
		
		public function execute(e:Event=null):void
		{
			for each( var c : ICommand in nestedCommands)
			{
				executeCommand( c, e );
			}
		}
		
		protected function executeCommand(c : ICommand, e:Event=null) : void
		{
			c.execute(e);
		}

	}
}