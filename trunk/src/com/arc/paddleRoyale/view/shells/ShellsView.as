package com.arc.paddleRoyale.view.shells
{
	import com.arc.paddleRoyale.controller.App;
	import com.arc.paddleRoyale.model.AppEvent;
	import com.arc.paddleRoyale.view.IView;
	import com.arc.paddleRoyale.vo.Agency;
	import com.carlcalderon.arthropod.Debug;
	import com.greensock.TweenMax;
	import com.reintroducing.layout.Grid;
	
	import flash.display.Sprite;
	
	public class ShellsView extends Sprite implements IView
	{
		public static const DEFAULT_NAME:String = "com.arc.paddleRoyale.view.shells.ShellsView";
		
		
		
/*--------------------------------------------------------------------------------------------------------
		Display Objects
--------------------------------------------------------------------------------------------------------*/
		public var shells:Sprite;
		
		
		
/*--------------------------------------------------------------------------------------------------------
		Vars
--------------------------------------------------------------------------------------------------------*/
		// Holds instances of shells
		private var data:Array			= new Array();
		// Vars for when view is in focus
		private var focusScale:Number	= .7;
		private var focusSpacing:int	= 160;
		public var focusGrid:Array 		= Grid.create(4,4, focusSpacing, focusSpacing, 0, 0);
		// Vars for when view is not in focus
		private var defaultScale:Number	= .7;
		private var defaultSpacingX:int	= 210;
		private var defaultSpacingY:int	= 160;
		public var defaultGrid:Array 	= Grid.create(3,5, defaultSpacingX, defaultSpacingY, 0, 0);
		
		
		
		
		
		
/*--------------------------------------------------------------------------------------------------------
		Getter/Setters
--------------------------------------------------------------------------------------------------------*/
		private var _focus:Boolean = false;
		public function get focus():Boolean
		{
			return _focus;
		}
		public function set focus($value:Boolean):void
		{
			_focus = $value;
			update();
		}
		
		
		
/*--------------------------------------------------------------------------------------------------------
		Constructors
--------------------------------------------------------------------------------------------------------*/
		public function ShellsView()
		{
			super();
			App.instance.addEventListener(AppEvent.LOAD_COMPLETE, onLoadComplete);
		}
		
		
		
/*--------------------------------------------------------------------------------------------------------
		Event listeners
--------------------------------------------------------------------------------------------------------*/
		private function onLoadComplete($e:AppEvent)
		{
			//Debug.log(DEFAULT_NAME.concat(" :: ", "onAppInitComplete($e:AppEvent)"));
			//Debug.log(DEFAULT_NAME.concat(" :: ", "agencyCount: ", App.instance.agencyCount));
			
			if(!App.instance.firstLoad) return;
			
			createAgencies();
		}
		
		
		
		
		
/*--------------------------------------------------------------------------------------------------------
		Update
--------------------------------------------------------------------------------------------------------*/
		public function update():void
		{
			// If you need to change settings when it is in focus or not
			if(focus)
			{
				updatePositions(focusGrid, focusScale, .25);
			}
			else
			{
				updatePositions(defaultGrid, defaultScale, .25);
			}
		}
		
		
		
/*--------------------------------------------------------------------------------------------------------
		Functions
--------------------------------------------------------------------------------------------------------*/
		private function createAgencies():void
		{
			shells							= new Sprite();
			addChild(shells);
			
			// Create shells
			var i:int = 0;
			for each(var a:Agency in App.instance.agencies)
			{
				var shell:AgencyShellView 	= new AgencyShellView();
				shell.assignAgencyID(a.id);
				shell.name					= "agency".concat(a.index);
				data.push(shell);
				shells.addChild(shell);
				i++;
			}
			updatePositions(defaultGrid, defaultScale, 0);
		}
		
		private function updatePositions($grid:Array, $scale:Number = 1, $time:Number = .25):void
		{
			for( var i:int = 0 ; i < data.length ; i++)
			{
				TweenMax.to(data[i], $time, {scaleX: $scale, scaleY: $scale, x: $grid[i].x, y: $grid[i].y});
			}
			
		}
	}
}