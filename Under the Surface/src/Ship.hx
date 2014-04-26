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
	public function new() 
	{
		sprite = new Sprite();
		sprite.rotation = 90;
		super();
	}
	
}