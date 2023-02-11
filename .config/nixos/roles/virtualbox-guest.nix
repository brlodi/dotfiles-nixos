{ config, pkgs, ... }:

{
  virtualisation.virtualbox.guest.enable = true;
  services.xserver.videoDrivers = [ "vboxvideo" ];
}
