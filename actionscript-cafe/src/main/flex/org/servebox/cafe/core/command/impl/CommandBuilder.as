package org.servebox.cafe.core.command.impl
{
	import org.servebox.cafe.core.command.IParameterizableCommand;

	public class CommandBuilder
	{
		
		public static function executeParametersCommand( command : IParameterizableCommand, parameters : Array ) : void
		{
			command.parameters = [];
			for each ( var param : Object in parameters )
			{
				command.parameters.push( buildParam( param.key, param.value ) );
			}
			command.execute();
		}
		
		public static function executeCommand( command : IParameterizableCommand, key : String, value : Object ) : void
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