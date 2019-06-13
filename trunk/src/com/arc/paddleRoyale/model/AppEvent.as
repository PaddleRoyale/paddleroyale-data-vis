	package com.arc.paddleRoyale.model
{
	import flash.events.Event;
	
	public class AppEvent extends Event
	{
		public static const DEFAULT_NAME:String 				= "com.arc.paddleRoyale.model.AppEvent";
		
		public static const LOAD_START:String 					= "loadStart";
		public static const LOAD_COMPLETE:String 				= "loadComplete";
		public static const PLAYER_STATS_VIEW_REMOVED:String	= "playerStatsViewRemoved";

		// Vars
		public var params:Object;
		
		public function AppEvent($type:String, $params:Object = null, $bubbles:Boolean = false, $cancelable:Boolean = false)
		{
			super($type, $bubbles, $cancelable);
			if($params != null) params = $params;
		}
		
		
		
/*--------------------------------------------------------------------------------------------------------
		Helpers
--------------------------------------------------------------------------------------------------------*/
		public override function clone():Event
		{
			return new AppEvent(type, this.params, bubbles, cancelable);
		}
		
		public override function toString():String
		{
			return formatToString("AppEvent", "params", "type", "bubbles", "cancelable");
		}

	}
}