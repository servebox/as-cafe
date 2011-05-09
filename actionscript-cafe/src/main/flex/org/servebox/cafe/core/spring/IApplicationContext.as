package org.servebox.cafe.core.spring
{
	import org.servebox.cafe.core.modularity.IApplicationUnit;
	import org.springextensions.actionscript.context.IConfigurableApplicationContext;

	public interface IApplicationContext extends IConfigurableApplicationContext
	{
		function setListener( listener : IApplicationContextListener ) : void;
		function load() : void;
		function getObjectFromApplicationUnit( applicationUnitClass : Class, obj : Class ) : *; 
		
	}
}