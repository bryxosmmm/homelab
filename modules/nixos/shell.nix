{ pkgs, ... }:
{
  programs.bash.interactiveShellInit = ''
    if [[ $TERM != "dumb" ]]; then
      exec ${pkgs.nushell}/bin/nu "$@"
    fi
  '';
}
