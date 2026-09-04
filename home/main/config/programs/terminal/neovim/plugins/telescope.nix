{ ... }:
{
  programs.nixvim = {
    plugins = {
      telescope = {
        enable = true;

        extensions = {
          fzf-native.enable = true;
          ui-select.enable = true;
        };

        settings = {
          defaults = {
            layout_strategy = "horizontal";
            sorting_strategy = "ascending";
            color_devicons = true;
            file_ignore_patterns = [
              "^.git/"
              "^result/"
              "^%.direnv/"
            ];
            vimgrep_arguments = [
              "rg"
              "-L"
              "--color=never"
              "--no-heading"
              "--with-filename"
              "--line-number"
              "--column"
              "--smart-case"
            ];
          };
        };

        keymaps = {
          "<leader>ff" = "find_files";
          "<leader>fg" = "live_grep";
          "<leader>fb" = "buffers";
          "<leader>fh" = "help_tags";
          "<leader>fd" = "diagnostics";
          "<leader>fr" = "lsp_references";
          "<leader>fs" = "lsp_document_symbols";
        };
      };
    };
  };
}
