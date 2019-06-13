package com.arc.utils
{
	import flash.utils.getDefinitionByName;
	
	public class ClassUtils
	{
		/**
		 * Use to get length of Object or Dictionary, etc
		 */
		public static function getLength(o:*):uint
		{
			var len:uint = 0;
			for (var item:* in o)
				if (item != "mx_internal_uid")
					len++;
			return len;
		}
		
		public static function objectToString(o:*):String
		{
			var s:String = "\n";
			for(var val:* in o)
			{
				s += '[' + typeof(o[val]) + '] ' + val + ' = ' + o[val] + "\n";
			}
			return s;
		}
		
		public static function createInstance(className:String):Object
		{
			var myClass:Class = getDefinitionByName(className) as Class;
			var instance:Object = new myClass();
			return instance;
		}
	}
}