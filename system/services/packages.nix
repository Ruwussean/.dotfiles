#options/system.nix

{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    catppuccin-sddm-corners
    git
    wget
    curl
    bash
    vim
  ];
}
