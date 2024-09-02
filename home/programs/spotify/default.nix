{
  inputs,
  pkgs,
  config,
  ...
}: {
  imports = [
    inputs.spicetify.homeManagerModules.default
  ];
  programs.spicetify = let
    spicePkgs = inputs.spicetify.legacyPackages.${pkgs.system};
  in {
    enable = true;
    theme = spicePkgs.themes.text;
    enabledExtensions = with spicePkgs.extensions; [
      adblock
    ];
  };
}
