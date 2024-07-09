{
  pkgs,
  inputs,
  osConfig,
  ...
}: {
  imports = [
    inputs.walker.homeManagerModules.default
  ];
  programs.walker = {
    enable = true;
    runAsService = true;
    config = {
      placeholder = "Search ...";
      fullscreen = false;
      list = {
        height = 200;
      };
      modules = [
        {
          name = "applications";
          prefix = "";
        }
        {
          name = "runner";
          prefix = "$";
        }
        {
          name = "websearch";
          prefix = "?";
        }
        {
          name = "switcher";
          prefix = "/";
        }
        {
          name = "finder";
          prefix = "~";
        }
      ];
    };
  };
}
