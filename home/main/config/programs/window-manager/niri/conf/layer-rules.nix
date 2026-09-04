{ ... }:
{
  programs.niri.settings.layer-rules = [
    {
      matches = [ { namespace = "^notifications$"; } ];
      block-out-from = "screen-capture";
    }
    {
      matches = [ { namespace = "^waybar$"; } ];
      place-within-backdrop = false;
    }
  ];
}
