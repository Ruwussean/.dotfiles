{
  description = "Entrypoint flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
  let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
        rocmSupport = true;
      };
    };

  in {
    nixosConfigurations = {
      robby-nixos = lib.nixosSystem {
        inherit system;

        modules = [
          ./system/configuration.nix
          ./system/services
        ];
      };
    };

    homeConfigurations = {
      robby = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          ./user/home.nix
        ];

        extraSpecialArgs = {
          inherit inputs;
          inherit system;
        };
      };
    };
  };
}
