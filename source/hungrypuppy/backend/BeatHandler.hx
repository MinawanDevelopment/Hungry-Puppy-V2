package hungrypuppy.backend;

import flixel.FlxG;
import flixel.util.FlxTimer;

class BeatHandler
{
	public static var beatDuration:Float = 0;
	public static var curBeat = 0;
	public static var resetOnStateChange = false;

	public static function playMusic(path:String, loop:Bool, ?bpm = 120)
	{
		beatDuration = 60 / bpm;
		curBeat = 0;
		FlxG.sound.playMusic(path, 1, loop);
		trace("Woah! I'm playing music - Beat Dur: " + beatDuration);
	}

	public static function reset()
	{
		if (resetOnStateChange)
		{
			beatDuration = 0;
		}
		curBeat = 0;
	}

	public static function stopMusic()
	{
		if (FlxG.sound.music != null)
		{
			FlxG.sound.music.stop();
			beatDuration = 0;
			curBeat = 0;
		}
	}

	public static function beatLoop(onComplete:Dynamic)
	{
		if (FlxG.sound.music.playing == false)
		{
			trace("Welp sound is gone ig! I'm out of here!");
			return;
		}
		new FlxTimer().start(beatDuration, (timer:FlxTimer) ->
		{
			curBeat += 1;
			onComplete(curBeat);
			beatLoop(onComplete);
		});
	}
}