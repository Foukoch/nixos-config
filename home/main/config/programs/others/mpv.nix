# configuration perso, raccourci CTRL H pour liste youtube/twitch
# voir dotfiles pour ajotuer des chaînes à suivre
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    yt-dlp
    streamlink
    curl
  ];

  programs.mpv = {
    enable = true;
    scripts = with pkgs.mpvScripts; [
      uosc
      thumbfast
      sponsorblock
    ];
    config = {
      osc = false;
      border = false;
      ytdl-format = "bestvideo[height<=?1080]+bestaudio/best";
      save-position-on-quit = true;
    };
  };
}
