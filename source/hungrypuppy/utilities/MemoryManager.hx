package hungrypuppy.utilities;

import flixel.FlxG;
import flixel.sound.FlxSound;
import lime.utils.Assets as LimeAssets;
import openfl.Assets as OpenFlAssets;
import openfl.system.System;

class MemoryManager
{
	public static function clearSound()
	{
		FlxG.sound.list.forEach(function(sound:FlxSound)
		{
			FlxG.sound.list.remove(sound, true);
			sound.stop();
			sound.destroy();
		});
		FlxG.sound.list.clear();
	}

	public static function clearImage()
	{
		FlxG.bitmap.dumpCache();
		FlxG.bitmap.clearCache();
	}

	public static function clearAssets()
	{
		OpenFlAssets.cache.clear();
		LimeAssets.cache.clear();
		System.gc();
	}

	public static function clearAll()
	{
		clearImage();
		clearSound();
		clearAssets();
	}
}
 