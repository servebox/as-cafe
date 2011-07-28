package org.servebox.cafe.core.layout.impl
{
	import flash.events.IEventDispatcher;
	
	import mx.collections.ArrayCollection;
	import mx.core.IVisualElementContainer;
	import mx.logging.ILogger;
	import mx.logging.Log;
	
	import org.servebox.cafe.core.Container;
	import org.servebox.cafe.core.layout.ILayoutArea;
	import org.servebox.cafe.core.layout.ILayoutAreaManager;
	import org.servebox.cafe.core.view.ILoadView;
	import org.servebox.cafe.core.view.IUnloadView;
	import org.servebox.cafe.core.view.IView;
	
	import spark.events.ElementExistenceEvent;
	
	public class DelegateLayoutArea implements ILayoutArea
	{
		public var log : ILogger = Log.getLogger( "DelegateLayoutArea" );
		private var _container : IVisualElementContainer;
		private var _views : Vector.<IView> = new Vector.<IView>();
		private var _name : String;
		
		public function DelegateLayoutArea( container : IVisualElementContainer = null )
		{
			this.container = container;
		}
		
		public function add(view:IView):void
		{
			cleanAllViews();
			IEventDispatcher( container ).addEventListener( ElementExistenceEvent.ELEMENT_ADD, viewCreationCompleteHandler );
			_views.push( view );
			container.addElement( view );
		}
		
		protected function cleanAllViews() : void
		{
			for(var i : int = 0; i < _views.length; i++ )
			{
				if( _views[i] is IUnloadView )
				{
					IUnloadView( _views[i] ).unload(); 
					remove( _views[i] );
				}
			}
			_views = new Vector.<IView>();
		}
		
		protected function viewCreationCompleteHandler( event : ElementExistenceEvent ) : void
		{
			Container.getInstance().signalAggregator.signal( Object(event.element).className + "_LOADED" );
			if ( event.element is ILoadView )
			{
				ILoadView( event.element ).load(); 
			}
			IEventDispatcher( container ).removeEventListener( ElementExistenceEvent.ELEMENT_ADD, viewCreationCompleteHandler );
		}
		
		public function remove(view:IView):void
		{
			container.removeElement( view );
			Container.getInstance().signalAggregator.signal( Object(view).className + "_UNLOADED" );
			for(var i : int = 0; i < _views.length; i++ )
			{
				if( _views[i] == view )
				{
					_views.splice( i, 1 );
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