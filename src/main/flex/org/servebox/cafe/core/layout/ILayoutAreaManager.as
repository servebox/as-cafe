package org.servebox.cafe.core.layout
{
	import org.servebox.cafe.core.view.IView;

	public interface ILayoutAreaManager
	{
		function addArea( regionName : String, area : ILayoutArea ) : void;
		function getArea( regionName : String ) : ILayoutArea;
		function insertInArea( regionName : String, view : IView) : void;
	}
}