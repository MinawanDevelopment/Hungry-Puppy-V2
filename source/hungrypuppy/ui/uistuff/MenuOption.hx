package hungrypuppy.ui.uistuff;

class MenuOption extends Text {

    public function new(prompt:String, id) {
        super();

        text = prompt;
        ID = id;
        size = 50;
        y = 70 * id;
        x = 25;
    }

    public function tick(curSelected) {
        if (ID == curSelected) {
            alpha = 1;
            scale.set(1.2, 1.2);
        } else {
            alpha = 0.6;
            scale.set(1, 1);
        }
    }
}