package org.servebox.cafe.core.observer
{
	public interface IObservable
	{

		function registerObserver( o : IObserver, notificationFilters : Array = null ) : void
		function unregisterObserver( o : IObserver ) : void
		function notifyObservers( notification : Notification ) : void

	}
}