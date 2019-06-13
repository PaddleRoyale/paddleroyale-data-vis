package com.arc.paddleRoyale.vo
{
	import com.arc.utils.ClassUtils;
	import com.carlcalderon.arthropod.Debug;

	public class FlashVars
	{
		public static const DEFAULT_NAME:String = "com.arc.paddleRoyale.vo.FlashVars";

		private static var _vars:Object;
		public static function get vars():Object
		{
			return _vars;
		}
		
		public static function declare(o:Object):void
		{
			Debug.log(DEFAULT_NAME.concat(" set vars: ", ClassUtils.objectToString(o)));
			_vars = o;
		}
	}
}