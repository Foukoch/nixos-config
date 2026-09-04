{ ... }:
{
  programs.thunderbird = {
    enable = true;
    profiles.default = {
      isDefault = true;
      settings = {
        "mail.spellcheck.inline" = true;
        "mailnews.mark_message_read.delay" = true;
        "mailnews.mark_message_read.delay.interval" = 3;
        "mail.html_compose" = false;
        "mail.tabs.autoHide" = false;
        "mailnews.default_view_flags" = 1;
        "datareporting.healthreport.uploadEnabled" = false;
        "toolkit.telemetry.enabled" = false;
      };
    };
  };
}
