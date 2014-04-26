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
	var sailAngle:Float;
	var rudderAngle:Float;
	var speed:Float;
	var realRotation:Float;
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
		
		//put ship on screen
		this.x = x;
		this.y = y;
		sailAngle = 0;
		rudderAngle = .04;
		speed = 0;
		realRotation = 0;
	}
	public function act(windAngle:Float, windSpeed:Float):Void {
		rudderAngle = 0;
		if (Main.that.keyLeft) rudderAngle -= 0.04;
		if (Main.that.keyRight) rudderAngle += 0.04;
		var force = windSpeed * Math.cos(realRotation+sailAngle - windAngle);
		speed += force * Math.cos(sailAngle);
		x += speed * Math.cos(realRotation);
		y += speed * Math.sin(realRotation);
		speed *= 0.99;
		
		realRotation += (speed) * 0.1 * rudderAngle;
		rotation = (180.0 / Math.PI) * realRotation;
	}
}