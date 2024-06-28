package hungrypuppy.ui;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import hungrypuppy.backend.Music;
import hungrypuppy.ui.uistuff.Text;
import hungrypuppy.utilities.CoolUtil;

class TitleState extends CerberState
{
	var pressEnterText:Text;
	var staticLogo:FlxSprite;

	override public function create()
	{
		BeatHandler.playMusic("assets/music/cerberTheme.ogg", true, 140);
		FlxG.sound.music.volume = 0;
		MusicUtil.fadeIn(1);		

		pressEnterText = new Text();
		pressEnterText.color = FlxColor.WHITE;
		pressEnterText.y = FlxG.height - 50;
		pressEnterText.size = 50;
		pressEnterText.text = "Press ENTER to begin!";
		pressEnterText.screenCenter(X);
		add(pressEnterText);

		staticLogo = new FlxSprite();
		staticLogo.loadGraphic("assets/images/staticLogo.png");
		staticLogo.screenCenter();
		add(staticLogo);

		/*
		CoolUtil.loopDelayed(1, () ->
		{
			staticLogo.scale.set(1.2, 1.2);
			new FlxTimer().start(0.25, (timer:FlxTimer) ->
			{
				staticLogo.scale.set(1, 1);
			});
		});
		 */

		super.create();
	}

	override public function beatHit(curBeat)
	{
		staticLogo.scale.set(1.2, 1.2);
		new FlxTimer().start(0.25, (timer:FlxTimer) ->
		{
			staticLogo.scale.set(1, 1);
		});
		super.beatHit(curBeat);
	}

	override public function update(elapsed) {

		if (FlxG.keys.justReleased.ENTER) {
			hungrypuppy.backend.BeatHandler.stopMusic();
			FlxG.camera.flash(FlxColor.WHITE, 0.6, () ->
			{		
				FlxG.switchState(new hungrypuppy.ui.MainMenuState());
			});
		}

		super.update(elapsed);
	}
}