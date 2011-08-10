package org.servebox.cafe.core.command
{
	public interface IParameterizableCommand extends ICommand
	{
		function set parameters( ar : Array ) : void;
		function get parameters() : Array;
	}
}