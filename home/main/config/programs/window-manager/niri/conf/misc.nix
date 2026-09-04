{ config, ... }:
{
  programs.niri.settings = {
    prefer-no-csd = true;
    screenshot-path = "~/Screenshots/%Y-%m-%d %H-%M-%S.png";
    spawn-at-startup = [
      {
        command = [
          "swaybg"
          "-i"
          "${config.home.homeDirectory}/nixos-config/dotfiles/wallpaper/nix-wallpaper.jpg"
        ];
      }
    ];
    environment = {
      #DISPLAY = null;
      QT_QPA_PLATFORM = "wayland";
      MOZ_ENABLE_WAYLAND = "1";
    };

    cursor = {
      theme = "Bibata-Modern-Ice";
      size = 24;
      hide-when-typing = true;
      hide-after-inactive-ms = null;
    };

    xwayland-satellite = {
      enable = true;
      path = "xwayland-satellite";
    };

    clipboard.disable-primary = false;
    hotkey-overlay.skip-at-startup = true;
    overview.zoom = 0.5;
  };
}
