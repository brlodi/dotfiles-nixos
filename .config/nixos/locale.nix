{ config, pkgs, ... }:

{
  console.useXkbConfig = true;
  i18n.defaultLocale = "en_US.UTF-8";
  services.xserver.layout = "us";
}
