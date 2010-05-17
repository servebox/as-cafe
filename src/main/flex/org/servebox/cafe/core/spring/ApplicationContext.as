package org.servebox.cafe.core.spring
{
	import org.springextensions.actionscript.context.IConfigurableApplicationContext;

	public interface ApplicationContext extends IConfigurableApplicationContext
	{
		function setListener( listener : ApplicationContextListener ) : void;
		function load() : void;
		
	}
}