package org.servebox.cafe.core.command.impl
{
	import flash.events.Event;
	
	import org.servebox.cafe.core.command.ICommand;
	import org.servebox.cafe.core.command.IParameterizableCommand;

	public class ParameterizableCompositeCommand extends CompositeCommand implements IParameterizableCommand
	{
		private var _parameters : Array;
		
		public function get parameters():Array
		{
			if ( _parameters == null )
			{
				_parameters = new Array();
			}
			return _parameters;
		}
		
		public function set parameters(value:Array):void
		{
			_parameters = value;
		}
		
		override protected function executeCommand(c : ICommand, e:Event=null) : void
		{
			if( c is IParameterizableCommand )
			{
				IParameterizableCommand(c).parameters = parameters;
			}
			c.execute(e);
		}
	}
}