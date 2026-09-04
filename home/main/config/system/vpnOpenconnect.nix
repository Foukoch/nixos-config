{ pkgs, ... }:
{
  services.network-manager-applet.enable = true;
  home.packages = [ pkgs.networkmanager-openconnect ];
}
