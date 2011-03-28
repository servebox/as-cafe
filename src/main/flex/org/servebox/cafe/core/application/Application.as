package org.servebox.cafe.core.application
{
	import org.servebox.cafe.core.spring.IApplicationContext;
	
	import spark.components.Application;
	
	public class Application extends spark.components.Application implements ICafeApplication
	{
		private var _context : IApplicationContext;
		
		public function Application()
		{
			super();
			ApplicationInitializer.prepare( this );
			_context = ApplicationInitializer.getDefaultContext();			
		}
		
		public function getContext():IApplicationContext
		{
			return _context;
		}
	}
}