package org.servebox.cafe.core.data
{
	import org.servebox.cafe.core.observer.AbstractObservable;
	
	public class AbstractDataModel extends AbstractObservable
	{
		private var _state : int;
		
		
		/**
		 * Change the state of the data model and notify the observers.
		 */
		protected function setState( value : int ) : void
		{
			if( value != ModelState.FETCHING && value != ModelState.INVALID && value != ModelState.ACTIVE )
			{
				throw new Error("Incorrect state : " + value + ", should be one of ModelState.FETCHING, ModelState.INVALID, ModelState.ACTIVE.");
			}
			_state = value;
			notifyObservers( new ModelStateNotification( _state ) );
		}
		
		public function getState() : int
		{
			return _state;
		}
	}
}