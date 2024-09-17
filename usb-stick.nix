{ config, pkgs, modulesPath, ... }:
{
  imports = [
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
  ];

  nixpkgs.hostPlatform = "x86_64-linux";

  boot.kernelPackages = config.boot.zfs.package.latestCompatibleLinuxPackages;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = with pkgs; [
    git
  ];
}
