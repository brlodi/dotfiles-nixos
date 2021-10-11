{ config, pkgs, ... }:

let
  backgroundImage = pkgs.fetchurl {
    url = "https://unsplash.com/photos/cPa-7yByq3o/download?force=true&w=1920";
    name = "unsplash-cPa-7yByq3o.1920w.jpg";
    sha256 = "a3554fad4141096e4408efa51b38d61e8960c9331b9ae053558e6588b40fd947";
  };
in
{
  services.xserver = {
    enable = true;
    resolutions = [
      { "x" = 1920; "y" = 1080; }
      { "x" = 1920; "y" = 1200; }
    ];

    displayManager.defaultSession = "none+awesome";
    displayManager.lightdm.enable = true;
    displayManager.lightdm.background = backgroundImage;
    displayManager.lightdm.greeters.mini.enable = true;
    displayManager.lightdm.greeters.mini.user = "brlodi";
    displayManager.lightdm.greeters.mini.extraConfig =
      ''
        [greeter]
        password-label-text = password  
        invalid-password-text = try again
        password-alignment = left
        password-input-width = 16
        
        [greeter-theme]
        font = "Sans"
        font-size = 16px
        font-weight = normal
        password-character = ⚹
        
        background-color = "#000000"
        window-color = "#393939"
        border-color = "#2d2d2d"
        text-color = "#d3d0c8"
        error-color = "#f2777a"
        password-color = "#f2f0ec"
        password-background-color = "#2d2d2d"
        password-border-color = "#2d2d2d"
        
        border-width = 0
        password-border-width = 0
        password-border-radius = 0
      '';

    desktopManager.xterm.enable = false;

    windowManager.awesome.enable = true;
  };
}
