package hungrypuppy.gameplay.objects;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.input.keyboard.FlxKey;
import hungrypuppy.utilities.CoolUtil;

class MinawanPlayer extends FlxSprite
{
	var leftMovementBind:FlxKey;
	var rightMovementBind:FlxKey;
	var grabBind:FlxKey;
	var feedBind:FlxKey;

	public var movementEnabled = true;

	private var groundLvl:Float = 0;

	public function new(leftBind:FlxKey, rightBind:FlxKey, grab:FlxKey, feed:FlxKey, ?groundLevel:Float = 0)
	{
		super();
		loadGraphic("assets/images/minawan.png");
		x = 0;
		scale.set(3, 3);
		antialiasing = true;
		leftMovementBind = leftBind;
		rightMovementBind = rightBind;
		grabBind = grab;
		feedBind = feed;
		setGroundLevel(groundLevel);
	}

	public function setGroundLevel(newY:Float)
	{
		groundLvl = newY;
		y = groundLvl;
	}

	public function tick()
	{
		if (y < groundLvl)
		{
			y += 10;
		}

		if (movementEnabled)
		{
			if (CoolUtil.isKey(leftMovementBind, PRESSED))
			{
				flipX = false;
				x -= 10;
			}

			if (CoolUtil.isKey(rightMovementBind, PRESSED))
			{
				flipX = true;
				x += 10;
			}
		}

		// Out of bounds check!
		if (x > FlxG.width)
		{
			x = 0;
		}

		if (x < 0)
		{
			x = FlxG.width - 50;
		}
	}
}