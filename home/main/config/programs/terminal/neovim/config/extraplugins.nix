# plugins non implémentés dans nixvim et/ou nixpkgs
{ ... }:
{
  # extraPlugins = [
  # HORS NIXVIM
  # pkgs.vimPlugins."<plugin name>"
  # HORS NIXPKGS
  #(pkgs.vimUtils.buildVimPlugin {
  #  name = "myPlugin";
  #  src = pkgs.fetchFromGitHub {
  #      owner = "<owner>";
  #      repo = "<repo>";
  #      rev = "<commit hash>";
  #      hash = "<nix NAR hash>";
  #  };
  #})
  #];
}
