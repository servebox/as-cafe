package org.servebox.cafe.core.spring
{
	import flash.events.Event;
	
	import mx.modules.Module;
	
	import org.springextensions.actionscript.context.support.FlexXMLApplicationContext;
	
	public class FlexXmlApplicationContext extends FlexXMLApplicationContext implements ApplicationContext
	{
		private var _listener : ApplicationContextListener;
		
		public function FlexXmlApplicationContext(source:*=null, ownerModule:Module=null)
		{
			super(source, ownerModule);
		}
		
		public function setListener( l : ApplicationContextListener ) : void
		{
			this._listener = l;
		}
		
		override protected function completeHandler(event:Event):void
		{
			super.completeHandler(event);
			_listener.applicationContextReady();
		}
		
		
	}
}