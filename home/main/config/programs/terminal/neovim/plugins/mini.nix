{ ... }:
{
  programs.nixvim = {
    plugins = {
      mini = {
        enable = true;
        modules = {
          ai = {
            n_lines = 500;
            search_method = "cover_or_next";
            custom_textobjects = {
              o = {
                __raw = ''
                  require('mini.ai').gen_spec.treesitter({
                    a = { '@block.outer', '@conditional.outer', '@loop.outer' },
                    i = { '@block.inner', '@conditional.inner', '@loop.inner' },
                  })
                '';
              };
              f = {
                __raw = ''
                  require('mini.ai').gen_spec.treesitter({
                    a = '@function.outer',
                    i = '@function.inner',
                  })
                '';
              };
            };
          };

          starter = {
            evaluate_single = true;

            header = ''
              ███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗
              ████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║
              ██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║
              ██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║
              ██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║
              ╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
            '';

            items = [
              { __raw = "require('mini.starter').sections.recent_files(10, false)"; }
              { __raw = "require('mini.starter').sections.builtin_actions()"; }
            ];

            content_hooks = [
              { __raw = "require('mini.starter').gen_hook.adding_bullet()"; }
              { __raw = "require('mini.starter').gen_hook.aligning('center', 'center')"; }
            ];

            footer = "";
          };
        };
      };
    };
  };
}
