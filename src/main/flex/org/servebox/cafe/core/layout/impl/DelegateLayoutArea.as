package org.servebox.cafe.core.layout.impl
{
	import flash.sampler.getInvocationCount;
	
	import mx.core.IVisualElement;
	import mx.core.IVisualElementContainer;
	
	import org.servebox.cafe.core.Container;
	import org.servebox.cafe.core.layout.LayoutArea;
	import org.servebox.cafe.core.layout.LayoutAreaManager;
	import org.servebox.cafe.core.view.View;
	
	import spark.components.NavigatorContent;
	
	public class DelegateLayoutArea implements LayoutArea
	{
		private var _container : IVisualElementContainer;
		private var _views : Vector.<View> = new Vector.<View>();
		private var _id : String;
		
		public function DelegateLayoutArea( container : IVisualElementContainer = null )
		{
			this.container = container;
		}
		
		public function add(view:View):void
		{
			_views.push( view );
			container.addElement( view );
		}
		
		public function remove(view:View):void
		{
			container.removeElement( view );
			for(var i : int = 0; i < _views.length; i++ )
			{
				if( _views[i] == view )
				{
					_views = _views.slice( i, 1 );
					break;
				}
			}
		}
		
		[Bindable]
		public function set container( value : IVisualElementContainer ) : void
		{
			_container = value;
			var manager : LayoutAreaManager = Container.getInstance().getLayoutAreaManager();
			manager.addArea( id, this );
		}
		
		public function get container() : IVisualElementContainer
		{
			return _container;
		}
		
		[Bindable ]
		public function get id() : String
		{
			return _id;
		}
		
		public function set id( value : String ): void
		{
			_id = value;
		}
		
	}
}