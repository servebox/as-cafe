package org.servebox.cafe.core.observer
{
	public interface Observable
	{

		function registerObserver( o : Observer, notificationFilters : Array = null ) : void
		function unregisterObserver( o : Observer ) : void
		function notifyObservers( notification : Notification ) : void

	}
}