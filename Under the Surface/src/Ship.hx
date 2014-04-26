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
		super();
		sprite = new Sprite();
		sprite.rotation = 90;
		graphics.beginFill(0xFF8000);
		graphics.drawRect( 200, 200, 20, 20);
	}
	public function act(windAngle:Float, windSpeed:Float):Void {
		var force = windSpeed * Math.cos(sprite.rotation+sailAngle - windAngle);
		speed += force * Math.cos(sailAngle);
		x += speed * Math.cos(sprite.rotation);
		y += speed * Math.sin(sprite.rotation);
		
		sprite.rotation += (speed+3) * 0.1 * rudderAngle;
	}
}