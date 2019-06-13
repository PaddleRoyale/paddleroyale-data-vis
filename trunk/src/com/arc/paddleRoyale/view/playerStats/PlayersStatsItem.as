package com.arc.paddleRoyale.view.playerStats
{
	import com.arc.paddleRoyale.controller.App;
	import com.arc.paddleRoyale.model.AppEvent;
	import com.arc.paddleRoyale.model.EventCenter;
	import com.arc.paddleRoyale.model.PlayerEvent;
	import com.arc.paddleRoyale.vo.Agency;
	import com.arc.paddleRoyale.vo.Colors;
	import com.arc.paddleRoyale.vo.Constants;
	import com.arc.paddleRoyale.vo.Player;
	import com.arc.utils.DisplayUtils;
	import com.carlcalderon.arthropod.Debug;
	import com.greensock.TweenMax;
	
	import fl.motion.Color;
	
	import flash.display.GradientType;
	import flash.display.InterpolationMethod;
	import flash.display.MovieClip;
	import flash.display.SpreadMethod;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Matrix;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	public class PlayersStatsItem extends Sprite
	{
		public static const DEFAULT_NAME:String = "com.arc.paddleRoyale.view.playerStats.PlayersStatsItem";
/*--------------------------------------------------------------------------------------------------------
		Vars
--------------------------------------------------------------------------------------------------------*/
		private var _tf:TextFormat;
		public 	var txt:TextField;
		public	var bar:Sprite				= new Sprite();
		public 	var barContainer:Sprite 	= new Sprite();
		public	var barXFocus:int			= 0;
		public	var barYFocus:int			= 20;
		public	var barX:int;
		public	var barY:int;
		private var barWidth				= 165;
		private var barHeight				= 14;
		public	var box:MovieClip;
		
		
/*--------------------------------------------------------------------------------------------------------
		Constructors
--------------------------------------------------------------------------------------------------------*/
		public function PlayersStatsItem()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			App.instance.addEventListener(AppEvent.LOAD_COMPLETE, onAppComplete);
		}
		
		
		
/*--------------------------------------------------------------------------------------------------------
		Event Listeners
--------------------------------------------------------------------------------------------------------*/
		private function onAddedToStage(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			_tf				= txt.getTextFormat();
			barX			= barContainer.x;
			barY			= barContainer.y;
			drawBox();
		}
		
		private function onAppComplete(event:AppEvent):void
		{
			update();
		}
		
		private function onPlayerEvent($e:PlayerEvent):void
		{
			switch($e.type)
			{
				case PlayerEvent.KNOCKED_OUT:
					checkIfKnockedOut();
					break;
				
				default: break;
			}
		}
		
		
		
		
		
/*--------------------------------------------------------------------------------------------------------
		Function(s)
--------------------------------------------------------------------------------------------------------*/
		private function drawBox():void
		{
			//Debug.log(DEFAULT_NAME.concat('drawBox()'));
			
			var matrix:Matrix			= new Matrix();
			var type:String 			= GradientType.LINEAR;
			var spread:String 			= SpreadMethod.PAD;
			var interpolation:String 	= InterpolationMethod.LINEAR_RGB;
			var alphas:Array 			= [ 1.0, 1.0 ];
			var ratios:Array 			= [ 0, 255 ];
			
			matrix.createGradientBox(barWidth, barHeight, 0, 0, 0);
			
			//b.graphics.lineStyle(1,0x000000);
			
			bar.graphics.beginGradientFill(
				type,
				Colors.gradientCollection[player.agencyIndex],
				alphas,
				ratios,
				matrix,
				spread,
				interpolation
			);
			
			bar.graphics.drawRect( 0, 0, barWidth, barHeight );
			bar.graphics.endFill();
			bar.name						= "bar";
			
			//DisplayUtils.removeChildren(barContainer);
			
			barContainer.addChild(bar);
			
			update(true);
		}
		
		private function update($force:Boolean = false):void
		{
			var s:Number				= Constants.MIN_BAR_SCALE + ((1 - Constants.MIN_BAR_SCALE) * (player.score / App.instance.maxScore));
			if($force)
			{
				bar.scaleX				= s;
			}
			else
			{
				TweenMax.to(bar, .25, { scaleX: s });
			}
		}
		
		private function checkIfKnockedOut():void
		{
			if(player.knockedOut)
			{
				TweenMax.killTweensOf(this);
				TweenMax.to(this, .25, {autoAlpha: 0, onComplete: kill});
			}
		}
		
		private function kill():void
		{
			App.instance.removeEventListener(AppEvent.LOAD_COMPLETE, onAppComplete);
			DisplayUtils.removeDisplayObject(this);
			EventCenter.dispatchEvent(new AppEvent(AppEvent.PLAYER_STATS_VIEW_REMOVED));
		}
		
		
		
/*--------------------------------------------------------------------------------------------------------
		GETTER/SETTER
--------------------------------------------------------------------------------------------------------*/
		private var _player:Player;
		public function get player():Player { return _player; }
		public function set player($player:Player):void
		{
			_player			= $player;
			text			= player.name;
			player.addEventListener(PlayerEvent.KNOCKED_OUT, onPlayerEvent);
			player.addEventListener(PlayerEvent.UPDATE, onPlayerEvent)
			checkIfKnockedOut();
			drawBox();
			update();
		}
		
		public function get text():String { return txt.text; }
		public function set text($text:String):void
		{
			//txt.autoSize	= TextFieldAutoSize.LEFT;
			txt.text		= $text;
			//txt.setTextFormat(_tf);

			var c:Color 	= new Color();
			c.setTint(Colors.collection[player.agencyIndex], 1);
			txt.transform.colorTransform 	= c;
		}
	}
}