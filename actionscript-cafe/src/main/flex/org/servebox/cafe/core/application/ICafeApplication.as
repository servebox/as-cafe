package org.servebox.cafe.core.application
{
	import mx.core.IVisualElementContainer;
	
	import org.servebox.cafe.core.spring.IApplicationContext;
	import org.springextensions.actionscript.context.IConfigurableApplicationContext;

	public interface ICafeApplication extends IVisualElementContainer
	{
		function getContext() : IApplicationContext;
		function set cafeContext( embeddedContext : Class ) : void
	}
}