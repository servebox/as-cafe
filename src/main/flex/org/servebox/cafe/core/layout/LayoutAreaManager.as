package org.servebox.cafe.core.layout
{
	import mx.core.IVisualElementContainer;

	public interface LayoutAreaManager
	{
		function addArea( regionName : String, area : LayoutArea ) : void;
		function getArea( regionName : String ) : LayoutArea;
	}
}