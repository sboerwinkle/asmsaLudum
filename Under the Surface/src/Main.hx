package ;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.Lib;

/**
 * ...
 * @author Tara Moses
 * @author Simon Boerwinkle
 * @author Russell Bryan
 */

class Main extends Sprite 
{
	var inited:Bool;
	static var myShip:Ship;

	/* ENTRY POINT */
	
	function resize(e) 
	{
		if (!inited) init();
		// else (resize or orientation change)
	}
	
	function init() 
	{
		if (inited) return;
		inited = true;
		myShip = new Ship();
		stage.addChild(myShip);
		stage.addChild(new Squid());

		// (your code here)
		stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
		
		// Stage:
		// stage.stageWidth x stage.stageHeight @ stage.dpiScale
		
		// Assets:
		// nme.Assets.getBitmapData("img/assetname.jpg");
	}

	/* SETUP */

	public function new() 
	{
		super();	
		addEventListener(Event.ADDED_TO_STAGE, added);
	}

	function added(e) 
	{
		removeEventListener(Event.ADDED_TO_STAGE, added);
		stage.addEventListener(Event.RESIZE, resize);
		init();
	}
	
	public static function main() 
	{
		// static entry point
		Lib.current.stage.align = flash.display.StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = flash.display.StageScaleMode.NO_SCALE;
		Lib.current.addChild(new Main());
	}
	
	public function keyDown(e:KeyboardEvent) {
		trace(e.keyCode);
	}
}
