package hungrypuppy.gameplay.objects;

import flixel.FlxSprite;
import hungrypuppy.utilities.CoolUtil;

class Cerber extends FlxSprite
{
	public var waitDur = 3;
	public var health = 100;

	public function new()
	{
		super();
		loadGraphic("assets/images/cerber.png");
		screenCenter();
	}

	public function begin()
	{
		CoolUtil.delayCallback(waitDur, () ->
		{
			health -= 10;
		});
	}
}