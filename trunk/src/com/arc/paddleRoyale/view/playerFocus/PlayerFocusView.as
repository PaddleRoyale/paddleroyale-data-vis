package com.arc.paddleRoyale.view.playerFocus
{
	import com.arc.paddleRoyale.controller.App;
	import com.arc.paddleRoyale.controller.commands.TextSwap;
	import com.arc.paddleRoyale.vo.Colors;
	import com.arc.paddleRoyale.vo.Constants;
	import com.arc.paddleRoyale.vo.Player;
	import com.carlcalderon.arthropod.Debug;
	import com.greensock.TweenMax;
	
	import flash.display.GradientType;
	import flash.display.SpreadMethod;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.geom.Matrix;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.Timer;
	
	public class PlayerFocusView extends Sprite
	{
		public static const DEFAULT_NAME:String		= "com.arc.paddleRoyale.view.playerFocus.PlayerFocusView";
		
		
		
		
/*--------------------------------------------------------------------------------------------------------
		Vars
--------------------------------------------------------------------------------------------------------*/
		private var _agency_tf:TextFormat;
		public	var agency_txt:TextField;
		public 	var box:Sprite;
		private var _boxHeight:int						= 32;
		private var _boxWidth:int						= 274;
		private var _boxX:int							= 10;
		private var _boxY:int							= 57;
		public	var colors:Object 						= {left:0x000000, right:0x000000};
		private var _focusTimer:Number					= 4; // In seconds
		private var _name_tf:TextFormat;
		public	var name_txt:TextField;
		public	var updateTime:Number					= 1;
		// Timer/Counter
		private var _textAgencySwap:TextSwap;
		private var _textPlayerSwap:TextSwap;
		private var _timer:Timer;
		private var _timerCount:int						= 0;
		
		
		
		
/*--------------------------------------------------------------------------------------------------------
		Get/Set
--------------------------------------------------------------------------------------------------------*/
		private	var _player:Player;
		public function get player():Player { return _player; }
		public function set player($value:Player):void
		{
			//Debug.log(Constants.TIME.concat(DEFAULT_NAME, ".set player($value:Player)"));
			//Debug.log($value.toString());
			
			_player = $value;
			
			if(_textAgencySwap != null)
			{
				_textAgencySwap.kill();
				_textAgencySwap							= null;
			}
			_textAgencySwap								= new TextSwap(agency_txt, player.agency.name);

			if(_textPlayerSwap != null)
			{
				_textPlayerSwap.kill();
				_textPlayerSwap							= null;
			}
			_textPlayerSwap								= new TextSwap(name_txt, player.name);
			
			update();
		}
		
		
		
/*--------------------------------------------------------------------------------------------------------
		Constructor
--------------------------------------------------------------------------------------------------------*/
		public function PlayerFocusView()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		
		
/*--------------------------------------------------------------------------------------------------------
		Event Listeners
--------------------------------------------------------------------------------------------------------*/
		private function onAddedToStage(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			_agency_tf								= agency_txt.getTextFormat();
			_name_tf								= name_txt.getTextFormat();
			
			// Create box
			box										= new Sprite();
			box.x									= _boxX;
			box.y									= _boxY;
			addChild(box);
			
			// Setup timer
			resetTimer();
		}
		
		private function onTimer(event:TimerEvent):void
		{
			//Debug.log(Constants.TIME.concat(" ", DEFAULT_NAME, ".onTimer(event:TimerEvent)"));
			//Debug.log("_timerCount: ".concat(_timerCount));
			
			if(_timerCount >= App.instance.playerCount)
			{
				resetTimer();
			}
			else
			{
				var potentialPlayer:Player				= App.instance.playersSortedByName[_timerCount];
				_timerCount++;
				
				//Debug.log("potentialPlayer.knockedOut: ".concat(potentialPlayer.knockedOut));
				
				if(potentialPlayer.knockedOut)
				{
					// Skip to next
					onTimer(null);
				}
				else
				{
					player								= potentialPlayer;
				}
			}
		}
		
		private function onTimerComplete(event:TimerEvent):void
		{
			//Debug.log(Constants.TIME.concat(" ", DEFAULT_NAME, ".onTimerComplete(event:TimerEvent)"));
			resetTimer();
		}
		
		
		
/*--------------------------------------------------------------------------------------------------------
		Functions
--------------------------------------------------------------------------------------------------------*/
		private function resetTimer():void
		{
			//Debug.log(Constants.TIME.concat(" ", DEFAULT_NAME, ".resetTimer()"));
			
			// Clean up current timer
			if(_timer != null)
			{
				_timer.removeEventListener(TimerEvent.TIMER, onTimer);
				_timer.removeEventListener(TimerEvent.TIMER_COMPLETE, onTimerComplete);
				_timer.stop();
				_timer								= null;
			}
			
			// Don't even try if there's just one player
			if( App.instance.playerCountStillIn <= 1 )
			{
				
				return;
			}
			
			// Create new timer
			_timerCount								= 0;
			_timer									= new Timer(_focusTimer * 1000, App.instance.playerCount);
			_timer.addEventListener(TimerEvent.TIMER, onTimer);
			_timer.addEventListener(TimerEvent.TIMER_COMPLETE, onTimerComplete);
			_timer.start();
			onTimer(null);
		}
		
		private function update():void
		{
			// Animation time
			var t:Number							= .5;
			var l:Number							= Colors.gradientCollection[player.agencyIndex][0];
			var r:Number							= Colors.gradientCollection[player.agencyIndex][1];
			
			TweenMax.to(
				colors, 
				updateTime,
				{
					hexColors: {left: l, right: r}, 
					onUpdate: drawGradient
				}
			);
			
			// Update bar
			var a:Constants
			var s:Number							= Constants.MIN_BAR_SCALE + ((1 - Constants.MIN_BAR_SCALE) * (player.score / App.instance.maxScore));
			TweenMax.to(box, updateTime, {scaleX: s});
			
			// Text
			TweenMax.to(agency_txt, updateTime, {tint: Colors.collection[player.agencyIndex]});
			TweenMax.to(name_txt, updateTime, {tint: Colors.collection[player.agencyIndex]});
		}
		
		public function drawGradient():void
		{
			box.graphics.clear();
			var m:Matrix 							= new Matrix();
			m.createGradientBox(_boxWidth, _boxHeight, 0, 0, 0);
			box.graphics.beginGradientFill(
				GradientType.LINEAR,
				[colors.left, colors.right], 
				[1, 1], 
				[0x00, 0xFF], 
				m, 
				SpreadMethod.PAD
			);
			box.graphics.drawRect(0,0,_boxWidth,_boxHeight);
		}
		
		
		
/*--------------------------------------------------------------------------------------------------------
		Timer
--------------------------------------------------------------------------------------------------------*/
	}
}