package org.servebox.cafe.core.command
{
	public class CommandBuilder
	{
		public static function executeCommand( command : IStateCommand, key : String, value : Object ) : void
		{
			command.parameters = [buildParam( key, value) ];
			command.execute();				
		}
		
		public static function buildParam(  key : String, value : Object ) : AbstractParameterObject
		{
			var param : AbstractParameterObject = new AbstractParameterObject();
			param.key = key;
			param.value = value;
			return param;
		}
	}
}