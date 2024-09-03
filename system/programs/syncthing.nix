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
          "digglydoo" = {id = "DEVICE-ID-GOES-HERE";};
          "pessima" = {id = "UD43H26-MEFFACM-UKIQBNC-VYYBEGP-XHQ2T2S-EPYCNTF-IT4NNJW-SJGXBQD";};
        };
        folders = {
          "Documents" = {
            # Folder ID in Syncthing, also the name of folder (label) by default
            path = "/home/myusername/Documents"; # Which folder to add to Syncthing
            devices = ["device1" "device2"]; # Which devices to share the folder with
          };
          "Example" = {
            label = "Private"; # Optional label for the folder
            path = "/home/myusername/Example";
            devices = ["device1"];
            ignorePerms = false; # By default, Syncthing doesn't sync file permissions. This line enables it for this folder.
          };
        };
      };
    };
  };
}
