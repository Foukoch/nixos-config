# fichiers lua bruts
{ ... }:
{
  programs.nixvim = {
    extraFiles = {
      # lua
      "lua/conf/settings.lua".source = ../lua/settings.lua;
      "lua/conf/lsp-config.lua".source = ../lua/lsp-config.lua;
      "lua/conf/remap.lua".source = ../lua/remap.lua;
      "lua/conf/autocmd.lua".source = ../lua/autocmd.lua;
      # snippets
      "luasnippets/tex.lua".source = ../snippets/tex.lua;
      "luasnippets/matlab.lua".source = ../snippets/matlab.lua;
    };
    extraConfigLua = ''
      require("conf.settings")
      require("conf.lsp-config")
      require("conf.remap")
      require("conf.autocmd")
      require("luasnip.loaders.from_lua").load()
    '';
  };

}
