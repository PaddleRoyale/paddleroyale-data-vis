package com.arc.paddleRoyale.controller.commands
{
	import com.arc.paddleRoyale.vo.Constants;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	public class LoadXML extends EventDispatcher
	{
		public static const DEFAULT_NAME:String = "com.arc.paddleRoyale.controller.commands.LoadXML";
		
		private var request:URLRequest;
		private var loader:URLLoader;
		public var data;
		
		public function LoadXML()
		{
			request 	= new URLRequest(Constants.DATA_URL);
			loader 		= new URLLoader();
			loader.addEventListener(Event.COMPLETE, onComplete);
			loader.addEventListener(ProgressEvent.PROGRESS, onProgress);
			loader.addEventListener(IOErrorEvent.IO_ERROR, onIOError);
			loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onSecurityError);
		}
		
		public function load():void
		{
			loader.load(request);
		}

		private function onSecurityError($e:SecurityErrorEvent):void
		{
			dispatchEvent($e.clone());
		}

		private function onIOError($e:IOErrorEvent):void
		{
			dispatchEvent($e.clone());
		}

		private function onProgress($e:ProgressEvent):void
		{
			dispatchEvent($e.clone());
		}

		private function onComplete($e:Event):void
		{
			// Bubble the event up for easy access
			data = $e.target.data;
			dispatchEvent($e);
		}
	}
}