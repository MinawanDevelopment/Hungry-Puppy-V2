package hungrypuppy.gameplay;

import flixel.FlxG;
import flixel.util.FlxColor;
import hungrypuppy.gameplay.objects.Cerber;
import hungrypuppy.gameplay.objects.MinawanPlayer;
import hungrypuppy.ui.uistuff.MenuBackground;

class HungryPuppy extends CerberState
{
	// Scoring System
	public var score = 0;

	// Graphic
	var bg:MenuBackground;

	// Player Shi
	public var player:MinawanPlayer;
	public var cerber:Cerber;

	override public function create()
	{
		bg = new MenuBackground();
		bg.makeGraphic(FlxG.width, FlxG.height, FlxColor.WHITE);
		bg.alpha = 0.6;
		add(bg);

		cerber = new Cerber();
		cerber.y = FlxG.height - 500;
		add(cerber);
		cerber.begin();

		player = new MinawanPlayer(LEFT, RIGHT, E, SPACE);
		player.setGroundLevel(FlxG.height - 50);
		add(player);

		super.create();
	}

	override public function update(elapsed)
	{
		// Update Player!
		player.tick();

		if (cerber.health < 0)
		{
			trace("Player ded");
		}
		super.update(elapsed);
	}
}