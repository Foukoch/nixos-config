{ ... }:
{
  programs.niri.settings.outputs = {
    "eDP-1" = {
      enable = true;
      scale = 1.0;
      transform.rotation = 0; # 0, 90, 180, 270
      position = {
        x = 0;
        y = 0;
      };
      mode = {
        width = 1920;
        height = 1080;
        refresh = 120.0;
      };
      variable-refresh-rate = true; # true, false, on-demand
      # background-color = "#000000";
    };
    # 2nd screen
    # `niri msg outputs`) :
    # "HDMI-A-1" = {
    #   enable = true;
    #   scale = 1.0;
    #   position = { x = 1920; y = 0; };
    #   mode = { width = 2560; height = 1440; refresh = 144.0; };
    # };

  };
}
