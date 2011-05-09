package org.servebox.cafe.core.application
{
	import mx.events.FlexEvent;
	
	import org.servebox.cafe.core.Container;
	import org.servebox.cafe.core.spring.IApplicationContext;
	import org.servebox.cafe.core.spring.FlexXmlApplicationContext;
	
	import spark.components.Application;

	public class ApplicationInitializer
	{
		
		public static function prepare( application : spark.components.Application ) : void
		{
			if( ! ( application is ICafeApplication ) )
			{
				throw new Error( "Application should implement the CafeApplication interface." );
			}
			application.addEventListener(FlexEvent.PREINITIALIZE, preinitialize );
		}
		
		private static function preinitialize( event : FlexEvent ) : void
		{
			var app : ICafeApplication = ICafeApplication( event.target );
			Container.create( app );
		}
		
		public static function getDefaultContext() : IApplicationContext
		{
			return new FlexXmlApplicationContext( getConfigLocations() );
		}
		
		public static function getContextInstance( configLocations : Array, parent : IApplicationContext ) : IApplicationContext
		{
			return new FlexXmlApplicationContext( configLocations, parent );
		}
		
		protected static function getConfigLocations() : Array
		{
			return ["cafe.xml"];
		}
	}
}