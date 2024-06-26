package hungrypuppy.utilities;

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
}