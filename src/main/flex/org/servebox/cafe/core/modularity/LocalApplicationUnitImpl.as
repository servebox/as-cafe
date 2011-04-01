package org.servebox.cafe.core.modularity
{
	import flash.utils.getQualifiedClassName;
	
	import org.servebox.cafe.core.Container;
	import org.servebox.cafe.core.application.ApplicationInitializer;
	import org.servebox.cafe.core.layout.ILayoutArea;
	import org.servebox.cafe.core.layout.ILayoutAreaManager;
	import org.servebox.cafe.core.spring.IApplicationContext;
	import org.servebox.cafe.core.spring.IApplicationContextListener;
	import org.servebox.cafe.core.util.ApplicationUnitUtils;
	import org.servebox.cafe.core.view.IView;

	
	public class LocalApplicationUnitImpl implements IApplicationUnit, IApplicationContextListener
	{
		private var _id : String;
		private var _loadAtStartup  :Boolean = false;
		private var _configLocations : Array;
		private var _context : IApplicationContext;
		
		public function LocalApplicationUnitImpl()
		{
			super();
		}
		
		public function get id():String
		{
			return _id;
		}
		
		public function set id(value:String):void
		{
			_id = value;
		}
		
		public function get loadAtStartup():Boolean
		{
			return _loadAtStartup;
		}
		
		public function set loadAtStartup(value:Boolean):void
		{
			_loadAtStartup = value;
		}
		
		public function get configLocations():Array
		{
			if( _configLocations == null )
			{
				_configLocations = [ApplicationUnitUtils.getDefaultContextLocation( this )];
			}
			return _configLocations;
		}
		
		public function set configLocations(value:Array):void
		{
			_configLocations = value;
		}
		
		protected function getContext() : IApplicationContext
		{
			return _context;
		}
		
		protected function initializeContext( parentContext : IApplicationContext ) : void
		{
			_context = ApplicationInitializer.getContextInstance( configLocations, parentContext );
		}
		
		public function prepare(parentContext:IApplicationContext):void
		{
			initializeContext( parentContext );
			// Should we do that ? I guess so
			getContext().setListener( this );
			getContext().load();
		}
		
		public function applicationContextReady() : void
		{
			start();
		}
		
		public function getLayoutAreaManager() : ILayoutAreaManager
		{
			return Container.getInstance().getLayoutAreaManager();
		}
		
		public function cleanLayout( layoutName : String ) : void
		{
			var layoutArea : ILayoutArea = getLayoutAreaManager().getArea(layoutName);
			for each ( var view : IView in layoutArea.getViews() )
			{
				layoutArea.remove(view);
			}
		}
		
		public function getView( id : String ) : IView
		{
			return getContext().getObject(getQualifiedClassName(this) + id );
		}
		
		public function start():void
		{
		}
	}
}
