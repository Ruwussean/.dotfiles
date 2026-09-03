{ nixpkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  services.flatpak.enable = true;
  programs.steam.enable = true;
}
