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
	
	public function new(x:Int, y:Int) 
	{
		super();
		
		//create ship
		var squidIcon = new Bitmap(Assets.getBitmapData("img/squidIcon.png"));
		sprite = new Sprite();
		sprite.addChild(squidIcon);
		sprite.x = -squidIcon.width / 2;
		sprite.y = -squidIcon.height / 2;
		this.addChild(sprite);
		
		//put ship on screen
		this.x = x;
		this.y = y;
	}
	
	public function act() 
	{
		
	}
	
}