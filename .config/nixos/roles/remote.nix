{ config, pkgs, ... }:

{
  services.openssh.enable = true;

  services.openssh.challengeResponseAuthentication = false;
  services.openssh.passwordAuthentication = false;
  services.openssh.permitRootLogin = "no";
}