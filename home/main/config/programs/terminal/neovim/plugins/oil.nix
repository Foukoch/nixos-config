{ ... }:
{
  programs.nixvim = {
    plugins.oil = {
      enable = true;
      settings = {
        default_file_explorer = true;
        columns = [
          "icon"
          "size"
          "mtime"
        ];
        buf_options = {
          buflisted = false;
          bufhidden = "hide";
        };
        view_options = {
          show_hidden = true;
          natural_order = true;
        };
        delete_to_trash = true;
        lsp_file_method.autosave_changes = true;
        keymaps = {
          "<CR>" = "actions.select";
          "-" = "actions.parent";
          "_" = "actions.open_cwd";
          "gs" = "actions.change_sort";
          "g." = "actions.toggle_hidden";
          "<C-h>" = "actions.select_split";
          "<C-v>" = "actions.select_vsplit";
          "q" = "actions.close";
        };
      };
    };

    keymaps = [
      # ✅ à l'intérieur de programs.nixvim
      {
        mode = "n";
        key = "-";
        action = "<CMD>Oil<CR>";
        options.desc = "Open parent directory";
      }
    ];
  };
}
