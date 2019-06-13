package com.arc.paddleRoyale.vo
{
	import com.arc.paddleRoyale.controller.App;
	import com.arc.paddleRoyale.model.PlayerEvent;
	import com.carlcalderon.arthropod.Debug;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;

	public class Player extends EventDispatcher
	{
		public static const DEFAULT_NAME:String = "com.arc.paddleRoyale.vo.Player";
		
		
		
/*--------------------------------------------------------------------------------------------------------
		GET/SET
--------------------------------------------------------------------------------------------------------*/
		public function get agency():Agency { return App.instance.getAgencyByIndex(_agencyIndex); }
		
		private var _agencyIndex:int;
		public function get agencyIndex():int
		{ 
			return _agencyIndex;
		}
		public function set agencyIndex($value:int):void
		{
			_agencyIndex 	= $value;
		}
		
		private var _knockedOut:Boolean = false;
		private var _knockedOutDispatched:Boolean = false;
		public function get knockedOut():Boolean
		{ 
			return _knockedOut;
		}
		public function set knockedOut($value:Boolean):void
		{
			//Debug.log(DEFAULT_NAME.concat(".","set knockedOut(", $value, ") previous value: ", _knockedOut));
			
			// Stop if it's the same value. Or if they're already knocked out
			if($value == knockedOut || (_knockedOut && !$value) ) return;
			
			_knockedOut 	= $value;
			
			// Dispatch an event on change so the view associated with it knows when the player has been knocked out.
			if(knockedOut && !_knockedOutDispatched) 
			{
				dispatchEvent(new PlayerEvent(PlayerEvent.KNOCKED_OUT, this));
				_knockedOutDispatched = true;
			}
		}
		
		private var _id:String = "";
		public function get id():String
		{ 
			return _id; 
		}
		
		private var _index:int = 0;
		public function get index():int
		{ 
			return _index; 
		}
		
		private var _firstName:String = "";
		public function get firstName():String  	
		{
			return _firstName; 
		}
		
		private var _lastName:String = "";
		public function get lastName():String
		{
			return _lastName; 
		}
		
		public function get name():String
		{
			return firstName.concat(" ", lastName); 
		}
		
		private var _score:int = 0;
		public function get score():int
		{
			return _score;
		}
		public function set score($value:int):void
		{
			if($value == score) return;
			_score 			= $value;
			// Dispatch an event on change so the view associated with it knows when the score changes.
			dispatchEvent(new PlayerEvent(PlayerEvent.UPDATE, this));
		}
		
		
/*--------------------------------------------------------------------------------------------------------
		Constructor
--------------------------------------------------------------------------------------------------------*/
		public function Player(
			$id:String, 
			$index:int,
			$firstName:String, 
			$lastName:String,
			$score:int,
			$knockedOut:Boolean,
			$agencyIndex:int)
		{
			_agencyIndex	= $agencyIndex;
			knockedOut		= $knockedOut; // go through setter so event is dispatched
			_id 			= $id;
			_index			= $index;
			_firstName 		= $firstName;
			_lastName 		= $lastName;
			_score 			= $score;
		}
		
		
/*--------------------------------------------------------------------------------------------------------
		Functions
--------------------------------------------------------------------------------------------------------*/
		public function merge($player:Player):void
		{
			//Debug.log(DEFAULT_NAME.concat(".","merge($player:Player)"));
			
			knockedOut		= $player.knockedOut;
			score			= $player.score;
		}
		
		
		
/*--------------------------------------------------------------------------------------------------------
		Helpers
--------------------------------------------------------------------------------------------------------*/
		public override function toString():String
		{
			var str:String 	= "---------------------- Player: Start ----------------------";
			str				= str.concat("\n", "agencyIndex: ", agencyIndex); 
			str				= str.concat("\n", "knockedOut: ", knockedOut); 
			str				= str.concat("\n", "id: ", id); 
			str				= str.concat("\n", "index: ", index); 
			str				= str.concat("\n", "name: ", name);
			str				= str.concat("\n", "firstName: ", firstName);
			str				= str.concat("\n", "lastName: ", lastName);
			str				= str.concat("\n", "score: ", score); 
			str				= str.concat("\n", "---------------------- Player: End ----------------------");
			return str;
		}
	}
}