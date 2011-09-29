package org.servebox.cafe.core.application
{
	import org.servebox.cafe.core.spring.FlexXmlApplicationContext;
	import org.servebox.cafe.core.spring.IApplicationContext;
	
	import spark.components.TabbedViewNavigatorApplication;
	
	public class TabbedMobileCafeApplication extends TabbedViewNavigatorApplication implements ICafeApplication
	{
		
		private var _context : IApplicationContext;
		
		public var useEmbeddedContext : Boolean;
		
		public function TabbedMobileCafeApplication()
		{
			super();
			ApplicationInitializer.prepare( this );
			
			if ( !useEmbeddedContext )
			{
				_context = ApplicationInitializer.getDefaultContext()
			}
		}
		
		public function set cafeContext( embeddedContext : Class ) : void
		{
			_context = new FlexXmlApplicationContext();
			FlexXmlApplicationContext( _context ).addEmbeddedConfig( embeddedContext );
		}
		
		public function getContext():IApplicationContext
		{
			return _context;
		}		
	}
}