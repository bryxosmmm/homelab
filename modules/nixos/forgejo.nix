{ config, lib, pkgs, ... }:
{
  services.forgejo = {
    enable = true;

    database.type = "postgres";
    database.name = "forgejo";

    # Hardening settings
    settings = {
      server = {
        DOMAIN = "forge.extremepeace.space";
        ROOT_URL = "https://forge.extremepeace.space/";
        HTTP_ADDR = "127.0.0.1";
        HTTP_PORT = 3000;
        ENABLE_GZIP = true;
      };

      security = {
        INSTALL_LOCK = true;
        LOGIN_REMEMBER_DAYS = 7;
        GLOBAL_TWO_FACTOR_REQUIREMENT = "admin";
        MIN_PASSWORD_LENGTH = 12;
        PASSWORD_COMPLEXITY = "lower,upper,digit,spec";
        CSRF_COOKIE_HTTP_ONLY = true;
        DISABLE_QUERY_AUTH_TOKEN = true;
      };

      service = {
        DISABLE_REGISTRATION = true;
      };

      openid = {
        ENABLE_OPENID_SIGNIN = false;
        ENABLE_OPENID_SIGNUP = false;
      };

      session = {
        COOKIE_SECURE = true;
      };

      actions.ENABLED = lib.mkForce true;
      packages.ENABLED = true;

      # Rate limiting
      rate_limit = {
        ENABLED = true;
        LOGIN_TRIES = 5;
        LOGIN_TRY_WINDOW = "1h";
      };

      other = {
        SHOW_FOOTER_VERSION = false;
        SHOW_FOOTER_TEMPLATE_LOAD_TIME = false;
      };
    };
  };

  services.gitea-actions-runner = {
    package = pkgs.forgejo-runner;

    instances.homeserver = {
      enable = true;
      name = config.networking.hostName;
      url = "http://127.0.0.1:${toString config.services.forgejo.settings.server.HTTP_PORT}";
      labels = [
        "native:host"
        "ubuntu-latest:docker://ghcr.io/catthehacker/ubuntu:act-latest"
        "ubuntu-24.04:docker://ghcr.io/catthehacker/ubuntu:act-24.04"
      ];

      # The file must contain TOKEN=<runner registration token>.
      tokenFile = "/var/lib/secrets/forgejo-runner.env";
    };
  };
}
