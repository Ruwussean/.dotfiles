#/etc/nixos/configuration.nix

{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./services
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "26.05";
}
