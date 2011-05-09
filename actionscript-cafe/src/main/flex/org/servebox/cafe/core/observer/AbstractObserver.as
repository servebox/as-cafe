/*
* actionscript-cafe AbstractObserver 18 avr. 2011 adesmarais
* 
* Created by Servebox 
* Copyright 2010 Servebox (c) All rights reserved. You may not use, distribute
* or modify this code under its source or binary form
* without the express authorization of ServeBox. Contact : info@servebox.com
*/
package org.servebox.cafe.core.observer
{
	import flash.events.EventDispatcher;
	import flash.utils.Dictionary;
	import flash.utils.describeType;
	
	import org.servebox.cafe.core.observer.IObservable;
	import org.servebox.cafe.core.observer.IObserver;
	import org.servebox.cafe.core.observer.Notification;
	import org.servebox.cafe.core.signal.Signal;

	public class AbstractObserver extends EventDispatcher implements IObserver
	{
		public function AbstractObserver()
		{
		}
		
		private var notificationHandlers : Dictionary = null;
		private var signalHandlers : Dictionary = null;
		
		private function loadMetadata() : void
		{
			if( notificationHandlers != null )
			{
				return;
			}
			
			notificationHandlers = new Dictionary();
			signalHandlers = new Dictionary();
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
					for each ( var metadataSignal : XML in method.metadata.(@name="SignalHandler") )
					{
						var signal : String = metadataSignal.arg.(@key=="triggerFor").@value;
						if( signal.length < 1 )
						{
							continue;
						}
						if( signalHandlers[ signal ] == null )
						{
							signalHandlers[ signal ] = [];
						}
						signalHandlers[ signal ].push( this[ method.@name ] );
					}
				}catch( e : Error ){}
			}
		}
		
		public function update( source : IObservable, notification : Notification ) : void
		{
			loadMetadata();
			
			if ( !(notification is Signal) )
			{
				var notificationHandlers : Array = notificationHandlers[ notification.getType() ];
				if( notificationHandlers != null )
				{
					for each( var notificationHandler : Function in notificationHandlers )
					{
						notificationHandler.apply( this, [ source, notification ] );
					}
				}
			}
			else
			{
				var signalHandlers : Array = signalHandlers[ notification.getType() ];
				if ( signalHandlers != null )
				{
					for each ( var signalHandler : Function in signalHandlers )
					{
						if ( notification.getCargoList() != null )
						{
							signalHandler.apply( this, notification.getCargoList() );
						}
						else
						{
							signalHandler.apply( this );
						}
					}				
				}
			}
		}
	}
}