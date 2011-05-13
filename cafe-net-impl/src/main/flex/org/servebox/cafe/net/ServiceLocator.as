/*
 * Servebox ActionScript Foundry / $Id: ServiceLocator.as 81 2007-03-23 16:58:10Z J.F.Mathiot $
 * 
 * Copyright 2006 ServeBox Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License. You may obtain a copy
 * of the License at
 * 
 * http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software distributed under
 * the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
 * either express or implied. See the License for the specific language governing permissions
 * and limitations under the License.
 */
 
package org.servebox.cafe.net
{
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.rpc.AbstractService;
	
	import org.servebox.cafe.core.util.ClassUtils;
	
	
	/**
	 * ServiceLocator holds a reference to services of the application.
	 */
	public class ServiceLocator
	{
        /**
         * The class logger.
         */
		protected static var logger : ILogger = Log.getLogger( ClassUtils.getStandardFullyQualifiedClassName( ServiceLocator ) );
		
		private var servicesAssociativeMap:Object;
		
		/**		
		 * Registers a reference to the service with an id.
		 * @param id give an id to the service
		 * @param service instance of the service
		 */
		public function registerService( id:String, service:AbstractService ) : void
		{
			if( servicesAssociativeMap[ id ] != undefined )
			{
				throw new ServiceAlreadyRegisteredError("Service with id "+ id +" has already been registered");
			}
			servicesAssociativeMap[ id ] = service;
			logger.debug( "Service with id " + id + " registered." );
		}

		/**
		 * Retrieves the reference to a service.
		 * @param id give id of the required service
		 */		
		public function getService( id:String ): AbstractService
		{
			if( servicesAssociativeMap[ id ]==undefined )
			{
				throw new ServiceNotFoundError("Service with id "+id+" not found.");
			}
			return servicesAssociativeMap[ id ];
		}
		
		///////////////////////////////////////////////////
		// Singleton implementation
		///////////////////////////////////////////////////
		private static var instance : ServiceLocator;
		private static var allowInstantiation:Boolean;
		
		public static function getInstance() : ServiceLocator
		{
			if (instance == null)
			{
			    allowInstantiation = true;
	            instance = new ServiceLocator();
	            allowInstantiation = false;
	  		}
			return instance;
		}
		
        /**
         * Creates a new SimpleNotification object.
         */
		public function ServiceLocator()
		{
        	if (!allowInstantiation)
        	{
            	throw new Error( "allowInstantiation == false this is a singleton ");
          	}
			servicesAssociativeMap = new Object();
        }
	}
}