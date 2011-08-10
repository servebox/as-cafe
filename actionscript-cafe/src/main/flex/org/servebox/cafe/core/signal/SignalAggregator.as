/*
* actionscript-cafe SignalAggregator 18 avr. 2011 adesmarais
* 
* Created by Servebox 
* Copyright 2010 Servebox (c) All rights reserved. You may not use, distribute
* or modify this code under its source or binary form
* without the express authorization of ServeBox. Contact : info@servebox.com
*/
package org.servebox.cafe.core.signal
{
	import mx.logging.ILogger;
	import mx.logging.Log;
	
	import org.servebox.cafe.core.observer.AbstractObservable;
	import org.servebox.cafe.core.observer.IObservable;
	import org.servebox.cafe.core.observer.IObserver;
	import org.servebox.cafe.core.observer.Notification;
	
	public class SignalAggregator extends AbstractObservable
	{
		
		public var log : ILogger = Log.getLogger("SignalAggregator");
		
		override public function registerObserver(o:IObserver, notificationFilters:Array=null):void
		{
			if ( !(o is ISignalObserver ) )
			{
				throw new Error("Observer of SignalAggregator should be ISignalObserver");
			}
			super.registerObserver( ISignalObserver( o ), notificationFilters );
		}
		
		override public function unregisterObserver(o:IObserver):void
		{
			if ( !(o is ISignalObserver ) )
			{
				throw new Error("Observer of SignalAggregator should be ISignalObserver");
			}
			super.unregisterObserver( ISignalObserver( o ) );			
		}
		
		public function signal( type : String, ... cargo) : void
		{
			log.info("SignalAggregator runs " + type );
			
			if( cargo.length > 0 )
			{
				var signal : Signal = new Signal(type);
				signal.setCargoList(cargo);
				super.signalObservers( signal );
			}
			else
			{
				super.signalObservers( new Signal(type) );
			}
		}
		
		override protected function handleFilters(o : IObserver, notificationFilters : Array = null) : void
		{
			// Label label_filters
			for each( var notificationFilter : String in notificationFilters )
			{
				addObserver(o,notificationFilter);
			}
		}

		
	}
}