package com.arc.paddleRoyale.view.cluster
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import gravity.GravityRadial;
	
	public class ClusterGravity extends GravityRadial
	{
		private var _controller:Sprite;
		
		
		
/*--------------------------------------------------------------------------------------------------------
		Constructor
--------------------------------------------------------------------------------------------------------*/
		public function ClusterGravity()
		{
			super();
			addEventListener(Event.ENTER_FRAME, onEnterFrameEvent);
		}
		
		
		
/*--------------------------------------------------------------------------------------------------------
		Event listeners
--------------------------------------------------------------------------------------------------------*/
		private function onEnterFrameEvent(event:Event):void
		{
			if(_controller == null) return;
			
			x = _controller.x;
			y = _controller.y;
		}
		
		
		
/*--------------------------------------------------------------------------------------------------------
		Assing a controlling sprite
--------------------------------------------------------------------------------------------------------*/
		public function assignController($sprite:Sprite):void
		{
			_controller = $sprite;
		}
		
		public function releaseController():void
		{
			_controller = null;
		}
	}
}