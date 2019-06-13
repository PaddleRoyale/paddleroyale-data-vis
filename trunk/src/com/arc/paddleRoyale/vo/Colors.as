package com.arc.paddleRoyale.vo
{
	public class Colors
	{
		public static var LIGHT_BLUE:uint 			= 0x4EC8EB;
		public static var BLUE:uint 				= 0x47C5F3;
		public static var DARK_BLUE:uint 			= 0x3B5AA8; // 0x3B5AA8;
		
		public static var BROWN:uint 				= 0xD59F2B;
		
		public static var GREEN:uint 				= 0x85C441;
		public static var DARK_GREEN:uint 			= 0x36B268; // 0x108C44;
		
		public static var ORANGE:uint 				= 0xF6871F;
		
		public static var LIGHT_PINK:uint 			= 0xFBD0D0;
		public static var PINK:uint 				= 0xF06497;
		
		public static var LIGHT_PURPLE:uint 		= 0xCE99C7; // 0xB267A4;
		public static var PURPLE:uint 				= 0xBC79B8; // 0xAA53A0;
		
		public static var LIGHT_RED:uint 			= 0xFBF7BC;
		public static var RED:uint 					= 0xBA1F3E;
		
		public static var YELLOW:uint 				= 0xFFF200;
		
		public static var WHITE:uint 				= 0xFFFFFF;
		
		// Array to be able to run through
		public static var collection:Array			= [
			Colors.WHITE,			// 1
			Colors.LIGHT_BLUE,		// 2
			Colors.LIGHT_PURPLE,	// 3
			Colors.BROWN,			// 4
			Colors.GREEN,			// 5
			Colors.YELLOW,			// 6
			Colors.ORANGE,			// 7
			Colors.PINK,			// 8
			Colors.LIGHT_PINK,		// 9
			Colors.BLUE,			// 10
			Colors.RED,				// 11
			Colors.DARK_BLUE,		// 12
			Colors.DARK_GREEN,		// 13
			Colors.PURPLE,			// 14
			Colors.LIGHT_RED,		// 15
			Colors.LIGHT_BLUE		// 16
		];
		
		// Store gradient values here
		public static var gradientCollection:Array = [
			[0x999999, 0xFFFFFF],	// 1 - WHITE
			//[0x231F20, 0x00ABB7],	// 2 - LIGHT_BLUE - Original
			[0x283993, 0x4EC8EB],	// 2 - LIGHT_BLUE - Option 1 - Anubha
			//[0x252569, 0x00ABB8],	// 2 - LIGHT_BLUE - Option 2 - Anubha
			[0xFBFDFF, 0xB267A4],	// 3 - LIGHT_PURPLE
			[0x813518, 0xD59F2B],	// 4 - BROWN
			[0x1F3C05, 0x85C441],	// 5 - GREEN
			[0x372B0B, 0xFFF200],	// 6 - YELLOW
			[0xED1C24, 0xF6871F],	// 7 - ORANGE
			[0x7B1F5C, 0xF06497],	// 8 - PINK
			[0x79406B, 0xFBD0D0],	// 9 - LIGHT_PINK
			[0x1B3E71, 0x47C5F3],	// 10 - BLUE
			[0x5A0C51, 0xBA1F3E],	// 11 - RED
			[0x4B205F, 0x3B5AA8],	// 12 - DARK_BLUE
			[0x828724, 0x108C44],	// 13 - DARK_GREEN
			[0x45073C, 0xAA53A0],	// 14 - PURPLE
			[0xF9A348, 0xFBF7BC],	// 15 - LIGHT_RED
			[0x283993, 0x4EC8EB]	// 16 - LIGHT_BLUE
		];
	}
}