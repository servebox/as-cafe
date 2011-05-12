package org.servebox.cafe.core.layout.impl
{
	import flash.utils.Dictionary;
	
	import mx.core.IVisualElement;
	import mx.core.IVisualElementContainer;
	
	import org.servebox.cafe.core.layout.ILayoutArea;
	import org.servebox.cafe.core.layout.ILayoutAreaManager;
	import org.servebox.cafe.core.view.IView;
	
	public class DefaultLayoutAreaManagerImpl implements ILayoutAreaManager
	{
		private var areas : Dictionary = new Dictionary();
		
		public function addArea(id:String, area:ILayoutArea ):void
		{
			// FIXME Check whether the area or container is already in use.
			areas[id]=area;
		}
		
		public function getArea(id:String):ILayoutArea
		{
			return areas[id];
		}
		
		public function insertInArea(id:String, view : IView ) : void
		{
			getArea(id).add(view);
		}
	}
}