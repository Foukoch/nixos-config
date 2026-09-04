{ ... }:
{
  services.mako = {
    enable = true;
    settings = {
      width = 380;
      height = 150;
      margin = "10";
      padding = "10";
      border-size = 2;
      border-radius = 8;
      default-timeout = 6000;
      ignore-timeout = false;
      max-visible = 5;
      layer = "overlay";
      anchor = "top-right";
      sort = "-time";
      "urgency=low" = {
        default-timeout = 3000;
      };
      "urgency=high" = {
        default-timeout = 0;
      };
    };
  };
}
