{ config, ... }:
let
  dots = "${config.home.homeDirectory}/nixos-config/dotfiles";
  link = config.lib.file.mkOutOfStoreSymlink;
in
{
  xdg.configFile = {
    "inkscape/templates".source = link "${dots}/inkscape/templates";
    "inkscape/palettes".source = link "${dots}/inkscape/palettes";
    "rofi".source = link "${dots}/rofi";
    #"nvim".source = link "${dots}/nvim";
  };
}

# xdg.configFile."i3blocks/config".source = ./i3blocks.conf;
# home.file.".gdbinit".text = ''
#   set auto-load safe-path /nix/store
#   '';
#   create symlink $XDG_CONFIG_HOME/i3blocks/config and ~/.gdbinit
