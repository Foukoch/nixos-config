{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # --- Bureautique
    libreoffice-stable
    zotero
    pandoc
    # --- Communication
    signal-desktop
    mattermost-desktop
    protonmail-bridge
    # --- Multimédia
    gimp
    inkscape
    nomacs
    imagemagick
    librsvg
    # --- Maths
    (octave.withPackages (
      ps: with ps; [
        image
        statistics
        symbolic
      ]
    ))
    gnuplot
    # --- Fichiers
    nautilus
    # ---  Others
    fetch
    fastfetch
    pkg-config
    brightnessctl
    mullvad-vpn
    rofi
    libsecret
    # --- Themes
    nwg-look
    papirus-icon-theme
    bibata-cursors
  ];
}
