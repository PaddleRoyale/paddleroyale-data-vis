package com.arc.paddleRoyale.view.cluster
{
	import com.arc.paddleRoyale.controller.App;
	import com.arc.paddleRoyale.model.AppEvent;
	import com.arc.utils.MathUtils;
	import com.carlcalderon.arthropod.Debug;
	
	import flash.events.Event;
	
	import shapes.Circle;
	
	public class ClusterStaffItem extends Circle
	{
		public static const DEFAULT_NAME:String = "com.arc.paddleRoyale.view.cluster.ClusterStaffItem";
		
/*--------------------------------------------------------------------------------------------------------
		Constructor
--------------------------------------------------------------------------------------------------------*/
		public function ClusterStaffItem()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			App.instance.addEventListener(AppEvent.LOAD_COMPLETE, onAppComplete);
		}
		
		
		
/*--------------------------------------------------------------------------------------------------------
		Functions
--------------------------------------------------------------------------------------------------------*/
		private function redraw():void
		{
			// Needed to make sure the physics world gets updated
			this.destroy();	
			this.create();
			this.circle();
		}
		
		
		
/*--------------------------------------------------------------------------------------------------------
		Event Listeners
--------------------------------------------------------------------------------------------------------*/
		private function onAddedToStage(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			updateFrame();
		}
		
		private function onAppComplete(event:AppEvent):void
		{
			App.instance.removeEventListener(AppEvent.LOAD_COMPLETE, onAppComplete);
		}
		
		
		
/*--------------------------------------------------------------------------------------------------------
		Functions
--------------------------------------------------------------------------------------------------------*/
		private function updateFrame():void
		{
			// Go to the right frame label depending on the name "leo_xxx" or "killerspin_xxx"
			var sp:Array			= name.split('_');
			try
			{
				gotoAndStop(sp[0]);
			}
			catch(e:Error)
			{
				// couldn't find frame label
			}
		}
		
		private function varyScale():void
		{
			// Change scale
			var min:int				= 7;
			var max:int				= 10;
			scaleX					= 
			scaleY					= MathUtils.randomNumber(min, max) * .1;
			redraw();
		}
		
		
		
/*--------------------------------------------------------------------------------------------------------
		GETTER/SETTER
--------------------------------------------------------------------------------------------------------*/
		override public function get scaleX():Number { return super.scaleX; }
		override public function set scaleX($scaleX:Number):void
		{
			super.scaleX 			= $scaleX;
			redraw();
		}
		
		override public function get scaleY():Number { return super.scaleY; }
		override public function set scaleY($scaleY:Number):void
		{
			super.scaleY 			= $scaleY;
			redraw();
		}
	}
}