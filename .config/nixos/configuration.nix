{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware.nix
      ./roles/console.nix
      ./roles/remote.nix
      ./roles/desktop.nix
      ./users/brlodi.nix
      ./programs/vscodium.nix
    ];

  nix = {
    autoOptimiseStore = true;
    gc = {
      automatic = true;
      dates = "daily";
    };
  };

  # boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot.enable = true;
  };

  networking = {
    hostName = "nixos";
    useDHCP = false;
    interfaces.enp0s3.useDHCP = true;
  };

  environment.shellAliases = {
    dotfiles = "git --git-dir=$HOME/.dotfiles --work-tree=$HOME";
  };

  time.timeZone = "America/New_York";

  programs.fish.enable = true;

  environment.systemPackages = with pkgs; [
    gimp
    git
    git-lfs
    tree
    vim
    wget
  ];

  # DO NOT TOUCH
  system.stateVersion = "21.05"; # NO REALLY DO NOT TOUCH
  # DO NOT TOUCH
}
