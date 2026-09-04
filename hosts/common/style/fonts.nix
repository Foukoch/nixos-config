{ pkgs, ... }: {
  fonts.packages = with pkgs; [
    # Sans / Source (adobe-source-*-fonts, source-han-sans)
    source-sans
    source-serif
    source-han-sans # adobe-source-han-sans-otc-fonts
    source-han-serif
    # Noto + emoji + CJK (noto-fonts-cjk, noto-fonts-emoji)
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
    # Microsoft / Windows (ttf-ms-fonts + corefonts)
    corefonts
    vista-fonts # tahoma, etc. (unfree)
    # Latin Modern / TeX Gyre (otf-latin-modern, tex-gyre-math)
    lmodern
    gyre-fonts
    # Accessibilité (ttf-luciole)
    texlivePackages.luciole
    # Nerd fonts / symboles (ttf-nerd-fonts-symbols, font-awesome, woff2-font-awesome)
    nerd-fonts.symbols-only
    font-awesome
    # Fontes de code utiles
    fira-code
    nerd-fonts.jetbrains-mono
    dejavu_fonts
    liberation_ttf
  ];
}
