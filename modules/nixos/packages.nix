{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    zoxide
    helix
    jq
    ripgrep
    starship
    unzip
    git
    coreutils
    nushell
  ];

  environment.variables = {
    EDITOR = "hx";
    VISUAL = "hx";
  };
}
