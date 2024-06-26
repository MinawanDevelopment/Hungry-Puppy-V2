package hungrypuppy.ui.uistuff;

import flixel.text.FlxText;
import flixel.util.FlxColor;

class Text extends FlxText
{
	public function new()
	{
		super();
		setFormat("assets/fonts/cerber.ttf", 16);
		color = FlxColor.PURPLE;
	}
}