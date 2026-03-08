{ ... }:
{
  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    recommendedGzipSettings = true;

    virtualHosts."homelab" = {
      locations."= /forge" = {
        return = "302 /forge/";
      };

      locations."/forge/" = {
        proxyPass = "http://127.0.0.1:3000";
        proxyWebsockets = true;
        extraConfig = ''
          proxy_set_header X-Forwarded-Host $host;
          proxy_set_header X-Forwarded-Proto $scheme;
          proxy_set_header X-Forwarded-Prefix /forge;
        '';
      };
    };
  };
}
