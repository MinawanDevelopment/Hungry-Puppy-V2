package hungrypuppy;

import flixel.addons.ui.FlxUIState;
import hungrypuppy.backend.BeatHandler;
import hungrypuppy.utilities.MemoryManager;

class CerberState extends FlxUIState
{
	override public function create()
	{
		BeatHandler.beatLoop(beatHit);

		super.create();
	}

	public function beatHit(curBeat:Int)
	{
		trace("(Cur Beat Hit: " + curBeat + ") ");
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