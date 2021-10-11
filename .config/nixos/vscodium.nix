{ pkgs, ... }:

let
  extensions = with pkgs.vscode-extensions; [
    jnoortheen.nix-ide
  ];
  vscodium-with-extensions = pkgs.vscode-with-extensions.override {
    vscode = pkgs.vscodium;
    vscodeExtensions = extensions;
  };
in {
  environment.systemPackages = [
    vscodium-with-extensions
  ];
}
