#services/networking.nix

{ config, pkgs, ... }:

{
  networking = {
    hostName = "robby-nixos";
    networkmanager.enable = true;
    nameservers = [
      "9.9.9.9"
      "149.112.112.112"
    ];
  };
}
