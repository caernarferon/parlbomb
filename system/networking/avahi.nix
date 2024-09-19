{
  # network discovery, mDNS
  services.avahi = {
    openFirewall = true;
    enable = true;
    nssmdns4 = true;
    publish = {
      enable = true;
      domain = true;
      userServices = true;
    };
  };
}
