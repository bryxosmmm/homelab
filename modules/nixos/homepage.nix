{ ... }:
{
  services.homepage-dashboard = {
    enable = true;
    listenPort = 8082;

    # Access through nginx vhost "homelab".
    allowedHosts = "homelab,localhost:8082,127.0.0.1:8082";

    settings = {
      title = "Homelab";
    };

    widgets = [
      {
        resources = {
          cpu = true;
          memory = true;
          disk = "/";
        };
      }
      {
        search = {
          provider = "duckduckgo";
          target = "_blank";
        };
      }
    ];

    services = [
      {
        Infrastructure = [
          {
            Forgejo = {
              description = "Git hosting";
              href = "https://forge.extremepeace.space/";
              icon = "forgejo";
            };
          }
        ];
      }
    ];
  };
}
