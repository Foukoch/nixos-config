{ ... }:
{
  programs.nixvim = {
    plugins = {
      lualine = {
        enable = true;
        settings = {
          options = {
            theme = "auto";
            globalstatus = true;
            component_separators = {
              left = "";
              right = "";
            };
            section_separators = {
              left = "";
              right = "";
            };
            disabled_filetypes = {
              statusline = [ "alpha" ];
            };
          };

          sections = {
            lualine_a = [ "mode" ];
            lualine_b = [
              "branch"
              "diff"
            ];
            lualine_c = [
              {
                __unkeyed-1 = {
                  __raw = ''
                    function()
                      if vim.bo.filetype == "oil" then
                        return require("oil").get_current_dir() or ""
                      end
                      return vim.fn.expand("%:~:.")
                    end
                  '';
                };
              }
              "diagnostics"
            ];
            lualine_x = [
              {
                __unkeyed-1 = {
                  __raw = ''
                    function()
                      local clients = vim.lsp.get_clients({ bufnr = 0 })
                      if #clients == 0 then return "" end
                      local names = {}
                      for _, c in ipairs(clients) do
                        table.insert(names, c.name)
                      end
                      return table.concat(names, ", ")
                    end
                  '';
                };
                icon = "";
              }
              "encoding"
              "fileformat"
              "filetype"
            ];
            lualine_y = [ "progress" ];
            lualine_z = [ "location" ];
          };
        };
      };
    };
  };
}
