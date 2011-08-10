package org.servebox.cafe.core.command.impl
{
	import org.servebox.cafe.core.command.INullableParameterObject;

	public class NullableParameterObject extends AbstractParameterObject implements INullableParameterObject
	{
		public function NullableParameterObject(keyParam:String="", valueParam:Object=null)
		{
			super(keyParam, valueParam);
		}
	}
}