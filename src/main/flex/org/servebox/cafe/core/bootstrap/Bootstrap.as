package org.servebox.cafe.core.bootstrap
{
	import org.servebox.cafe.core.model.PresentationModel;
	import org.servebox.cafe.core.modularity.ApplicationUnit;
	import org.servebox.cafe.core.spring.ApplicationContext;

	public interface Bootstrap
	{
		function initialize( context : ApplicationContext ) : void;
		function getApplicationUnits( context : ApplicationContext ) : Vector.<ApplicationUnit>;
		function postInitialize( context : ApplicationContext ) : void;
	}
}