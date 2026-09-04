{ config, ... }:
{
  programs.niri.settings = {
    workspaces = {
      "1" = {
        name = "web";
        open-on-output = "eDP-1";
      };
      "2" = {
        name = "latex";
      };
      "3" = {
        name = "games";
      };
      "4" = {
        name = "discord";
      };
    };

    window-rules = [
      # Kitty lancé spécifiquement pour la session LaTeX -> 0.7, sans bordure/gaps
      {
        matches = [ { app-id = "^kitty-latex$"; } ];
        open-on-workspace = "latex";
        open-maximized = true; # <- corrigé
        default-column-width.proportion = 0.7;
        border.enable = false;
        focus-ring.enable = false;
      }
      # Zathura -> 0.3, sans bordure/gaps
      {
        matches = [
          { app-id = "^org\\.pwmt\\.zathura$"; }
          { app-id = "^zathura$"; }
        ];
        open-on-workspace = "latex";
        open-maximized = true; # <- corrigé
        default-column-width.proportion = 0.3;
        border.enable = false;
        focus-ring.enable = false;
      }
      # Steam -> workspace games
      {
        matches = [
          { app-id = "^steam$"; }
          { app-id = "^steam_app.*"; }
        ];
        open-on-workspace = "games";
      }
      # Vesktop -> workspace discord
      {
        matches = [ { app-id = "^[Vv]esktop$"; } ];
        open-on-workspace = "discord";
      }
    ];

    binds = {
      "Alt+1".action.spawn = [
        "sh"
        "-c"
        ''niri msg action focus-workspace "web"; notify-send -a niri -u low -t 900 "web" || true''
      ];
      "Alt+2".action.spawn = [
        "sh"
        "-c"
        ''niri msg action focus-workspace "latex"; notify-send -a niri -u low -t 900 "latex" || true''
      ];
      "Alt+3".action.spawn = [
        "sh"
        "-c"
        ''niri msg action focus-workspace "games"; notify-send -a niri -u low -t 900 "games" || true''
      ];
      "Alt+4".action.spawn = [
        "sh"
        "-c"
        ''niri msg action focus-workspace "discord"; notify-send -a niri -u low -t 900 "discord" || true''
      ];
    };
  };
}
