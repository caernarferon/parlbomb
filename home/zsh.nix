{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  programs = {
    starship.enable = true;
    zsh = {
      enable = true;
      defaultKeymap = "emacs";
      shellAliases = {
        rm = "rm -i";
      };
      syntaxHighlighting.enable = true;
      autosuggestion.enable = true;
    };
  };
}
