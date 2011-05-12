package org.servebox.cafe.core.bootstrap.impl
{
	import flash.utils.Dictionary;
	
	import org.servebox.cafe.core.bootstrap.IBootstrap;
	import org.servebox.cafe.core.modularity.IApplicationUnit;
	import org.servebox.cafe.core.spring.IApplicationContext;


	public class DefaultBootstrapImpl implements IBootstrap
	{
		private var _applicationUnits : Array;
		
		public function initialize( context : IApplicationContext ) : void
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
		
		public function getApplicationUnit( clazz : Class ) : IApplicationUnit
		{
			for each ( var o : IApplicationUnit in applicationUnits )
			{
				if ( o is clazz )
				{
					return o;
				}
			}
			throw new Error(" No application unit " + clazz + " in this cafe application context.");
		}
		
		public function postInitialize( context : IApplicationContext ) : void
		{
			
		}

	}
}
