{ ... }:
{
  programs.nixvim = {
    plugins = {
      blink-cmp = {
        enable = true;
        settings = {
          keymap.preset = "default";
          completion = {
            keyword.range = "full";
            trigger.show_on_keyword = true;
            list.selection = {
              preselect = true;
              auto_insert = true;
            };
            accept.auto_brackets.enabled = true;
            ghost_text.enabled = true;
          };
          signature = {
            enabled = true;
          };
          sources.default = [
            "lsp"
            "path"
            "snippets"
            "buffer"
          ];
        };
      };
    };
  };
}
