package org.servebox.cafe.core.application
{
	import org.servebox.cafe.core.spring.ApplicationContext;
	
	import spark.components.WindowedApplication;
	
	public class WindowedApplication extends spark.components.WindowedApplication implements CafeApplication
	{
		private var _context : ApplicationContext;
		
		public function WindowedApplication()
		{
			super();
			ApplicationInitializer.prepare( this );
			_context = ApplicationInitializer.getDefaultContext();
		}
		
		public function getMainContext() : ApplicationContext
		{
			return _context;
		}
	}
}