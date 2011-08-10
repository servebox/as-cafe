package org.servebox.cafe.core.command.impl
{
	import flash.events.Event;
	import org.servebox.cafe.core.command.ICommand;
	
	public class DelegateCommand implements ICommand
	{
		private var _parameters : Array;
		private var _context : Object;
		private var _handler : Function;
		
		public function DelegateCommand( executionContext : Object, handler : Function )
		{
			super();
			_context = executionContext;
			_handler = handler;
		}
		
		public function execute(e:Event=null):void
		{
			_handler.apply( _context, _parameters );
		}
		
		public function set parameters(ar:Array):void
		{
			_parameters = ar;
		}
		
		public function get parameters():Array
		{
			return _parameters;
		}
	}
}