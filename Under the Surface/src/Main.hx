package ;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
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
	public var ship:Ship;
	public var squid:Squid;
	
	public var keyLeft:Bool;
	public var keyRight:Bool;
	public var keySailLeft:Bool;
	public var keySailRight:Bool;
	public var keySailMinus:Bool;
	public var keySailPlus:Bool;
	
	public var mouseClicked:Bool;
	public var myMouseX:Float;
	public var myMouseY:Float;
	
	public var harpuns:List<Harpun>;

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
		
		harpuns = new List<Harpun>();

		// (your code here)
		that = this;
		stage.addEventListener(Event.ENTER_FRAME, tick);
		stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
		stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
		stage.addEventListener(MouseEvent.CLICK, mouseClick);
		scaleX = scaleY = 0.6;
		
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
		squid.act();
		for (harpun in harpuns.iterator()) {
			if (!harpun.act()) {
				harpuns.remove(harpun);
				removeChild(harpun);
			}
		}
		/*var dx = ship.x - 400;
		var dy = ship.y - 240;
		for (i in 0...numChildren) {
			var tmp = getChildAt(i);
			tmp.x -= dx;
			tmp.y -= dy;
		}*/
	}
	
	public function addHarpun(a:Harpun) {
		harpuns.add(a);
		addChild(a);
	}
	
	public function keyDown(e:KeyboardEvent) {
		keyHandle(e.keyCode, true);
	}
	
	public function keyUp(e:KeyboardEvent) {
		keyHandle(e.keyCode, false);
	}
	
	function keyHandle(code:Int, pressed:Bool) {
		if (code == 65) keyLeft = pressed;
		if (code == 68) keyRight = pressed;
		if (code == 69) keySailLeft = pressed;
		if (code == 81) keySailRight = pressed;
		if (code == 83) keySailMinus = pressed;
		if (code == 87) keySailPlus = pressed;
	}
	
	function mouseClick(e:MouseEvent) {
		mouseClicked = true;
		myMouseX = e.stageX;
		myMouseY = e.stageY;
	}
}
