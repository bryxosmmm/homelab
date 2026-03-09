{ pkgs, ... }:
{

  security.sudo.enable = true;
  users.users.scooby = {
    shell = pkgs.nushell;
    isNormalUser = true;
    description = "scooby";
    extraGroups = [
      "networkmanager"
      "podman"
      "wheel"
    ];
  };
}
