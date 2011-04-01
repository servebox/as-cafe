package org.servebox.cafe.core.command
{
	public interface IParameterObject
	{
		function set key( value : String ) : void;
		function get key() :String;
		function set value( value : Object ) : void;
		function get value() : Object;
	}
}