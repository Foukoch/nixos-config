{ ... }:
# General idea
#   Alt is for focus switch or open/close windows shortcut
#   Ctrl is for changing size or state
#   Mod is for moving windows
{
  programs.niri.settings.binds = {
    # open programs
    "ALT+Q".action.spawn = "kitty";
    "ALT+W".action.spawn = [
      "rofi"
      "-show"
      "drun"
    ];
    "ALT+X".action.spawn = [
      "rofi"
      "-show"
      "window"
    ];
    "ALT+C".action.spawn = [
      "rofi"
      "-show"
      "filebrowser"
    ];

    "ALT+D".action.spawn = "nautilus";
    "ALT+N".action.spawn = [
      "kitty"
      "-e"
      "tmux"
      "new-session"
      "-A"
      "-s"
      "scratch"
      "nvim"
    ];
    "Alt+F".action.spawn = [ "zen-beta" ];
    "Alt+Z".action.spawn = [ "zotero" ];
    "Alt+T".action.spawn = [ "thunderbird" ];
    # other actions
    "ALT+F4".action.close-window = { };
    "ALT+V".action.switch-focus-between-floating-and-tiling = { };
    # size control
    "Ctrl+W".action.toggle-window-floating = { };
    "CTRL+M".action.maximize-column = { };
    "CTRL+F".action.fullscreen-window = { };
    "Ctrl+R".action.switch-preset-column-width = { };
    "Ctrl+Alt+H".action.set-column-width = [ "-10%" ];
    "Ctrl+Alt+L".action.set-column-width = [ "+10%" ];
    "Ctrl+Alt+J".action.set-window-height = "-10%";
    "Ctrl+Alt+K".action.set-window-height = "+10%";
    # switch focus
    "ALT+H".action.focus-column-left = { };
    "ALT+L".action.focus-column-right = { };
    "ALT+K".action.focus-workspace-up = { };
    "ALT+J".action.focus-workspace-down = { };
    "Alt+A".action.focus-monitor-left = { };
    "Alt+B".action.focus-monitor-right = { };
    # move windows
    "Super+H".action.move-column-left = { };
    "Super+L".action.move-column-right = { };
    "Super+K".action.move-column-to-workspace-up = { };
    "Super+J".action.move-column-to-workspace-down = { };
    "Super+A".action.move-column-to-monitor-left = { };
    "Super+B".action.move-column-to-monitor-right = { };
    # screenshot
    "Print".action.screenshot = { };
    "Ctrl+Print".action.screenshot-screen = { };
    "Alt+Print".action.screenshot-window = { };
    # special shortcut
    "XF86MonBrightnessUp" = {
      allow-when-locked = true;
      action.spawn = [
        "brightnessctl"
        "-e4"
        "-n2"
        "set"
        "5%+"
      ];
    };
    "XF86MonBrightnessDown" = {
      allow-when-locked = true;
      action.spawn = [
        "brightnessctl"
        "-e4"
        "-n2"
        "set"
        "5%-"
      ];
    };
    "XF86AudioRaiseVolume" = {
      allow-when-locked = true;
      action.spawn = [
        "wpctl"
        "set-volume"
        "-l"
        "1"
        "@DEFAULT_AUDIO_SINK@"
        "5%+"
      ];
    };
    "XF86AudioLowerVolume" = {
      allow-when-locked = true;
      action.spawn = [
        "wpctl"
        "set-volume"
        "@DEFAULT_AUDIO_SINK@"
        "5%-"
      ];
    };
    "XF86AudioMute" = {
      allow-when-locked = true;
      action.spawn = [
        "wpctl"
        "set-mute"
        "@DEFAULT_AUDIO_SINK@"
        "toggle"
      ];
    };
    "XF86AudioMicMute" = {
      allow-when-locked = true;
      action.spawn = [
        "wpctl"
        "set-mute"
        "@DEFAULT_AUDIO_SOURCE@"
        "toggle"
      ];
    };

    # Verrouillage d'écran
    "Ctrl+Alt+Delete" = {
      action.spawn = [ "swaylock" ];
      allow-when-locked = true;
    };
    # Aperçu global (overview)
    "Alt+Tab".action.toggle-overview = { };
    # Quitter niri
    "Ctrl+Alt+M".action.quit = { };

    # workspaces

  };
}
