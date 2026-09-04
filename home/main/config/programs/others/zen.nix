{ inputs, ... }:
{
  imports = [ inputs.zen-browser.homeModules.beta ];
  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;
    profiles.default = { };
  };
  stylix.targets.zen-browser.profileNames = [ "default" ];
}
