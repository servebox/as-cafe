package org.servebox.cafe.core.observer
{
	import flash.utils.Dictionary;
	import flash.utils.getQualifiedClassName;
	
	import org.servebox.cafe.core.signal.ISignalObserver;
	import org.servebox.cafe.core.signal.Signal;

	public class AbstractObservable implements IObservable
	{
		
		private var observersDictionary : Dictionary = new Dictionary();
		
		private static const ALL_NOTIFICATIONS : String = "org.servebox.cafe.core.observer::AbstractObservable.ALL_NOTIFICATIONS";

		public function registerObserver( o : IObserver, notificationFilters : Array = null ) : void
		{
			var observers : Array;
			var obs : IObserver
			// Observer instance will receive all notifications, whatever their types.
			if( notificationFilters == null )
			{
				// Adding the observer to the ALL_NOTIFICATIONS set.
				observers = observersDictionary[ ALL_NOTIFICATIONS ] as Array;
				if( observers != null )
				{
					for each(obs in observers)
					{
						// The observer has already been registered
						if(  obs == o)
						{
							return;
						}
					}
					observersDictionary[ ALL_NOTIFICATIONS ].push( o );
				}
				else
				{
					// Creating the array
					observersDictionary[ALL_NOTIFICATIONS] = [o];
				}
				// Search and destroy the observer instances inside the dictionary to avoid multiple update calls.
				for ( var notificationType : String in observersDictionary )
				{
					if( notificationType == ALL_NOTIFICATIONS )
					{
						continue;
					}
					observers = observersDictionary[ notificationType ];
					for( var i : uint; i < observers.length ; i++ )
					{
						if( observers[i] == o )
						{
							observers.splice( i--, 1 );
						}
					}
				}
			} else {
				handleFilters(o,notificationFilters);
			}
		}
		

		protected function handleFilters(o : IObserver, notificationFilters : Array = null) : void
		{
			// Label label_filters
			for each( var notificationFilter : Class in notificationFilters )
			{
				addObserver(o,getQualifiedClassName(notificationFilter));
			}
		}
		
		
		protected function addObserver(o : IObserver, key : String ) : void
		{
			var observers : Array;
			if( observersDictionary[ key ] == null )
			{
				observers = [ o ];
				observersDictionary[ key ] = observers;
			}
			else 
			{
				observers = observersDictionary[ key ] as Array;
				for each( var obs : IObserver in observers )
				{
					if( obs == o ){
						return;
					}
				}
				observersDictionary[ key ].push( o );
			}
		}
		
		
		public function unregisterObserver( o : IObserver ) : void
		{
			for each( var observers : Array in observersDictionary )
			{
				for( var i : uint = 0; observers != null && i < observers.length ; i++ )
				{
					if( observers[i] == o )
					{
						observers.splice( i--, 1 );
					}
				}
			}
		}
		
		public function notifyObservers( notification : Notification ) : void
		{
			var observers : Array = observersDictionary[ getQualifiedClassName( notification ) ] as Array;
			if( observers == null && observersDictionary[ ALL_NOTIFICATIONS ] != null )
			{
				observers = observersDictionary[ ALL_NOTIFICATIONS ] as Array;
			}
			else if( observersDictionary[ ALL_NOTIFICATIONS ] != null )
			{
				observers = observers.concat( observersDictionary[ ALL_NOTIFICATIONS ] );
			}
			else if ( observers == null )
			{
				observers = [];
			}
			for each(var o : IObserver in observers )
			{
				o.update( this, notification );
			}
		}
		
		public function signalObservers( signal : Signal ) : void
		{
			var observers : Array = observersDictionary[ signal.getType() ] as Array;
			if( observers == null && observersDictionary[ ALL_NOTIFICATIONS ] != null )
			{
				observers = observersDictionary[ ALL_NOTIFICATIONS ] as Array;
			}
			else if( observersDictionary[ ALL_NOTIFICATIONS ] != null )
			{
				observers = observers.concat( observersDictionary[ ALL_NOTIFICATIONS ] );
			}
			else if ( observers == null )
			{
				observers = [];
			}
			for each(var o : ISignalObserver in observers )
			{
				o.update( this, signal );
			}			
		}

	}
}