package hungrypuppy.ui;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import hungrypuppy.ui.uistuff.MenuBackground;
import hungrypuppy.ui.uistuff.MenuOption;

class CreditsState extends CerberState {

    public var credits:Array<Dynamic> = [
        ["CerberVT", "The streamer that made this possible!", "https://twitch.tv/cerbervt", [155, 0, 255]]
    ];

    public var credGroup = new Array<MenuOption>();
    var curSelected = 0;

    var bg:FlxSprite;

    override public function create() {
        super.create();

        bg = new FlxSprite();
        bg.makeGraphic(FlxG.width, FlxG.height, FlxColor.WHITE);
        add(bg); 

        for (i in 0...credits.length) {
            var cred = new MenuOption(credits[i][0], i);
            cred.color = FlxColor.WHITE;
            credGroup.push(cred);
            add(cred);
        }

        updateSelection(0);
    }
    
    override public function update(elapsed) {
        
        if (FlxG.keys.justPressed.UP) {
            updateSelection(-1);
        } 

        if (FlxG.keys.justPressed.DOWN) {
            updateSelection(1);
        }

		if (FlxG.keys.justPressed.ESCAPE)
		{
			FlxG.switchState(new MainMenuState());
		}

        super.update(elapsed);
    }

    public function updateSelection(huh) {
        curSelected += huh;

        if (credits[curSelected][0] == "") {
            updateSelection(huh);
        } 

        bg.color = FlxColor.fromRGB(credits[curSelected][3][0], credits[curSelected][3][1], credits[curSelected][3][2]);

        if (curSelected > credGroup.length - 1) {
            curSelected = 0;
        } else if (curSelected < 0) {
            curSelected = credGroup.length - 1;
        }

        for (cred in credGroup) {
            cred.tick(curSelected);
        }


    }
}