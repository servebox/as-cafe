package org.servebox.cafe.core.model
{
	import flash.events.EventDispatcher;
	import flash.utils.Dictionary;
	import flash.utils.describeType;

	

	import org.servebox.cafe.core.observer.Notification;
	import org.servebox.cafe.core.observer.IObservable;
	import org.servebox.cafe.core.observer.IObserver;

	public class PresentationModel extends EventDispatcher implements IObserver
	{
		private var notificationHandlers : Dictionary = null;
		
		private function loadMetadata() : void
		{
			if( notificationHandlers != null )
			{
				return;
			}
			notificationHandlers = new Dictionary();
			var typeDesc : XML = describeType( this );
			for each( var method : XML in typeDesc.method )
			{
				try
				{
					for each ( var metadata : XML in method.metadata.(@name="NotificationHandler")  )
					{
						var notification : String = metadata.arg.(@key=="triggerFor").@value;
						if( notification.length < 1 )
						{
							continue;
						}
						if( notificationHandlers[ notification ] == null )
						{
							notificationHandlers[ notification ] = [];
						}
						notificationHandlers[ notification ].push( this[ method.@name ] );
					}
				}catch( e : Error ){}
			}
		}
		
		public function update( source : IObservable, notification : Notification ) : void
		{
			loadMetadata();
			var handlers : Array = notificationHandlers[ notification.getType() ];
			if( handlers != null )
			{
				for each( var handler : Function in handlers )
				{
					handler.apply( this, [ source, notification ] );
				}
			}
		}
		
	}
}