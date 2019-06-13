﻿package com.arc.paddleRoyale.view.cluster{	import com.arc.paddleRoyale.model.PlayerEvent;	import com.arc.paddleRoyale.vo.Agency;	import com.arc.paddleRoyale.vo.Colors;	import com.arc.paddleRoyale.vo.Constants;	import com.arc.paddleRoyale.vo.Player;	import com.arc.utils.DisplayUtils;	import com.greensock.TweenMax;		import fl.motion.Color;		import flash.display.GradientType;	import flash.display.InterpolationMethod;	import flash.display.SpreadMethod;	import flash.display.Sprite;	import flash.events.Event;	import flash.geom.Matrix;	import flash.text.TextField;	import flash.text.TextFieldAutoSize;	import flash.text.TextFormat;
		public class ClusterPlayerView extends Sprite	{		public static const DEFAULT_NAME:String = "com.arc.paddleRoyale.view.cluster.ClusterPlayerView";/*--------------------------------------------------------------------------------------------------------		Vars--------------------------------------------------------------------------------------------------------*/		// Text field		private var _tf:TextFormat;		public var txt:TextField;		public var barContainer:Sprite 	= new Sprite;		// bar		private var barWidth			= 150;		private var barHeight			= 20;										/*--------------------------------------------------------------------------------------------------------		Constructor--------------------------------------------------------------------------------------------------------*/		public function ClusterPlayerView()		{			super();			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);		}						/*--------------------------------------------------------------------------------------------------------		Event Listeners--------------------------------------------------------------------------------------------------------*/		private function onAddedToStage(event:Event):void		{			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);			//_tf				= txt.getTextFormat();			alpha			= 0;			scaleX			=			scaleY			= .25;		}				private function onPlayerEvent($e:PlayerEvent):void		{			switch($e.type)			{				case PlayerEvent.KNOCKED_OUT:					checkIfKnockedOut();					break;								default: break;			}		}										/*--------------------------------------------------------------------------------------------------------		Function(s)--------------------------------------------------------------------------------------------------------*/		private function drawBox():void		{			var matrix:Matrix		= new Matrix();			var type:String 		= GradientType.LINEAR;			var spread:String 		= SpreadMethod.PAD;			var interpolation:String = InterpolationMethod.LINEAR_RGB;			var alphas:Array 		= [ 1.0, 1.0 ];			var ratios:Array 		= [ 0, 255 ];			var b:Sprite			= new Sprite();						matrix.createGradientBox(barWidth, barHeight, 0, 0, 0);						//b.graphics.lineStyle(1,0x000000);						b.graphics.beginGradientFill(				type,				Colors.gradientCollection[player.agencyIndex],				alphas,				ratios,				matrix,				spread,				interpolation			);						b.graphics.drawRect( 0.0, -10, barWidth, barHeight );			b.graphics.endFill();						//DisplayUtils.removeChildren(barContainer);			//barContainer.addChild(b);			addChild(b);						// Bring text above new box			DisplayUtils.bringToTop(txt);		}				private function checkIfKnockedOut():void		{			if(player.knockedOut)			{				TweenMax.to(this, .5, {colorTransform: Constants.KNOCKED_OUT_COLOR_TRANSFORM});			}		}						/*--------------------------------------------------------------------------------------------------------		GETTER/SETTER--------------------------------------------------------------------------------------------------------*/		private var _player:Player;		public function get player():Player { return _player; }		public function set player($player:Player):void		{			_player			= $player;			text			= player.name;			player.addEventListener(PlayerEvent.KNOCKED_OUT, onPlayerEvent);			player.addEventListener(PlayerEvent.UPDATE, onPlayerEvent)			checkIfKnockedOut();			drawBox();		}				public function get text():String { return txt.text; }		public function set text($text:String):void		{			//txt.autoSize	= TextFieldAutoSize.LEFT;			txt.text		= $text;			//txt.setTextFormat(_tf);						// Some agencies need black text for the player names.			// If that is the case, then switch to black, and get rid of filters (drop shadow).			switch(player.agencyIndex)			{				case 0:				case 2:				case 5:				case 8:				case 14:					var c:Color = new Color();					c.setTint(0x000000, 1);					txt.transform.colorTransform 	= c;					break;								default: break;			}		}	}}