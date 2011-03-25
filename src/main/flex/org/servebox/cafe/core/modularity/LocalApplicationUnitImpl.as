package org.servebox.cafe.core.modularity
{
	import org.servebox.cafe.core.Container;
	import org.servebox.cafe.core.application.ApplicationInitializer;
	import org.servebox.cafe.core.layout.LayoutArea;
	import org.servebox.cafe.core.layout.LayoutAreaManager;
	import org.servebox.cafe.core.spring.ApplicationContext;
	import org.servebox.cafe.core.spring.ApplicationContextListener;
	import org.servebox.cafe.core.util.ApplicationUnitUtils;
	import org.servebox.cafe.core.view.View;

	
	public class LocalApplicationUnitImpl implements ApplicationUnit, ApplicationContextListener
	{
		private var _id : String;
		private var _loadAtStartup  :Boolean = false;
		private var _configLocations : Array;
		private var _context : ApplicationContext;
		
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
		
		protected function getContext() : ApplicationContext
		{
			return _context;
		}
		
		protected function initializeContext( parentContext : ApplicationContext ) : void
		{
			_context = ApplicationInitializer.getContextInstance( configLocations, parentContext );
		}
		
		public function prepare(parentContext:ApplicationContext):void
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
		
		public function getLayoutAreaManager() : LayoutAreaManager
		{
			return Container.getInstance().getLayoutAreaManager();
		}
		
		public function cleanLayout( layoutName : String ) : void
		{
			var layoutArea : LayoutArea = getLayoutAreaManager().getArea(layoutName);
			for each ( var view : View in layoutArea.getViews() )
			{
				layoutArea.remove(view);
			}
		}
		
		public function start():void
		{
		}
	}
}
