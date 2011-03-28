package org.servebox.cafe.core.application
{
	import org.servebox.cafe.core.spring.IApplicationContext;
	
	import spark.components.WindowedApplication;
	
	public class WindowedApplication extends spark.components.WindowedApplication implements ICafeApplication
	{
		private var _context : IApplicationContext;
		
		public function WindowedApplication()
		{
			super();
			ApplicationInitializer.prepare( this );
			_context = ApplicationInitializer.getDefaultContext();
		}
		
		public function getContext() : IApplicationContext
		{
			return _context;
		}
	}
}