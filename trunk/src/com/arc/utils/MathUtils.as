package com.arc.utils
{
	public class MathUtils
	{
		public static function randomNumber(low:Number = 0, high:Number = 1):Number
		{
			return Math.floor(Math.random() * (1+high-low)) + low;
		}
	}
}