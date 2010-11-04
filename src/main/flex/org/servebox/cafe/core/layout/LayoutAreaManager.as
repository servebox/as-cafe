package org.servebox.cafe.core.layout
{
	import org.servebox.cafe.core.view.View;

	public interface LayoutAreaManager
	{
		function addArea( regionName : String, area : LayoutArea ) : void;
		function getArea( regionName : String ) : LayoutArea;
		function insertInArea( regionName : String, view : View) : void;
	}
}