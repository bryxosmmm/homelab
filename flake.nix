{
  description = "Modular NixOS homelab configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    { nixpkgs, ... }:
    {
      colmena = {
        meta.nixpkgs = import nixpkgs {
          localSystem.system = "x86_64-linux";
        };

        homeserver = {
          imports = [ ./hosts/homeserver ];
        };
      };
    };
}
