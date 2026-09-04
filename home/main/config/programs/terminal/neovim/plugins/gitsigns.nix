{ ... }:
{
  programs.nixvim.plugins.gitsigns.enable = true;

  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "]c";
      action.__raw = ''
        function()
          if vim.wo.diff then return "]c" end
          vim.schedule(function() require("gitsigns").nav_hunk("next") end)
          return "<Ignore>"
        end
      '';
      options = {
        desc = "Next git hunk";
        expr = true;
      };
    }
    {
      mode = "n";
      key = "[c";
      action.__raw = ''
        function()
          if vim.wo.diff then return "[c" end
          vim.schedule(function() require("gitsigns").nav_hunk("prev") end)
          return "<Ignore>"
        end
      '';
      options = {
        desc = "Previous git hunk";
        expr = true;
      };
    }
    {
      mode = "n";
      key = "<leader>hs";
      action.__raw = ''function() require("gitsigns").stage_hunk() end'';
      options.desc = "Stage hunk";
    }
    {
      mode = "n";
      key = "<leader>hr";
      action.__raw = ''function() require("gitsigns").reset_hunk() end'';
      options.desc = "Reset hunk";
    }
    {
      mode = "n";
      key = "<leader>hp";
      action.__raw = ''function() require("gitsigns").preview_hunk() end'';
      options.desc = "Preview hunk";
    }
    {
      mode = "n";
      key = "<leader>hb";
      action.__raw = ''function() require("gitsigns").blame_line({ full = true }) end'';
      options.desc = "Blame line";
    }
  ];
}
