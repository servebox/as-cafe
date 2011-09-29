package org.servebox.cafe.core.application
{
	import org.servebox.cafe.core.spring.FlexXmlApplicationContext;
	import org.servebox.cafe.core.spring.IApplicationContext;
	
	import spark.components.ViewNavigatorApplication;
	
	public class MobileCafeApplication extends ViewNavigatorApplication implements ICafeApplication
	{
		private var _context : IApplicationContext;
		
		public var useEmbeddedContext : Boolean;
		
		public function MobileCafeApplication()
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