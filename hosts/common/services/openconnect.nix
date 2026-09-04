{ pkgs, ... }:
{
  networking.networkmanager.enable = true;
  networking.networkmanager.plugins = [ pkgs.networkmanager-openconnect ];
}
