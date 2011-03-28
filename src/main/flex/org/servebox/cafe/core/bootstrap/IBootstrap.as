package org.servebox.cafe.core.bootstrap
{
	import org.servebox.cafe.core.model.PresentationModel;
	import org.servebox.cafe.core.modularity.IApplicationUnit;
	import org.servebox.cafe.core.spring.IApplicationContext;

	public interface IBootstrap
	{
		function initialize( context : IApplicationContext ) : void;
		// FIXME Change with vector as soon as the VectorReferenceResolver provided by Spring has been fixed
		function get applicationUnits() : Array /*Vector.<ApplicationUnit>*/;
		function set applicationUnits( units : Array /*Vector.<ApplicationUnit>*/) : void;
		function postInitialize( context : IApplicationContext ) : void;
	}
}