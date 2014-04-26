package;
import flash.display.Sprite;

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
	public function new() 
	{
		sprite = new Sprite();
		sprite.rotation = 90;
		super();
	}
	public function act(windAngle:Float, windSpeed:Float):Void {
		var force = windSpeed * Math.cos(sprite.rotation + sailAngle-windAngle);
		speed += force * Math.cos(sailAngle);
		x += speed * Main.cos(sprite.rotation);
		y += speed * Main.sin(sprite.rotation);
	}
}