package org.servebox.cafe.core.application
{
	import flash.utils.Dictionary;
	
	import org.servebox.cafe.core.spring.FlexXmlApplicationContext;
	import org.servebox.cafe.core.spring.IApplicationContext;
	
	import spark.components.WindowedApplication;
	
	public class WindowedApplication extends spark.components.WindowedApplication implements ICafeApplication
	{
		private var _context : IApplicationContext;
		
		private var _defaultEmbeddedContextClazz : Class;
		
		private var _embeddedApplicationContexts : Dictionary = new Dictionary();
		
		public function WindowedApplication()
		{
			super();
			ApplicationInitializer.prepare( this );
			_context = ApplicationInitializer.getDefaultContext();
		}
		
		public function set defaultEmbeddedContextClazz(value:Class):void
		{
			_context = new FlexXmlApplicationContext();
			FlexXmlApplicationContext( _context ).addEmbeddedConfig( value );
			//_context.load();
		}
		
		public function getEmbeddedApplicationUnitContext( id : String ) : Class
		{
			return _embeddedApplicationContexts[ id ];
		}
		
		public function getContext() : IApplicationContext
		{
			return _context;
		}
	}
}