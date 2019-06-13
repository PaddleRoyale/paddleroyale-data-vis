package com.arc.paddleRoyale.controller.commands
{
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.Timer;

	public class TextSwap
	{
		private var _limit:int;
		private	var _newString:String;
		private	var _originalText:String;
		private var _processString:String;
		private	var _tf:TextFormat;
		private	var _txt:TextField;
		private var _timer:Timer;
		
		public function TextSwap($txt:TextField, $newString:String, $speed:int = 50)
		{
			// Assign vars
			_newString			= $newString;
			_originalText 		= $txt.text;
			_tf					= $txt.getTextFormat();
			_txt				= $txt;
			
			// Find limit
			_limit 				= $newString.length > _originalText.length ? $newString.length : _originalText.length ;
			
			// Create and start timer
			_timer 				= new Timer($speed, _limit);
			_timer.addEventListener(TimerEvent.TIMER, onTimerEvent);
			_timer.start();
			onTimerEvent(null);
		}

		private function onTimerEvent(event:TimerEvent):void
		{
			_txt.text			= _newString.substr(0, _timer.currentCount).concat(_originalText.substr(_timer.currentCount, _limit));
			_txt.setTextFormat(_tf);
		}
		
		public function kill():void
		{
			_timer.stop();
			_timer = null;
		}
	}
}