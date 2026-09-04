{ ... }:
{
  programs.nixvim.plugins.which-key.enable = true;

  programs.nixvim.extraConfigLua = ''
    require("which-key").add({
      { "<leader>f", group = "Find" },
      { "<leader>g", group = "Git" },
      { "<leader>h", group = "Git Hunk" },
      { "<leader>s", group = "Spell" },
      { "<leader>c", group = "Code" },
      { "<leader>r", group = "Run" },
      { "<leader>l", group = "LaTeX" },
      { "<leader>t", group = "Toggle" },
    })
  '';
}
