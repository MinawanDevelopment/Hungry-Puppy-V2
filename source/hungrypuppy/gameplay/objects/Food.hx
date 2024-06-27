package hungrypuppy.gameplay.objects;

import flixel.FlxG;
import flixel.FlxSprite;
import hungrypuppy.data.FoodManager;

class Food extends FlxSprite
{
	var curFood = "";

	public function new()
	{
		super();
		curFood = FoodManager.foodFiles[FlxG.random.int(0, FoodManager.foodFiles.length - 1)];
		loadGraphic("assets/images/" + curFood + ".png");
		trace("Spawning new food!\nFood ID: " + curFood + "\nCur Scale: " + FoodManager.getScale(curFood));
	}
}