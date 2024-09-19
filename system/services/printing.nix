{
  config,
  pkgs,
  ...
}: {
  services.printing = {
    enable = true;
    drivers = with pkgs; [
      cups-kyocera-3500-4500
    ];
  };
}
