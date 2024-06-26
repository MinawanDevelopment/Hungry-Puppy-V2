package hungrypuppy.ui;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxTimer;
import hungrypuppy.ui.uistuff.Text;
import hungrypuppy.utilities.CoolUtil;

class TitleState extends CerberState
{
	var pressEnterText:Text;
	var staticLogo:FlxSprite;

	override public function create()
	{
		pressEnterText = new Text();
		pressEnterText.y = FlxG.height - 50;
		pressEnterText.size = 50;
		pressEnterText.text = "Press ENTER to begin!";
		pressEnterText.screenCenter(X);
		add(pressEnterText);

		staticLogo = new FlxSprite();
		staticLogo.loadGraphic("assets/images/staticLogo.png");
		staticLogo.screenCenter();
		add(staticLogo);

		CoolUtil.loopDelayed(1, () ->
		{
			staticLogo.scale.set(1.2, 1.2);
			new FlxTimer().start(0.25, (timer:FlxTimer) ->
			{
				staticLogo.scale.set(1, 1);
			});
		});

		super.create();
	}
}