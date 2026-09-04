{ pkgs, ... }:
{
  # grub utilisé pour le bootloader
  boot.kernelPackages = pkgs.linuxPackages;
  boot.loader.grub = {
    enable = true;
    device = "nodev";
    efiSupport = true;
    useOSProber = true;
    # nombre de configurations à garder en mémoire
    configurationLimit = 5;
  };
  boot.loader.efi.canTouchEfiVariables = true;
  # affichage logs
  boot = {
    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "udev.log_level=3"
      "rd.udev.log_level=3"
      "rd.systemd.show_status=auto"
    ];
  };

}
