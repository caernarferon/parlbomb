{
  pkgs,
  inputs,
  ...
}: {
  # nh default flake
  environment.variables.FLAKE = "/home/parliamentbomber/caernixeron";

  programs.nh = {
    enable = true;
    package = inputs.nh.packages.${pkgs.system}.default;

    clean = {
      enable = true;
      extraArgs = "--keep-since 30d";
    };
  };
}
