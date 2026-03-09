{ ... }:
{
  services.nginx = {
    enable = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
    recommendedGzipSettings = true;

    virtualHosts."homelab" = {
      locations."/" = {
        proxyPass = "http://127.0.0.1:8082/";
        proxyWebsockets = true;
      };
    };

    virtualHosts."forge.extremepeace.space" = {
      enableACME = true;
      forceSSL = true;
      extraConfig = ''
        client_max_body_size 512M;
        add_header X-Content-Type-Options "nosniff" always;
        add_header X-Frame-Options "SAMEORIGIN" always;
        add_header Referrer-Policy "strict-origin-when-cross-origin" always;
      '';
      locations."/" = {
        proxyPass = "http://127.0.0.1:3000/";
        proxyWebsockets = true;
      };
    };
  };
}
