#hosts/desktop.nix

{ config, pkgs, ... }:

{
  services.desktopManager.plasma6.enable = true;

  services.xserver = { 
    enable = true; 
    desktopManager.plasma6.enable = true;

    xkb = {
      layout = "us";
      variant = "";
    };
  };

  services.displayManager = {
    sddm = {
      enable = true;
      theme = "catppuccin-sddm-corners";
    };
  };
}

