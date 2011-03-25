package org.servebox.cafe.core.application
{
	import org.servebox.cafe.core.spring.ApplicationContext;
	
	import spark.components.Application;
	
	public class Application extends spark.components.Application implements CafeApplication
	{
		private var _context : ApplicationContext;
		
		public function Application()
		{
			super();
			ApplicationInitializer.prepare( this );
			_context = ApplicationInitializer.getDefaultContext();			
		}
		
		public function getContext():ApplicationContext
		{
			return _context;
		}
	}
}