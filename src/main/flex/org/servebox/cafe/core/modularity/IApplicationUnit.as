package org.servebox.cafe.core.modularity
{
	import org.servebox.cafe.core.spring.IApplicationContext;

	public interface IApplicationUnit
	{
		function get id() : String;
		function set id( value : String ) : void;
		function get loadAtStartup() : Boolean;
		function set loadAtStartup( value : Boolean ) : void;
		function get configLocations() : Array;
		function set configLocations( value : Array ) : void;
		function prepare( parentContext : IApplicationContext/*, listener : ApplicationUnitListener*/ ) : void;
		function start( /*listener : ApplicationUnitListener*/ ) : void;
	}
}