package hungrypuppy;

import flixel.addons.ui.FlxUIState;
import hungrypuppy.utilities.MemoryManager;

class CerberState extends FlxUIState
{
	override public function destroy()
	{
		MemoryManager.clearAll();
		super.destroy();
	}
}