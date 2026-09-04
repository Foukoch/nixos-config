{ pkgs, ... }:
{
  programs.niri.enable = true;
  programs.niri.package = pkgs.niri;
  systemd.user.services.niri = {
    enableDefaultPath = false;
    overrideStrategy = "asDropin";
  };
}
