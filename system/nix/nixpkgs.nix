{self, ...}: {
  nixpkgs = {
    overlays = [
      (import ../../overlays/default.nix)
    ];
    config.allowUnfree = true;
    config.allowUnfreePredicate = _: true;

    config.permittedInsecurePackages = [
      "electron-25.9.0"
    ];
  };
}
