package org.servebox.cafe.core.command
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import org.servebox.cafe.core.signal.SignalAggregator;
	
	public class AbstractStateCommand extends EventDispatcher implements IStateCommand
	{
		public function AbstractStateCommand(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		[Autowired]
		public var signalAggregator : SignalAggregator;
		
		private var _parameters : Array;
		
		public function get executable():Boolean
		{
			return true;
		}
		
		public function set executable(value:Boolean):void
		{
		}
		
		public function get parameters():Array
		{
			return _parameters;
		}
		
		public function set parameters(value:Array):void
		{
			_parameters = value;
		}		
		
		protected function getParameter( key : String ) : IParameterObject
		{
			var paramToReturn : IParameterObject;
			for each ( var param : IParameterObject in _parameters )
			{
				if ( param.key == key )
				{
					paramToReturn = param;
				}
			}
			if ( !paramToReturn )
			{
				throw new Error("No parameter " + key + " in " + this + " command, check command binding ");
			}
			return paramToReturn;
		}
		
		public function execute( e : Event = null ) : void
		{
		}
	}
}