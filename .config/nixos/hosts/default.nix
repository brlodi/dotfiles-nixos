{ lib, nixpkgs, ... }:

let
  system-amd64 = "x86_64-linux";
  system-aarch64 = "aarch64-linux";

  pkgs = {
    amd64 = import nixpkgs {
      system = system-amd64;
      config.allowUnfree = true;
    };
    aarch64 = import nixpkgs {
      system = system-aarch64;
      config.allowUnfree = true;
    };
  };
in
{
  vbox = lib.nixosSystem {
    system = system-amd64;
    pkgs = pkgs.amd64;
    modules = [
      ../roles/virtualbox-guest.nix
      ../roles/console.nix
      ../roles/remote.nix
      ../users/brlodi.nix
    ];
  };
  fornost = lib.nixosSystem {
    system = system-amd64;
    pkgs = pkgs.amd64;
    modules = [
      { boot.kernelPackages = pkgs.linuxPackages_zen; }
      ../roles/console.nix
      ../roles/remote.nix
      ../users/brlodi.nix
    ];
  };
  samwise = lib.nixosSystem {
    system = system-aarch64;
    pkgs = pkgs.amd64;
    modules = [
      ../roles/console.nix
      ../roles/remote.nix
      ../users/brlodi.nix
      ../users/homehub.nox
    ];
  };
}
