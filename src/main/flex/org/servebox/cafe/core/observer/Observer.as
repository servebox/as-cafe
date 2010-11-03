package org.servebox.cafe.core.observer
{
	public interface Observer
	{
		function update( source : Observable, notification : Notification ) : void;
	}
}