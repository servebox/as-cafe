package org.servebox.cafe.core.layout
{
	import mx.collections.ArrayCollection;
	import mx.core.IVisualElementContainer;
	
	import org.servebox.cafe.core.view.View;

	public interface LayoutArea
	{
		function add( view : View ) : void;
		function remove( view : View ) : void;
		function getViews() : ArrayCollection;
	}
}