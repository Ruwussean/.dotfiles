{ nixpkgs, pkgs, config, ... }:

{
  nixpkgs.config.allowUnfree = true;
  services.flatpak.enable = true;
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
  };

  environment.systemPackages = with pkgs; [
    rpcs3
    pcsx2

  ];

}

