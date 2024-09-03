{config, ...}: {
  services = {
    syncthing = {
      enable = true;
      user = "parliamentbomber";
      dataDir = "/home/parliamentbomber/Documents";
      configDir = "/home/parliamentbomber/.config/syncthing";
      overrideDevices = true; # overrides any devices added or deleted through the WebUI
      overrideFolders = true; # overrides any folders added or deleted through the WebUI
      settings = {
        devices = {
          "digglydoo" = {id = "XYZH56F-4UJZZDE-H5XT3DW-TGZ35Z2-6P237WU-D2A7A4Y-2HAGVEE-PCE5NQ4";};
          "pessima" = {id = "UD43H26-MEFFACM-UKIQBNC-VYYBEGP-XHQ2T2S-EPYCNTF-IT4NNJW-SJGXBQD";};
        };
        folders = {
          "Documents" = {
            path = "/home/parliamentbomber/Documents";
            devices = ["digglydoo" "pessima"];
          };
        };
      };
    };
  };
}
