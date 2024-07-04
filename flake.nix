{
  description = "my computers";

  inputs = {
    nix-topology.url = "github:oddlama/nix-topology";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "git+https://github.com/hyprwm/hyprland?submodules=1";
    };
    split-monitor-workspaces = {
      url = "github:Duckonaut/split-monitor-workspaces";
      inputs.hyprland.follows = "hyprland"; # <- make sure this line is present for the plugin to work as intended
    };
    nh = {
      url = "github:viperml/nh";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify = {
      url = "github:the-argus/spicetify-nix";
    };
    shadower = {
      url = "github:n3oney/shadower";
    };
    walker = {
      url = "github:abenz1267/walker";
    };
    matugen = {
      url = "github:InioX/matugen/module";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    prism = {
      url = "github:prismlauncher/prismlauncher";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    hyprland,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
  in {
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;
    nixosConfigurations = {
      digglydoo = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        # > Our main nixos configuration file <
        modules = [
          ./hosts/digglydoo
        ];
      };
    };

    # Standalone home-manager configuration entrypoint
    # Available through 'home-manager --flake .#your-username@your-hostname'
    homeConfigurations = {
      "parliamentbomber" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
        extraSpecialArgs = {inherit inputs outputs;};
        # > Our main home-manager configuration file <
        modules = [
          ./home/homes/digglydoo
          inputs.hyprland.homeManagerModules.default
        ];
      };
    };
  };
}
