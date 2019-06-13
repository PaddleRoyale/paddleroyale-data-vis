package com.arc.paddleRoyale.model
{
	import com.arc.paddleRoyale.vo.Player;
	
	import flash.events.Event;
	
	public class PlayerEvent extends Event
	{
		public static const DEFAULT_NAME:String = "com.arc.paddleRoyale.model.PlayerEvent";
		
		// Event types
		public static const KNOCKED_OUT:String 	= "knockedOut";
		public static const UPDATE:String 		= 'update';
		
		// Vars
		public var player:Player;
		
		public function PlayerEvent($type:String, $player:Player, $bubbles:Boolean=false, $cancelable:Boolean=false)
		{
			super($type, $bubbles, $cancelable);
			player = $player;
		}
		
		
		
/*--------------------------------------------------------------------------------------------------------
		Helpers
--------------------------------------------------------------------------------------------------------*/
		public override function toString():String
		{
			return formatToString("PlayerEvent", "player", "type", "bubbles", "cancelable");
		}
	}
}