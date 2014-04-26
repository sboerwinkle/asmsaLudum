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
	}
	public function act(windAngle:Float, windSpeed:Float):Void
	{
		var force = windSpeed * Math.cos(sprite.rotation+sailAngle - windAngle);
		speed += force * Math.cos(sailAngle);
		x += speed * Math.cos(sprite.rotation);
		y += speed * Math.sin(sprite.rotation);
		
		sprite.rotation += (speed+3) * 0.1 * rudderAngle;
	}
}