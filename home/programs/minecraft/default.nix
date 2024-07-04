{
  inputs,
  pkgs,
  ...
}: {
  home.packages = [
    inputs.prism.packages.${pkgs.system}.prismlauncher
  ];
}
