package hungrypuppy.ui;

import flixel.util.FlxColor;
import flixel.FlxG;
import hungrypuppy.ui.uistuff.MenuOption;

class MainMenuState extends CerberState {

    public var options = [
        "Play",
        "Credits",
        #if desktop
        "Exit"
        #end
    ];

    var curSelected = 0;

    var optionGroup = new Array<MenuOption>();

    override public function create() {
        super.create();

        for (i in 0...options.length) {
            var opt = new MenuOption(options[i], i);
            optionGroup.push(opt);
            add(opt);
        }

        updateSelection(0);
    }

    override public function update(elapsed) {
        
        if (FlxG.keys.justPressed.UP) {
            updateSelection(-1);
        } 

        if (FlxG.keys.justPressed.ENTER) {
            submitSelection();
        }

        if (FlxG.keys.justPressed.DOWN) {
            updateSelection(1);
        }

        super.update(elapsed);
    }

    public function submitSelection() {
        var daChoice = options[curSelected];

        for (opt in optionGroup) {
            if (opt.ID != curSelected) {
                remove(opt);
            }
        }

        switch(daChoice) {
            case "Credits":
                trace("Credits State?");
                FlxG.switchState(new CreditsState());
            default:
                trace("Choice not found - " + daChoice);
                FlxG.resetState();
        }
    }

    public function updateSelection(huh) {
        curSelected += huh;

        if (curSelected > optionGroup.length - 1) {
            curSelected = 0;
        } else if (curSelected < 0) {
            curSelected = optionGroup.length - 1;
        }

        for (option in optionGroup) {
            option.tick(curSelected); // Update the silly selection
        }
    }
}