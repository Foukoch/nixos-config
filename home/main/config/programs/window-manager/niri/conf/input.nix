{ ... }:
{
    programs.niri.settings.input = {
        mod-key = "Alt";
        keyboard = {
            xkb = {
                layout = "fr";
                variant = "";
                model = "";
                rules = "";
                #options = "caps:escape";
            };
            repeat-delay = 600;
            repeat-rate = 25;
            track-layout = "global";
            numlock = true;
        };

        touchpad = {
            #enable = false;
            disabled-on-external-mouse = true;
            tap = true;
            dwt = true;
            dwtp = true;
            drag = true;
            drag-lock = false;
            natural-scroll = true;
            accel-speed = 0.0;
            accel-profile = "adaptive";
            scroll-method = "two-finger";
            tap-button-map = "left-middle-right";
            click-method = "clickfinger";
            middle-emulation = false;
            scroll-factor = 1.2;
        };

        mouse = {
            natural-scroll = false;
            accel-speed = -0.3;
            accel-profile = "flat";
            scroll-factor = 1.2;
            scroll-method = null;
        };

        focus-follows-mouse = {
            enable = false;
        };
    };

}
