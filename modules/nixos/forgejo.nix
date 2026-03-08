{ lib, ... }:
{
  services.forgejo = {
    enable = true;

    database.type = "postgres";
    database.name = "forgejo";

    # Hardening settings
    settings = {
      server = {
        DOMAIN = "homelab";
        ROOT_URL = "http://homelab/forge/";
        HTTP_ADDR = "127.0.0.1";
        HTTP_PORT = 3000;
        ENABLE_GZIP = true;
      };

      # security = {
      #   INSTALL_LOCK = true; # Disable initial setup wizard
      #   LOGIN_REMEMBER_DAYS = 7; # Short sessions
      #   PASSWORD_COMPLEXITY = "high:8"; # Strong passwords
      #   CSRF_TOKEN_SAMESITE = "Strict";
      # };

      # Disable risky features
      actions.ENABLED = lib.mkForce false; # CI/CD = high risk if public
      packages.ENABLED = false;

      # Rate limiting
      rate_limit = {
        ENABLED = true;
        LOGIN_TRIES = 5;
        LOGIN_TRY_WINDOW = "1h";
      };
    };
  };
}
