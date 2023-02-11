{ config, pkgs, ... }:

{
  console.packages = with pkgs; [ tamsyn ];

  console.earlySetup = true;
  console.font = "Tamsyn10x20r";

  environment.systemPackages = with pkgs; [
    git
    git-lfs
    tree
    vim
    wget
  ];
}
