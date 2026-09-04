{ ... }:
{
  programs.niri.settings.window-rules = [
    {
      matches = [ { app-id = "^zen-beta$"; } ];
      default-column-width = {
        proportion = 0.66667;
      };
    }
    {
      matches = [ { title = "^Picture-in-Picture$"; } ];
      open-floating = true;
      default-floating-position = {
        x = 16;
        y = 16;
        relative-to = "bottom-right";
      };
    }
    {
      matches = [ { app-id = "^(pavucontrol|blueman-manager)$"; } ];
      open-floating = true;
    }
    {
      matches = [ { app-id = "^kitty$"; } ];
      opacity = 0.95;
      clip-to-geometry = true;
    }
    {
      matches = [ { app-id = "^mpv$"; } ];
      open-fullscreen = true;
    }
  ];
}
