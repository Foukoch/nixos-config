{ pkgs, ... }:
{
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-vkcapture
      obs-backgroundremoval
      obs-pipewire-audio-capture
    ];
  };

  home.packages = with pkgs; [
    obs-cli
  ];
}
