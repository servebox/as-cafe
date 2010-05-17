package org.servebox.cafe.core.modularity
{
	import org.servebox.cafe.core.spring.ApplicationContext;

	public interface ApplicationUnit
	{
		function get id() : String;
		function set id( value : String ) : void;
		function get loadAtStartup() : Boolean;
		function set loadAtStartup( value : Boolean ) : void;
		function get configLocations() : Array;
		function set configLocations( value : Array ) : void;
		function prepare( parentContext : ApplicationContext/*, listener : ApplicationUnitListener*/ ) : void;
		function start( /*listener : ApplicationUnitListener*/ ) : void;
	}
}