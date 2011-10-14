package org.servebox.cafe.core.util
{
	import org.servebox.cafe.core.modularity.IApplicationUnit;

	public class ApplicationUnitUtils
	{
		public static function getDefaultContextLocation( unit : IApplicationUnit ) : String
		{
			return unit.id.toLowerCase() + ".xml";
		}
	}
}