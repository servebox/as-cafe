package org.servebox.cafe.core.bootstrap.impl
{
	import flash.utils.Dictionary;
	
	import org.servebox.cafe.core.bootstrap.Bootstrap;
	import org.servebox.cafe.core.modularity.ApplicationUnit;
	import org.servebox.cafe.core.spring.ApplicationContext;


	public class DefaultBootstrapImpl implements Bootstrap
	{
		private var _applicationUnits : Array;
		
		public function initialize( context : ApplicationContext ) : void
		{
		}
		
		public function get applicationUnits() : Array/*Vector.<ApplicationUnit>*/
		{
			return _applicationUnits;
		}
		
		public function set applicationUnits( units : Array/*Vector.<ApplicationUnit>*/ ) : void
		{
			this._applicationUnits = units;
		}
		
		public function postInitialize( context : ApplicationContext ) : void
		{
			
		}

	}
}
