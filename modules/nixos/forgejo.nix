{ lib, ... }:
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

      # Disable risky features
      actions.ENABLED = lib.mkForce false; # CI/CD = high risk if public
      packages.ENABLED = false;

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
}
