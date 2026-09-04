{ pkgs, ... }:
{
  programs.niri.package = pkgs.niri;
  imports = [
    ./settings.nix
  ];
  home.packages = with pkgs; [
    rofi
    kitty
    swaylock
    swaybg
    wireplumber
    brightnessctl
    xwayland-satellite
    wl-clipboard
    libnotify
  ];
}
