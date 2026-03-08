{ lib, options, ... }:
{
  imports = [
    ../../profiles/base-server.nix
    ./hardware.nix
  ];

  config = {
    networking.hostName = "nixos";
  }
  // lib.optionalAttrs (options ? deployment) {
    deployment = {
      targetHost = "homelab";
      targetUser = "root";
      buildOnTarget = true;
    };
  };
}
