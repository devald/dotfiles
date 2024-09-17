{
  description = "Dévald NixOS flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/Brewfile-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ ./configuration.nix ];
        };
        zfsIso = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ ./usb-stick.nix ];
        };
      };
      homeConfigurations = {
        devald = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home.nix ];
        };
        macbook = home-manager.lib.homeManagerConfiguration {
          # inherit pkgs;
          pkgs = nixpkgs.legacyPackages.aarch64-darwin;
          modules = [ ./darwin.nix ];
        };
      };
    };
}
