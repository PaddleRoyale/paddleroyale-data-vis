package com.arc.paddleRoyale.view
{
	public interface IView
	{
		function get focus():Boolean;
		function set focus($value:Boolean):void;
		
		function update():void;
	}
}