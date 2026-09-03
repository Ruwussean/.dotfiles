{
  description = "Entrypoint flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:omarcresp/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
      };
    };

  in {
    nixosConfigurations = {
      robby-nixos = lib.nixosSystem {
        inherit system;

        modules = [
          ./system/configuration.nix
          ./system/services/
        ];
      };
    };

    homeConfiguration = {
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