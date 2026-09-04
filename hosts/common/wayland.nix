{
  pkgs,
  lib,
  ...
}:
{
  security = {
    polkit.enable = true;
    pam.services.hyprlock = { };
    pam.services.swaylock = { };
  };

  programs = {
    dconf.enable = true;
    xwayland.enable = true;
  };

  services.graphical-desktop.enable = true;
  services.xserver.desktopManager.runXdgAutostartIfNone = lib.mkDefault true;

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config.common.default = "*";
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
  };
}
