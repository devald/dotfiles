{
  description = "Dévald NixOS flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        thinkpad-x13 = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ ./hosts/thinkpad-x13/configuration.nix ];
        };
        minipc = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ ./hosts/minipc/configuration.nix ];
        };
        usb-stick = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ ./hosts/usb-stick/configuration.nix ];
        };
      };
      homeConfigurations = {
        devald = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home-manager/home.nix ];
        };
      };
    };
}
