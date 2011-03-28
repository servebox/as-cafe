package org.servebox.cafe.core.layout
{
	import mx.collections.ArrayCollection;
	import mx.core.IVisualElementContainer;
	
	import org.servebox.cafe.core.view.IView;

	public interface ILayoutArea
	{
		function add( view : IView ) : void;
		function remove( view : IView ) : void;
		function get container() : IVisualElementContainer;
		function getViews() : ArrayCollection;
	}
}