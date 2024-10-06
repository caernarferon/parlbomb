{
  description = "my computers";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nh = {
      url = "github:viperml/nh";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
    pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
  in {
    formatter.x86_64-linux = pkgs.alejandra;
    nixosConfigurations = {
      ideapad5 = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./hosts/ideapad5
        ];
      };
    };
    homeConfigurations = {
      "sohamp@ideapad5" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
        extraSpecialArgs = {inherit inputs outputs;};
        # > Our main home-manager configuration file <
        modules = [
          ./home/homes/ideapad5
        ];
      };
    };
  };
}
