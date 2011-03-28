package org.servebox.cafe.core.observer
{
	public interface IObserver
	{
		function update( source : IObservable, notification : Notification ) : void;
	}
}