package org.servebox.cafe.core.util
{
	import org.servebox.cafe.core.modularity.ApplicationUnit;

	public class ApplicationUnitUtils
	{
		public static function getDefaultContextLocation( unit : ApplicationUnit ) : String
		{
			return unit.id.toLowerCase() + ".xml";
		}
	}
}