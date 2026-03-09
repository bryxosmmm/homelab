{ ... }:
{
  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    recommendedGzipSettings = true;

    virtualHosts."homelab" = {
      locations."/" = {
        proxyPass = "http://127.0.0.1:8082/";
        proxyWebsockets = true;
      };
    };

    virtualHosts."forge.extremepeace.space" = {
      locations."/" = {
        proxyPass = "http://127.0.0.1:3000/";
        proxyWebsockets = true;
      };
    };
  };
}
