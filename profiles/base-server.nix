{ ... }:
{
  imports = [
    ../modules/nixos/locale.nix
    ../modules/nixos/tailscale.nix
    # ../modules/nixos/cloudflared.nix
    ../modules/nixos/shell.nix
    ../modules/nixos/users.nix
    ../modules/nixos/packages.nix
    ../modules/nixos/postgresql.nix
    ../modules/nixos/forgejo.nix
    ../modules/nixos/homepage.nix
    ../modules/nixos/nginx.nix
  ];

  networking.networkmanager.enable = true;
  networking.firewall.allowedTCPPorts = [
    80
    443
  ];
  services.openssh.enable = true;

  security.acme = {
    acceptTerms = true;
    defaults.email = "hostmaster@extremepeace.space";
  };

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
