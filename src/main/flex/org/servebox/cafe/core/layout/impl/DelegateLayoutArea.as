package org.servebox.cafe.core.layout.impl
{
	import mx.collections.ArrayCollection;
	import mx.core.IVisualElementContainer;
	
	import org.servebox.cafe.core.Container;
	import org.servebox.cafe.core.layout.ILayoutArea;
	import org.servebox.cafe.core.layout.ILayoutAreaManager;
	import org.servebox.cafe.core.view.IView;
	
	public class DelegateLayoutArea implements ILayoutArea
	{
		private var _container : IVisualElementContainer;
		private var _views : Vector.<IView> = new Vector.<IView>();
		private var _name : String;
		
		public function DelegateLayoutArea( container : IVisualElementContainer = null )
		{
			this.container = container;
		}
		
		public function add(view:IView):void
		{
			_views.push( view );
			container.addElement( view );
		}
		
		public function remove(view:IView):void
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
		
		public function getViews() : ArrayCollection
		{
			var viewList : ArrayCollection = new ArrayCollection();
			for each ( var view : IView in _views )
			{
				viewList.addItem(view);
			}
			return viewList;
		}
		
		[Bindable]
		public function set container( value : IVisualElementContainer ) : void
		{
			_container = value;
			if( value && name )
			{
				register();
			}
		}
		
		public function get container() : IVisualElementContainer
		{
			return _container;
		}
		
		[Bindable]
		public function get name() : String
		{
			return _name;
		}
		
		public function set name( value : String ): void
		{
			_name = value;
			if( value && name )
			{
				register();
			}
		}
		
		private function register() : void
		{
			var manager : ILayoutAreaManager = Container.getInstance().getLayoutAreaManager();
			manager.addArea( name, this );
		}
		
	}
}