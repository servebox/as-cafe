package org.servebox.cafe.core.application
{
	import flash.utils.Dictionary;
	
	import org.servebox.cafe.core.spring.FlexXmlApplicationContext;
	import org.servebox.cafe.core.spring.IApplicationContext;
	
	import spark.components.WindowedApplication;
	
	public class WindowedApplication extends spark.components.WindowedApplication implements ICafeApplication
	{
		private var _context : IApplicationContext;
		
		public var useEmbeddedContext : Boolean;
		
		public function WindowedApplication()
		{
			super();
			if ( !useEmbeddedContext )
			{
				ApplicationInitializer.prepare( this );
				_context = ApplicationInitializer.getDefaultContext();
			}
		}
		
		public function set cafeContext( embeddedContext : Class ) : void
		{
			_context = new FlexXmlApplicationContext();
			FlexXmlApplicationContext( _context ).addEmbeddedConfig( embeddedContext );
			//_context.load();
		}
		
		
		public function getContext() : IApplicationContext
		{
			return _context;
		}
	}
}