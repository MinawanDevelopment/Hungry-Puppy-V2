package hungrypuppy.utilities;

import flixel.FlxG;
import flixel.input.FlxInput.FlxInputState;
import flixel.input.actions.FlxActionInput.FlxInputDevice;
import flixel.input.keyboard.FlxKey;
import flixel.util.FlxTimer;

// Don't have a name for this!
class CoolUtil
{
	public static function loopDelayed(wait:Float, onComplete:Dynamic)
	{
		new FlxTimer().start(wait, (timer:FlxTimer) ->
		{
			onComplete();
			loopDelayed(wait, onComplete);
		});
	}
	public static function delayCallback(wait:Float, onComplete:Dynamic)
	{
		new FlxTimer().start(wait, (timer:FlxTimer) ->
		{
			onComplete(); // Removes the FlxTimer requirement in the onComplete function doing it like dis;
		});
	} // Keybinds

	public static function isKey(key:FlxKey, status:FlxInputState)
	{
		return FlxG.keys.checkStatus(key, status);
	}
}