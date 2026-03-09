{ ... }:
{
  imports = [
    ../modules/nixos/locale.nix
    ../modules/nixos/tailscale.nix
    # ../modules/nixos/cloudflared.nix
    ../modules/nixos/shell.nix
    ../modules/nixos/users.nix
    ../modules/nixos/packages.nix
    ../modules/nixos/podman.nix
    ../modules/nixos/postgresql.nix
    ../modules/nixos/forgejo.nix
    ../modules/nixos/homepage.nix
    ../modules/nixos/nginx.nix
  ];

  networking.networkmanager.enable = true;
  services.openssh.enable = true;

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
