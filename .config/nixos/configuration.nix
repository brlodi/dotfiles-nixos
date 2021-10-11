{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware.nix
      ./locale.nix
      ./desktop.nix
      ./vscodium.nix
    ];

  nix = {
    autoOptimiseStore = true;
    allowedUsers = [ "brlodi" ];
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

  console.earlySetup = true;
  console.font = "Tamsyn10x20r";
  console.packages = with pkgs; [ tamsyn ];

  environment.shellAliases = {
    dotfiles = "git --git-dir=$HOME/.dotfiles --work-tree=$HOME";
  };

  time.timeZone = "America/New_York";

  users.users.brlodi = {
    isNormalUser = true;
    description = "Benjamin Lodi";
    group = "brlodi"; # NixOS doesn't use user-private groups by default.
    extraGroups = [
      "users" # Put user back in NixOS's default "users" group after above change.
      "wheel" # Enable 'sudo'
    ];
    shell = pkgs.fish;
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCpWkF6NUU6YcioNdSElCPeNcqV+GY0M1D+Q9j1z2qcHrIesrtkpfMmE5hgyQg/U9r063X20P6Syr4q/NxwGCUicchwNBWcr/kwuSkIztt07LF50vO0qpKb07Dn/17MyuWUTdC07DygfT1ayr+U4msFdqB/NkmWYKATeuZRnVfyPmDm4oJ/Mh//UeIkX70NCplNFC6CazMyW7HZth57OjZxvgTiAJPTB9uuzn73niNAXT5NiOniMgCkvuOUJyLDVRk8vamdAMI6GyrWa/cGTIA+IfCUUv0PBul0jMDxv2zCjbDBo2gspRgpz1ORduSIFA1g3Sxk27NCsmT11Jx+eXLon/+7WwnFpmkf8QgJ7xS+DY9yzjcAKb0anUPFkCFezTxIH6za2zOW4ymuX+KGUGmUBLsU2kgFVn2rj3hfrQJ7nqNmv7Kh6CX5Ic/4s8NNo0JUImt7GlIZ5TyfvSmXmbT7LmxKXUTj4m2UfVzoOz7DYB47K2JB8B3XvlaOCxc8OFrLbs6/W0FCjiV/VfW5EVGDjacdrnV5Ti7gBOuJDmSkUekdNcemTo1SbwoOHElMWU3uzF/0q3p0mFW0RHe1L+WBVFm3TJJWCI3j2h9L0aEjFmHr0MOR7vwfZI6I9Fl8VV7PcacKBftn55kZVoOLXyGq77TKuXlG5jwGBuDXXDwgVw== brlodi (Benjamin R Lodi)"
    ];
  };
  users.groups.brlodi = { };

  # Use CapsLock as Escape
  services.xserver.xkbOptions = "caps:escape";

  services.openssh.enable = true;
  services.openssh.permitRootLogin = "no";
  services.openssh.challengeResponseAuthentication = false;
  services.openssh.passwordAuthentication = false;

  programs.fish.enable = true;

  environment.systemPackages = with pkgs; [
    chromium
    git
    git-lfs
    nixpkgs-fmt
    tree
    vim
    vscodium
    wget
  ];

  # DO NOT TOUCH
  system.stateVersion = "21.05"; # NO REALLY DO NOT TOUCH
  # DO NOT TOUCH
}
