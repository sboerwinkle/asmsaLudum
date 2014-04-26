package;
import flash.display.Sprite;
import openfl.Assets;
import flash.display.Bitmap;

/**
 * ...
 * @author ...
 */
class Ship extends Sprite
{
	var sprite:Sprite;
	var tmpCanvas:Sprite;
	var sailAngle:Float;
	var rudderAngle:Float;
	var speed:Float;
	var realRotation:Float;
	var sailSize:Float;
	public function new(x:Int, y:Int) 
	{
		super();
		
		//create ship
		var shipIcon = new Bitmap(Assets.getBitmapData("img/shipIcon.png"));
		sprite = new Sprite();
		sprite.addChild(shipIcon);
		sprite.x = -shipIcon.width / 2;
		sprite.y = -shipIcon.height / 2;
		this.addChild(sprite);
		
		tmpCanvas = new Sprite();
		addChild(tmpCanvas);
		
		//put ship on screen
		this.x = x;
		this.y = y;
		sailAngle = 0;
		rudderAngle = .04;
		speed = 0;
		realRotation = 0;
		sailSize = 1;
	}
	public function act(windAngle:Float, windSpeed:Float):Void
	{
		rudderAngle = 0;
		if (Main.that.keyLeft) rudderAngle -= 0.01;
		if (Main.that.keyRight) rudderAngle += 0.01;
		if (Main.that.keySailLeft) sailAngle += 0.04;
		if (Main.that.keySailRight) sailAngle -= 0.04;
		if (Main.that.keySailMinus) sailSize -= 0.04;
		if (Main.that.keySailPlus) sailSize += 0.04;
		if (sailSize < .1) sailSize = .1;
		if (sailSize > 1) sailSize = 1;
		var force:Float = sailSize * windSpeed * Math.cos(realRotation+sailAngle - windAngle);
		speed += force * Math.cos(sailAngle);
		x += speed * Math.cos(realRotation);
		y += speed * Math.sin(realRotation);
		//trace(speed);
		speed *= 0.995;
		tmpCanvas.graphics.clear();
		tmpCanvas.graphics.lineStyle(2, 0xFF, 1);
		tmpCanvas.graphics.moveTo( -Math.sin(sailAngle) * sailSize * 50, Math.cos(sailAngle) * sailSize * 50);
		tmpCanvas.graphics.lineTo( Math.sin(sailAngle) * sailSize * 50, -Math.cos(sailAngle) * sailSize * 50);
		
		realRotation += (speed) * rudderAngle;
		
		if (realRotation > 2 * Math.PI) realRotation -= 2 * Math.PI;
		if (realRotation < -2 * Math.PI) realRotation += 2 * Math.PI;
		if (sailAngle > 2 * Math.PI) sailAngle -= 2 * Math.PI;
		if (sailAngle < -2 * Math.PI) sailAngle += 2 * Math.PI;
		rotation = (180.0 / Math.PI) * realRotation;
	}
}