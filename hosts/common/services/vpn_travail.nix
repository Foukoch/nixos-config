{
  config,
  pkgs,
  local,
  ...
}:
{
  sops.secrets."travail_vpn/vpn-username" = {
  };
  sops.secrets."travail_vpn/vpn-password" = {
    mode = "0400";
  };

  environment.systemPackages = [
    (pkgs.writeShellScriptBin "travail-vpn" ''
      ${pkgs.openconnect}/bin/openconnect --protocol=anyconnect \
        --user="$(cat ${config.sops.secrets."travail_vpn/vpn-username".path})" \
        --passwd-on-stdin ${local.vpnName} < ${config.sops.secrets."travail_vpn/vpn-password".path}
    '')
  ];
}
