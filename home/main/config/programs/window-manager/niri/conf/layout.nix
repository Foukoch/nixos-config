{ ... }:
{
  programs.niri.settings.layout = {
    gaps = 8;
    center-focused-column = "never"; # never, always, on-overflow
    always-center-single-column = false;

    preset-column-widths = [
      { proportion = 0.33333; }
      { proportion = 0.5; }
      { proportion = 0.66667; }
    ];

    default-column-width.proportion = 0.5;

    preset-window-heights = [
      { proportion = 0.33333; }
      { proportion = 0.5; }
      { proportion = 0.66667; }
    ];

    focus-ring = {
      enable = true;
      width = 2;
      # active.color = "#7fc8ff";
      # inactive.color = "#505050";
      # urgent.color = "#9b0000";
    };

    border = {
      enable = false;
      width = 2;
      # active.color = "#ffc87f";
      # inactive.color = "#505050";
      # urgent.color = "#9b0000";
    };

    shadow = {
      enable = false;
      softness = 30;
      spread = 5;
      offset = {
        x = 0;
        y = 5;
      };
    };

    tab-indicator = {
      enable = true;
      hide-when-single-tab = true;
      place-within-column = false;
      gap = 5;
      width = 4;
      length.total-proportion = 0.5;
      position = "left"; # "left" | "right" | "top" | "bottom"
      gaps-between-tabs = 0;
      corner-radius = 0;
      # active.color = "#7fc8ff";
      # inactive.color = "#505050";
      # urgent.color = "#9b0000";
    };

    insert-hint = {
      enable = true;
      # color = "#7fc8ff4d";
    };

    struts = {
      left = 0;
      right = 0;
      top = 0;
      bottom = 0;
    };

    # background-color = "transparent";
  };
}
