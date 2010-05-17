package org.servebox.cafe.core.layout
{
	import mx.core.IVisualElementContainer;

	public interface LayoutAreaManager
	{
		function addArea( id : String, area : LayoutArea ) : void;
		function getArea( id : String ) : LayoutArea;
	}
}