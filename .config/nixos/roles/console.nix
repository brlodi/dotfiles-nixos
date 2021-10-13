{ config, pkgs, ... }:

{
  console.packages = with pkgs; [ tamsyn ];

  console.earlySetup = true;
  console.font = "Tamsyn10x20r";
}
