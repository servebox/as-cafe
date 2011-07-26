package org.servebox.cafe.core
{
	import flash.utils.Dictionary;
	
	import org.servebox.cafe.core.application.ICafeApplication;
	import org.servebox.cafe.core.bootstrap.IBootstrap;
	import org.servebox.cafe.core.layout.ILayoutAreaManager;
	import org.servebox.cafe.core.layout.impl.DefaultLayoutAreaManagerImpl;
	import org.servebox.cafe.core.modularity.IApplicationUnit;
	import org.servebox.cafe.core.signal.SignalAggregator;
	import org.servebox.cafe.core.spring.IApplicationContext;
	import org.servebox.cafe.core.spring.IApplicationContextListener;
	import org.servebox.cafe.core.view.IView;
	
	
	public class Container implements IApplicationContextListener
	{
		private static var allowConstruction : Boolean = false;
		private static var instance : Container;
		private var application : ICafeApplication;
		private var _bootstrap : IBootstrap;
		private var _applicationUnitMap : Dictionary;
		private var _layoutAreaManager : ILayoutAreaManager;
		
		public function get signalAggregator() : SignalAggregator
		{
			return SignalAggregator( application.getContext().getObject("signalAggregator") ); 
		}
		
		public function Container()
		{
			if( !allowConstruction )
			{
				throw new Error("Bootstrap should be created using the Bootstrap.create method.");
			}
		}
		
		public function getContext() : IApplicationContext
		{
			return application.getContext();
		}
		
		public static function create( application : ICafeApplication ) : void
		{
			if( getInstance() != null )
			{
				throw new Error("A bootstrap instance already exists.");
			}
			allowConstruction = true;
			instance = new Container();
			allowConstruction = false;
			instance.application = application;
			instance.prepare();
		}
		
		private function prepare() : void
		{
			application.getContext().setListener( this );
			application.getContext().load();
		}
		
		private function run() : void
		{
			bootstrap();
			createShell();
			registerApplicationUnits( _bootstrap.applicationUnits );
		}
		
		private function bootstrap() : void
		{
			_bootstrap = getBootstrap();
			// Initialize the bootstrap
			_bootstrap.initialize( application.getContext() );
			// Register the applicative modules
			// now wait for run().... ( ensure shell is created )
			// Performs additional bootstrap tasks, if required
			_bootstrap.postInitialize( application.getContext() );
		}
		
		// FIXME Change to vector
		private function registerApplicationUnits( units : Array /*Vector.<ApplicationUnit>*/ ) : void
		{
			// Creating the application units definitions map
			_applicationUnitMap = new Dictionary();
			for each( var unit : IApplicationUnit in units )
			{
				_applicationUnitMap[ unit.id ] = unit;
				// For each unit, if it is supposed to load at startup, preparing it
				if( unit.loadAtStartup )
				{
					unit.prepare( application.getContext() );
				}
			}
		}
		
		public function prepareApplicationUnit( id : String ) : void
		{
			var unit : IApplicationUnit = _applicationUnitMap[ id ];
			if ( unit != null && !unit.isStarted )
			{
				unit.prepare( application.getContext() );
			}
		}
		
		private function createShell() : void
		{
			application.addElement( IView( application.getContext().getObject("shellView") ) );
		}
		
		public function getBootstrap() : IBootstrap
		{
			return IBootstrap( application.getContext().getObject("bootstrap") );
		}
		
		public function getLayoutAreaManager() : ILayoutAreaManager
		{
			if( _layoutAreaManager )
			{
				return _layoutAreaManager;
			}
			try
			{
				_layoutAreaManager = ILayoutAreaManager( application.getContext().getObject("layoutAreaManager") );
			}
			catch( e : Error )
			{
				// TODO Info this asas log facility is ready
				_layoutAreaManager = new DefaultLayoutAreaManagerImpl();
			}
			return _layoutAreaManager;
		}
		
		public function applicationContextReady() : void
		{
			run();
		}
		
		public static function getInstance() : Container
		{
			return instance;
		}
	}
}
