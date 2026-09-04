{ ... }:
{
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;

    settings = {
      confirm_os_window_close = 0;
      enable_audio_bell = false;
      window_padding_width = 6;
      hide_window_decorations = "yes";
      scrollback_lines = 10000;
      cursor_shape = "beam";
      cursor_blink_interval = 0;
    };

    keybindings = {
      "ctrl+shift+enter" = "new_window_with_cwd";
      "ctrl+shift+t" = "new_tab_with_cwd";
    };
  };
}
