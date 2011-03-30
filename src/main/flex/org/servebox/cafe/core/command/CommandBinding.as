package org.servebox.cafe.core.command
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import mx.binding.utils.BindingUtils;
	import mx.binding.utils.ChangeWatcher;
	import mx.core.UIComponent;
	
	public class CommandBinding extends EventDispatcher
	{
		private var _command : ICommand;
		
		private var _target : IEventDispatcher;
		
		private var _triggerEvents : String;
		
		private var _arTriggerEvents : Array;
		
		private var setterWatcher : ChangeWatcher;
		
		public function CommandBinding()
		{
			super();
		}
		
		[Bindable("command_Change")]
		public function get command():ICommand
		{
			return _command;
		}

		public function set command(value:ICommand):void
		{
			_command = value;
			if( _command is IStateCommand )
			{
				if( setterWatcher )
				{
					setterWatcher.unwatch();
					setterWatcher = null;
				}
				setterWatcher = BindingUtils.bindSetter( executablePropertyChanged, this, ["command", "executable"] );
			}
			dispatchEvent( new Event("command_Change") );
		}
		
		[Bindable("target_Change")]
		public function get target():IEventDispatcher
		{
			return _target;
		}

		public function set target(value:IEventDispatcher):void
		{
			clearEvents();
			_target = value;
			dispatchEvent( new Event("target_Change") );
			for each( var e : String in _arTriggerEvents )
			{
				_target.addEventListener( e, triggerFired );
			}
		}
		
		[Bindable]
		public function get triggerEvents():String
		{
			return _triggerEvents;
		}

		public function set triggerEvents(value:String):void
		{
			clearEvents();
			_triggerEvents = value;
			_arTriggerEvents = value.split(",");
		}

		private function clearEvents() : void
		{
			if( _target == null )
			{
				// The target invoker is not set, no need to clear the events.
				return;
			}
			for each( var e : String in _arTriggerEvents )
			{
				_target.removeEventListener( e, triggerFired );
			}
		}
		
		public function executablePropertyChanged( value : Boolean ) : void
		{
			if( _target is UIComponent )
			{
				UIComponent( _target ).enabled = value;
			}
		}
		
		public function triggerFired( e : Event ) : void
		{
			if( _command is IStateCommand && IStateCommand(_command).executable )
			{
				_command.execute( e );
			}
		}
	}
}