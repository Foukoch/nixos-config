{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # --- Bureautique ---
    libreoffice-stable
    zotero
    # --- Communication ---
    signal-desktop
    vesktop
    mattermost-desktop
    protonmail-bridge
    # --- Multimédia ---
    gimp
    inkscape
    imagemagick
    librsvg
    streamlink
    kdePackages.gwenview
    # --- Maths ---
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
    # --- Others
    ncpamixer
    ffmpeg
    fetch
    fastfetch
    pkg-config
    mullvad-vpn
    rofi
    # --- Themes
    nwg-look
    papirus-icon-theme
    bibata-cursors
  ];
}
