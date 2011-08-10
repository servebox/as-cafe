package org.servebox.cafe.core.command
{
	public class NullableParameterObject extends AbstractParameterObject implements INullableParameterObject
	{
		public function NullableParameterObject(keyParam:String="", valueParam:Object=null)
		{
			super(keyParam, valueParam);
		}
	}
}