/*
 * Servebox ActionScript Commons / $Id: ChannelSetProvider.as 55 2007-03-23 17:08:09Z J.F.Mathiot $
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
	import mx.core.FlexGlobals;
	import mx.messaging.Channel;
	import mx.messaging.ChannelSet;
	import mx.messaging.channels.AMFChannel;
	import mx.messaging.channels.SecureAMFChannel;
	
	import org.as3commons.lang.StringUtils;

	/**
	 * This class provides the application-level default AMF(Remoting) channel used for remote procedure calls.<br>
	 * The URI used as the message broker one is http://{host}:{port}/{context-root}/messagebroker/amf
	 */
	public class ChannelSetProvider
	{
		private var _channel:Channel;
		private var _cs:ChannelSet;
		
		/**
		 * Gets the full application URI.
		 */
		public function getHostURI( appUrl : String = null) : String
		{
			if( appUrl == null )
				appUrl = FlexGlobals.topLevelApplication.url;
			return URLUtils.getHostURL( appUrl );
		}
		
        /**
         * Gets the application context URI.
         */
		public function getApplicationContextURI() : String
		{
			var appUrl:String = FlexGlobals.topLevelApplication.url;
			var hostURI:String = getHostURI();
			var hostEndPos:int = appUrl.indexOf("/", appUrl.indexOf( hostURI ) + hostURI.length);
			var toReturn:String = hostURI + "/" + appUrl.substring( hostEndPos + 1, appUrl.indexOf("/", hostEndPos + 1 ));
			return toReturn;
		}
		
		/**
		 * Returns the default channel.
		 */
		public function getDefaultChannel() : Channel
		{
			if( _channel == null )
			{
				var uri : String = getAMFBrokerURI();
				if( StringUtils.startsWith( uri, "https://" ) )
				{
					_channel = new SecureAMFChannel("my-ssl-amf", uri );
				}
				else
				{
					_channel = new AMFChannel("my-amf", uri );
				}
			}
			return _channel;
		}
		
		/**
		 * Returns the AMF borker URI.
		 */
		public function getAMFBrokerURI() : String
		{
			return getApplicationContextURI()+"/messagebroker/amf";
		}
		
		/**
		 * Returns the default channel set.
		 */
		public function getDefaultChannelSet() : ChannelSet
		{
			if( _cs == null ){
				_cs= new ChannelSet();
				_cs.addChannel( getDefaultChannel() );
			}
			return _cs;
		}
        
		// SINGLETON IMPLEMENTATION
		private static var allowInstantiation:Boolean;
		private static var instance : ChannelSetProvider;
        
        /**
         * Retruns the ChannelSetProvider instance.
         */
		public static function getInstance() : ChannelSetProvider
		{
			if (instance == null)
			{
			    allowInstantiation = true;
	            instance = new ChannelSetProvider();
	            allowInstantiation = false;
	  		}
			return instance;
		}
        
        /**
         * Creates a new ChannelSetProvider.
         */
		public function ChannelSetProvider()
		{
        	if (!allowInstantiation)
        	{
            	throw new Error("Object cannot be instantiated with the new directive. Use Class.getInstance() instead.");
          	}
        }
	}}