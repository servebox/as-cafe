package org.servebox.cafe.core
{
	import flash.utils.Dictionary;

	import org.servebox.cafe.core.application.CafeApplication;
	import org.servebox.cafe.core.bootstrap.Bootstrap;
	import org.servebox.cafe.core.layout.LayoutAreaManager;
	import org.servebox.cafe.core.layout.impl.DefaultLayoutAreaManagerImpl;
	import org.servebox.cafe.core.modularity.ApplicationUnit;
	import org.servebox.cafe.core.spring.ApplicationContextListener;
	import org.servebox.cafe.core.view.View;


	public class Container implements ApplicationContextListener
	{
		private static var allowConstruction : Boolean = false;
		private static var instance : Container;
		private var application : CafeApplication;
		private var _bootstrap : Bootstrap;
		private var _applicationUnitMap : Dictionary;
		private var _layoutAreaManager : LayoutAreaManager;

		public function Container()
		{
			if( !allowConstruction )
			{
				throw new Error("Bootstrap should be created using the Bootstrap.create method.");
			}
		}

		public static function create( application : CafeApplication ) : void
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
			// initializeLogging();
			bootstrap();
			createShell();
		}

		private function bootstrap() : void
		{
			_bootstrap = getBootstrap();
			// Initialize the bootstrap
			_bootstrap.initialize( application.getContext() );
			// Register the applicative modules
			registerApplicationUnits( _bootstrap.applicationUnits );
			// Register the application model : could this be done using autowiring ? I guess so...
			//var models : Vector.<PresentationModel> = bootstrap.getPresentationModels( application.getMainContext() );
			// Performs additional bootstrap tasks, if required
			_bootstrap.postInitialize( application.getContext() );
		}

		// FIXME Change to vector
		private function registerApplicationUnits( units : Array /*Vector.<ApplicationUnit>*/ ) : void
		{
			// Creating the application units definitions map
			// TODO Should be delegated to another object ?
			_applicationUnitMap = new Dictionary();
			for each( var unit : ApplicationUnit in units )
			{
				_applicationUnitMap[ unit.id ] = unit;
				// For each unit, if it is supposed to load at startup, preparing it
				if( unit.loadAtStartup )
				{
					unit.prepare( application.getContext() );
				}
			}
		}

		private function createShell() : void
		{
			application.addElement( View( application.getContext().getObject("shellView") ) );
		}

		public function getBootstrap() : Bootstrap
		{
			return Bootstrap( application.getContext().getObject("bootstrap") );
		}

		public function getLayoutAreaManager() : LayoutAreaManager
		{
			if( _layoutAreaManager )
			{
				return _layoutAreaManager;
			}
			try
			{
				_layoutAreaManager = LayoutAreaManager( application.getContext().getObject("layoutAreaManager") );
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
