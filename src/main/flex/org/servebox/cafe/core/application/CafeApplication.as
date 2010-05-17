package org.servebox.cafe.core.application
{
	import mx.core.IVisualElementContainer;
	
	import org.servebox.cafe.core.spring.ApplicationContext;
	import org.springextensions.actionscript.context.IConfigurableApplicationContext;

	public interface CafeApplication extends IVisualElementContainer
	{
		function getMainContext() : ApplicationContext;
	}
}