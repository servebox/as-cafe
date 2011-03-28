package org.servebox.cafe.core.observer
{
	import flash.utils.Dictionary;
	import flash.utils.getQualifiedClassName;

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
				// Label label_filters
				label_filters : for each( var notificationFilter : Class in notificationFilters )
				{
					if( observersDictionary[ getQualifiedClassName( notificationFilter ) ] == null )
					{
						observers = [ o ];
						observersDictionary[ getQualifiedClassName( notificationFilter ) ] = observers;
					}
					else 
					{
						observers = observersDictionary[ getQualifiedClassName( notificationFilter ) ] as Array;
						for each( obs in observers )
						{
							if( obs == o ){
								continue label_filters;
							}
						}
						observersDictionary[ getQualifiedClassName( notificationFilter )].push( o );
					}
				}
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

	}
}