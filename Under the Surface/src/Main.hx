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
	
	public static var that:Main;
	
	//sprites
	var ship:Ship;
	var squid:Squid;
	
	public var keyLeft:Bool;
	public var keyRight:Bool;

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

		// (your code here)
		that = this;
		stage.addEventListener(Event.ENTER_FRAME, tick);
		stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
		stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
		
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
		
		ship = new Ship(100, 300);
		this.addChild(ship);
		
		squid = new Squid(400, 100);
		this.addChild(squid);
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
	
	public function tick(e:Event) {
		ship.act(0, .03);
	}
	
	public function keyDown(e:KeyboardEvent) {
		keyHandle(e.keyCode, true);
	}
	
	public function keyUp(e:KeyboardEvent) {
		keyHandle(e.keyCode, false);
	}
	
	function keyHandle(code:Int, pressed:Bool) {
		if (code == 37) keyLeft = pressed;
		if (code == 39) keyRight = pressed;
	}
}
