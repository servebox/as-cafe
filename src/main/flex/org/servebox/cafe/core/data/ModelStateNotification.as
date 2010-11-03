package org.servebox.cafe.core.data
{
	import flash.utils.getQualifiedClassName;
	
	import org.servebox.cafe.core.observer.Notification;

	public class ModelStateNotification extends Notification
	{
		public function ModelStateNotification( modelState : int )
		{
			super( getQualifiedClassName( this ), modelState );
		}
		
		public function getModelState() : int
		{
			return getCargo() as int;
		}
	}
}