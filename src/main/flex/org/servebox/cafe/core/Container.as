package org.servebox.cafe.core
{
	import org.servebox.cafe.core.application.CafeApplication;
	import org.servebox.cafe.core.bootstrap.Bootstrap;
	import org.servebox.cafe.core.layout.LayoutAreaManager;
	import org.servebox.cafe.core.layout.impl.DefaultLayoutAreaManagerImpl;
	import org.servebox.cafe.core.model.PresentationModel;
	import org.servebox.cafe.core.modularity.ApplicationUnit;
	import org.servebox.cafe.core.spring.ApplicationContextListener;
	import org.servebox.cafe.core.view.Presenter;
	import org.springextensions.actionscript.context.IConfigurableApplicationContext;
	
	import spark.components.Application;

	public class Container implements ApplicationContextListener
	{
		private static var allowConstruction : Boolean = false;
		private static var instance : Container;
		private var application : CafeApplication;
		
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
			application.getMainContext().setListener( this );
			application.getMainContext().load();
		}
		
		private function run() : void
		{
			// initializeLogging();
			bootstrap();
			createShell();
		}
		
		private function bootstrap() : void
		{
			var bootstrap : Bootstrap = getBootstrap();
			// Initialize the bootstrap
			bootstrap.initialize( application.getMainContext() );
			// Register the applicative modules
			registerApplicationUnits( bootstrap.getApplicationUnits( application.getMainContext() ) );
			// Register the application model : could this be done using autowiring ? I guess so...
			//var models : Vector.<PresentationModel> = bootstrap.getPresentationModels( application.getMainContext() );
			// Performs additional bootstrap tasks, if required
			bootstrap.postInitialize( application.getMainContext() );
		}
		
		private function registerApplicationUnits( units : Vector.<ApplicationUnit> ) : void
		{
			// Creating the application units definitions
			
			// For each unit, if it is supposed to load at startup, preparing it
			
		}
		
		private function createShell() : void
		{
			var shellPresenter : Presenter = getPresenter("shellPresenter");
			application.addElement( shellPresenter.view );
		}
		
		public function getPresenter( id : String ) : Presenter
		{
			return Presenter( application.getMainContext().getObject(id) )
		}
		
		public function getBootstrap() : Bootstrap
		{
			return Bootstrap( application.getMainContext().getObject("bootstrap") );
		}
		
		public function getLayoutAreaManager() : LayoutAreaManager
		{
			try
			{
				return LayoutAreaManager( application.getMainContext().getObject("layoutAreaManager") );
			}
			catch( e : Error )
			{
				// TODO Info this asas log facility is ready
			}
			return new DefaultLayoutAreaManagerImpl();
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