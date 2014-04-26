package;
import flash.display.Sprite;
import openfl.Assets;
import flash.display.Bitmap;

/**
 * ...
 * @author ...
 */
class Squid extends Sprite 
{
	var sprite:Sprite;
	var vx:Float;
	var vy:Float;
	var frameCount:Float;
	
	public function new(x:Int, y:Int) 
	{
		super();
		
		//create squid
		var squidIcon = new Bitmap(Assets.getBitmapData("img/squidIcon.png"));
		sprite = new Sprite();
		sprite.addChild(squidIcon);
		sprite.x = -squidIcon.width / 2;
		sprite.y = -squidIcon.height / 2;
		this.addChild(sprite);
		
		//put squid on screen
		this.x = x;
		this.y = y;
		
		vx = vy = frameCount = 0;
	}
	
	public function act() 
	{
		vx *= 0.99;
		vy *= 0.99;
		var dx = Main.that.ship.x - x;
		var dy = Main.that.ship.y - y;
		if (frameCount-- < 0) {
			frameCount = Math.random() * 50 + 100;
			if (dx != 0 || dy != 0){
				var dist = Math.sqrt(dx * dx + dy * dy);
				vx += dx * 3 / dist;
				vy += dy * 3 / dist;
			}
		}
		x += vx;
		y += vy;
		rotation = (180.0/Math.PI)*Math.atan2(dx, -dy);
	}
	
}