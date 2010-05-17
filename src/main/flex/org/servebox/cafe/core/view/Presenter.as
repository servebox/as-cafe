package org.servebox.cafe.core.view
{
	public class Presenter
	{
		
		private var _view : View;
		
		public function get view() : View
		{
			return _view;
		}
		
		public function set view( v : View ) : void
		{
			_view = v;
		}
	}
}