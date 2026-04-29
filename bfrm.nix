{ config, pkgs, ... }: {
  imports = [
    <nixpkgs/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix>
  ];

  services.xserver = {
    enable = true;
    displayManager.lightdm.enable = true;
    windowManager.fluxbox.enable = true;
  };

  environment.systemPackages = with pkgs; [
    fluxbox
    rxvt-unicode
    firefox-esr
    nmap
    gparted
    testdisk
    smartmontools
    btop
    pciutils
    usbutils
  ];

  services.displayManager.autoLogin = {
    enable = true;
    user = "nixos";
  };

  networking.networkmanager.enable = true;
  networking.wireless.enable = false;
}
