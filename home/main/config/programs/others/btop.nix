# https://github.com/aristocratos/btop#configurability
{ ... }:
{
  programs.btop = {
    enable = true;
    extraConfig = ''
      theme_background = False
      vim_keys = True
      rounded_corners = True
      graph_symbol = "memory"
      update_ms = 500
      proc_sorting = "cpu lazy"
      proc_tree = True
      proc_colors = True
      proc_gradient = True
      proc_per_core = False
      show_uptime = True
      show_cpu_freq = True
      clock_format = "%H:%M"
      background_update = True
      show_battery = True
      base_10_sizes = False
    '';
  };
}
