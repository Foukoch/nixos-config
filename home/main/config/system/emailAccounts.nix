# GESTION DES ADRESSES MAIL
# - pour une adresse "classique" :
#       ajouter le mdp dans les sops
#       ajouter les adresses, hosts etc... dans .personal-info/local.nix
#       ajouter un accounts.email.account sur le format de travail
# - pour une adresse microsoft office365 :
#       ajouter l'adresse dans personal-info/local.nix
#       ajouter un accounts.email.account sur le format de stage ou suede
# - pour une adresse protonmail (portail local) :
#       suivre le tutoriel du README
# ------------------------------------------------------------------------
# format office365 :
#     mailName = {
#      address = local.emails.<name>;
#      userName = local.emails.<name>;
#      realName = local.fullName;
#      flavor = "outlook.office365.com";
#      imap = {
#        host = "outlook.office365.com";
#        port = 993;
#        tls.enable = true;
#        tls.useStartTls = false;
#      };
#      smtp = {
#        host = "smtp.office365.com";
#        port = 587;
#        tls.enable = true;
#        tls.useStartTls = true;
#      };
#      thunderbird.enable = true;
#      thunderbird.profiles = [ "default" ];
#    };
# ------------------------------------------------------------------------
# format classique :
#    <name> = {
#      address = local.emails.<name>.mail;
#      userName = local.emails.<name>.mail;
#      realName = local.fullName;
#      imap = {
#        host = local.emails.<name>.smtp;
#        port = local.emails.<name>.imapport;
#      };
#      smtp = {
#        host = local.emails.<name>.smtp;
#        port = local.emails.<name>.smtpport;
#      };
#      passwordCommand = "cat ${config.sops.secrets."mail/<passwordName>".path}";
#      thunderbird.enable = true;
#      thunderbird.profiles = [ "default" ];
#    };
# ------------------------------------------------------------------------
{ config, local, ... }:
{
  # appel des secrets sops
  sops.secrets."mail/travail-password" = {
    mode = "0400";
  };
  sops.secrets."mail/proton-password_laptop" = {
    mode = "0400";
  };
  # configuration comptes
  accounts.email.accounts = {
    proton = {
      primary = true;
      address = local.emails.proton.mail;
      userName = local.emails.proton.mail;
      realName = local.fullName;
      imap = {
        host = local.emails.proton.imap;
        port = local.emails.proton.imapport;
        tls.useStartTls = true;
      };
      smtp = {
        host = local.emails.proton.smtp;
        port = local.emails.proton.smtpport;
        tls.useStartTls = true;
      };
      passwordCommand = "cat ${config.sops.secrets."mail/proton-password_laptop".path}";
      thunderbird.enable = true;
      thunderbird.profiles = [ "default" ];
    };

    travail = {
      address = local.emails.travail.mail;
      userName = local.emails.travail.mail;
      realName = local.fullName;
      imap = {
        host = local.emails.travail.smtp;
        port = local.emails.travail.imapport;
      };
      smtp = {
        host = local.emails.travail.smtp;
        port = local.emails.travail.smtpport;
      };
      passwordCommand = "cat ${config.sops.secrets."mail/travail-password".path}";
      thunderbird.enable = true;
      thunderbird.profiles = [ "default" ];
    };

    stage = {
      address = local.emails.stage;
      userName = local.emails.stage;
      realName = local.fullName;
      flavor = "outlook.office365.com";
      imap = {
        host = "outlook.office365.com";
        port = 993;
        tls.enable = true;
        tls.useStartTls = false;
      };
      smtp = {
        host = "smtp.office365.com";
        port = 587;
        tls.enable = true;
        tls.useStartTls = true;
      };
      thunderbird.enable = true;
      thunderbird.profiles = [ "default" ];
    };

    suede = {
      address = local.emails.suede;
      userName = local.emails.suede;
      realName = local.fullName;
      flavor = "outlook.office365.com";
      imap = {
        host = "outlook.office365.com";
        port = 993;
        tls.enable = true;
        tls.useStartTls = false;
      };
      smtp = {
        host = "smtp.office365.com";
        port = 587;
        tls.enable = true;
        tls.useStartTls = true;
      };
      thunderbird.enable = true;
      thunderbird.profiles = [ "default" ];
    };
  };
}
