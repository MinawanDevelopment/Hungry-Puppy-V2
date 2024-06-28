package hungrypuppy.backend;

import flixel.FlxG;
import flixel.util.FlxTimer;
import hungrypuppy.utilities.CoolUtil;

class BeatHandler
{
	public static var beatDuration:Float = 0;
	public static var curBeat = 0;
	public static var resetOnStateChange = false;
	public static var onBeatHitCallbacks:Array<Dynamic> = [];

	public static function playMusic(path:String, loop:Bool, ?bpm = 120)
	{
		beatDuration = 60 / bpm;
		curBeat = 0;
		FlxG.sound.playMusic(path, 1, loop);
		trace("Woah! I'm playing music - Beat Dur: " + beatDuration);
		beatLoop();
	}

	public static function registerCallback(callback:Dynamic)
	{
		if (onBeatHitCallbacks.contains(callback))
		{
			return;
		}

		onBeatHitCallbacks.push(callback);
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

	public static function beatLoop()
	{
		if (FlxG.sound.music.playing == false)
		{
			trace("Welp sound is gone ig! I'm out of here!");
			return;
		}
		new FlxTimer().start(beatDuration, (timer:FlxTimer) ->
		{
			curBeat += 1;
			// onComplete(curBeat);
			// beatLoop(onComplete);
			for (callback in onBeatHitCallbacks)
			{
				callback();
			}
			beatLoop();
		});
	}
}

class MusicUtil
{
	public static function fadeOut() // DO NOT USE! ITS BROKEN
	{
		new FlxTimer().start(0.15, (timer:FlxTimer) ->
		{
			if (FlxG.sound.music.volume == 0)
			{
				BeatHandler.stopMusic();
				return;
			}
			else
			{
				FlxG.sound.music.volume -= 0.1;
				fadeOut();
			}
		});
	}

	public static function fadeIn(endVol:Float)
	{
		FlxG.sound.music.fadeIn(1, 0, endVol);
	}
}