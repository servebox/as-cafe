package org.servebox.cafe.core.layout.impl
{
	import flash.utils.Dictionary;
	
	import mx.core.IVisualElement;
	import mx.core.IVisualElementContainer;
	
	import org.servebox.cafe.core.layout.LayoutArea;
	import org.servebox.cafe.core.layout.LayoutAreaManager;
	import org.servebox.cafe.core.view.View;
	
	public class DefaultLayoutAreaManagerImpl implements LayoutAreaManager
	{
		private var areas : Dictionary = new Dictionary();
		
		public function addArea(id:String, area:LayoutArea ):void
		{
			// FIXME Check whether the area or container is already in use.
			areas[id]=area;
		}
		
		public function getArea(id:String):LayoutArea
		{
			return areas[id];
		}
		
		public function insertInArea(id:String, view : View ) : void
		{
			getArea(id).add(view);
		}
	}
}