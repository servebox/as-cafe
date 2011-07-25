package org.servebox.cafe.core.application
{
	import flash.utils.Dictionary;
	
	import org.servebox.cafe.core.spring.FlexXmlApplicationContext;
	import org.servebox.cafe.core.spring.IApplicationContext;
	import org.springextensions.actionscript.context.support.XMLApplicationContext;
	
	import spark.components.Application;
	
	public class Application extends spark.components.Application implements ICafeApplication
	{
		private var _context : IApplicationContext;
		
		public var useEmbeddedContext : Boolean;
		
		private var _defaultEmbeddedContextClazz : Class;
		
		private var _embeddedApplicationContexts : Dictionary = new Dictionary();
		
		public function Application()
		{
			super();
			ApplicationInitializer.prepare( this );
			
			if ( useEmbeddedContext )
			{
				_context = ApplicationInitializer.getDefaultContext()
			}
			else
			{
				// use defaultEmbeddedContextClazz
			}
		}
		
		public function set defaultEmbeddedContextClazz(value:Class):void
		{
			_context = new FlexXmlApplicationContext();
			FlexXmlApplicationContext( _context ).addEmbeddedConfig( value );
			//_context.load();
		}

		public function getContext():IApplicationContext
		{
			return _context;
		}
	}
}