package org.servebox.cafe.core.spring
{
	import flash.events.Event;
	import flash.utils.getQualifiedClassName;
	
	import org.as3commons.lang.ClassUtils;
	import org.springextensions.actionscript.context.IApplicationContext;
	import org.springextensions.actionscript.context.support.XMLApplicationContext;

	
	public class FlexXmlApplicationContext extends XMLApplicationContext implements org.servebox.cafe.core.spring.IApplicationContext
	{
		private var _listener : IApplicationContextListener;
		
		public function FlexXmlApplicationContext(source:*=null, parent:IApplicationContext=null)
		{
			super(source, parent);
		}
		
		public function setListener( l : IApplicationContextListener ) : void
		{
			this._listener = l;
		}
		
		override protected function completeHandler(event:Event):void
		{
			super.completeHandler( event );
			_listener.applicationContextReady();
		}
		
		public function getObjectFromApplicationUnit( applicationUnitClass : Class, obj : Class ) : *
		{
			return getObject( getQualifiedClassName(applicationUnitClass) + "." + ClassUtils.getName(obj) );
		}
		
	}
}