{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    texliveFull
    pandoc
    texlab
  ];

  home.file.".latexmkrc".text = ''
    $pdf_mode = 1;
    $synctex = 1;
    $aux_dir = "${config.home.homeDirectory}/.aux-tex";
    $out_dir = ".";
    $pdf_previewer = "zathura %O %S";
    $clean_ext = "synctex.gz synctex.gz(busy) run.xml bcf fdb_latexmk";
  '';
}
