package org.servebox.cafe.core.command.impl
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import org.servebox.cafe.core.command.INullableParameterObject;
	import org.servebox.cafe.core.command.IParameterObject;
	import org.servebox.cafe.core.command.IParameterizableCommand;
	import org.servebox.cafe.core.command.IStateCommand;
	import org.servebox.cafe.core.signal.SignalAggregator;
	
	public class AbstractStateCommand extends EventDispatcher implements IStateCommand, IParameterizableCommand
	{
		private var _parameters : Array;
		
		public function AbstractStateCommand(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		[Autowired]
		public var signalAggregator : SignalAggregator;
		
		public function get executable():Boolean
		{
			return true;
		}
		
		public function set executable(value:Boolean):void
		{
		}
		
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
		
		protected function getParameter( key : String ) : IParameterObject
		{
			var paramToReturn : IParameterObject;
			for each ( var param : IParameterObject in parameters )
			{
				if ( param.key == key )
				{
					paramToReturn = param;
					if ( paramToReturn is INullableParameterObject )
					{
						//parameter can be null
					}
					else 
					{
						if ( paramToReturn.value == null )
						{
							throw new Error("Parameter value for " + key + " in " + this + " is null, check command binding ");
						}
					}	
				}
			}
			if ( !paramToReturn )
			{
				throw new Error("No parameter " + key + " in " + this + " command, check command binding ");
			}
			return paramToReturn;
		}
		
		public function addParameter( key : String , value : Object ) : void
		{
			var param : AbstractParameterObject = new AbstractParameterObject( key, value );
			for each ( var existingParam : AbstractParameterObject in parameters )
			{
				if ( existingParam.key == key )
				{
					parameters.splice( parameters.indexOf( existingParam ), 1 ); 
				}
			}
			parameters.push( param );
		}
		
		public function execute( e : Event = null ) : void
		{
		}
	}
}