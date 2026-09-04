{ ... }:
{
  programs.nixvim.plugins = {
    neogit.enable = true;
    diffview.enable = true; # compagnon habituel de neogit pour les diffs
  };

  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>gg";
      action = "<cmd>Neogit<cr>";
      options.desc = "Open Neogit";
    }
  ];
}
