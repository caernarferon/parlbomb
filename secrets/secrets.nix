let
  digglydoo = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAhpXENqenMfsgiJsO5he3Cwhls9f4RYom6S3n5F/w/2";
  pessima = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDBTYZgIjRNsdWwAAoxPko2oQruL8ABGOTpJUSR0oHPr";
in {
  "syncthing.age".publicKeys = [digglydoo pessima];
}
