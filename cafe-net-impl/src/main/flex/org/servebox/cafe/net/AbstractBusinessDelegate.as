/*
 * Servebox ActionScript Foundry / $Id: AbstractBusinessDelegate.as 81 2007-03-23 16:58:10Z J.F.Mathiot $
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
	import mx.rpc.AsyncToken;
	import mx.rpc.http.HTTPService;
	import mx.rpc.remoting.RemoteObject;
	import mx.rpc.soap.WebService;
	
	import org.servebox.cafe.core.util.ClassUtils;
	
	/*
	 * The business delegates reduce coupling between the application controller / subcontrollers and the remote service.
	 */
	public class AbstractBusinessDelegate implements IBusinessDelegate
	{
        /**
         * The class logger.
         */
		protected static var logger : ILogger = Log.getLogger( ClassUtils.getStandardFullyQualifiedClassName( AbstractBusinessDelegate ) );
		
		private var _service : Object;
		
		
		/**
		 * Creates a new AbstractBusinessDelegate object.
		 */
		public function AbstractBusinessDelegate( service : Object = null )
		{
			if( service != null )
			{
				setService( service );
			}
		}

        /**
         * @inheritDoc
         */
		public function getService() : Object
		{
			return _service;
		}
		
        /**
         * @inheritDoc
         */
		public function setService( service : Object ) : void
		{
			if( ! ( service is AbstractService ) && ! ( service is HTTPService ) )
			{
				throw new BusinessDelegateServiceError("Object to register as a service should be an AbstractService (RemoteObject, WebService...) or HTTPService instance.");
			}
			else
			{
				if( service is RemoteObject )
				{
					logger.debug( "RemoteObject set ( destination : " + RemoteObject( service ) .destination + ", source : " + RemoteObject( service ).source + ")." );
				}
				else if( service is WebService )
				{
					logger.debug( "WebService set ( destination : " + WebService( service ).destination + ", wsdl : " + WebService( service ).wsdl + ", rootURL : " + WebService( service ).rootURL + ", endpointURI : " + WebService( service ).endpointURI + ")." );
				}
				else if( service is HTTPService )
				{
					logger.debug( "HTTPService set ( destination : " + HTTPService( service ).destination + ", rootURL : " + HTTPService( service ).rootURL + ", url : " + HTTPService( service ).url + ")." );
				}
				_service = service;
			}
		}
		
		/**
		 * Links a responder to a service call.
		 */
		protected function linkResponderToCallToken( token : AsyncToken, responder : IBusinessResponder ) : void
		{
			logger.debug( "Linking responder (" + ClassUtils.getStandardFullyQualifiedClassName( responder ) + ") to async token with timestamp : " + token.message.timestamp );
			token.addResponder( responder );
		}
	}
}