package org.servebox.cafe.core.spring
{
	import flash.events.Event;
	import flash.utils.getQualifiedClassName;
	
	import org.as3commons.lang.ClassUtils;
	import org.springextensions.actionscript.context.IApplicationContext;
	import org.springextensions.actionscript.context.support.XMLApplicationContext;
	
	public class FlexXmlEmbeddedApplicationContext extends XMLApplicationContext implements IApplicationContext
	{
		private var _listener : IApplicationContextListener;
		
		public function FlexXmlEmbeddedApplicationContext()
		{
			super();
		}
		
		public function setListener(listener:IApplicationContextListener):void
		{
			this._listener = listener;
		}
		
		public function getObjectFromApplicationUnit(applicationUnitClass:Class, obj:Class):*
		{
			return getObject( getQualifiedClassName(applicationUnitClass) + "." + ClassUtils.getName(obj) );
		}
	}
}