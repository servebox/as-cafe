package org.servebox.cafe.core.application
{
	import mx.events.FlexEvent;
	
	import org.servebox.cafe.core.Container;
	import org.servebox.cafe.core.spring.ApplicationContext;
	import org.servebox.cafe.core.spring.FlexXmlApplicationContext;
	
	import spark.components.Application;

	public class ApplicationInitializer
	{
		
		public static function prepare( application : spark.components.Application ) : void
		{
			if( ! ( application is CafeApplication ) )
			{
				throw new Error( "Application should implement the CafeApplication interface." );
			}
			application.addEventListener(FlexEvent.PREINITIALIZE, preinitialize );
		}
		
		private static function preinitialize( event : FlexEvent ) : void
		{
			var app : CafeApplication = CafeApplication( event.target );
			Container.create( app );
		}
		
		public static function getDefaultContext() : ApplicationContext
		{
			return new FlexXmlApplicationContext( getConfigLocations() );
		}
		
		public static function getContextInstance( configLocations : Array, parent : ApplicationContext ) : ApplicationContext
		{
			return new FlexXmlApplicationContext( configLocations, parent );
		}
		
		protected static function getConfigLocations() : Array
		{
			return ["cafe.xml"];
		}
	}
}