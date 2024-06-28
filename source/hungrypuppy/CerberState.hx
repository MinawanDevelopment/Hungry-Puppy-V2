package hungrypuppy;

import flixel.addons.ui.FlxUIState;
import hungrypuppy.backend.Music;
import hungrypuppy.utilities.MemoryManager;

class CerberState extends FlxUIState
{
	override public function create()
	{
		hungrypuppy.backend.BeatHandler.registerCallback(beatHit); // Replaced some shitty wonky beatLoop func

		super.create();
	}

	public function beatHit(curBeat:Int)
	{
		// Beat hit logic!
	}

	override public function destroy()
	{
		trace("State says bai bai!");
		MemoryManager.clearAll();
		BeatHandler.reset();
		super.destroy();
	}
}