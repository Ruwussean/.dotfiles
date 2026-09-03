#home-manager/home.nix

{ pkgs, inputs, ... }: 

let
  zenBrowser = inputs.zen-browser.packages."${pkgs.system}".specific;
in {
  home.stateVersion = "25.05";

  programs.neofetch.enable = true;
  programs.git.enable = true;

  home.packages = with pkgs; [
    firefox
    btop
    lutris
    mangohud
    zen-browser
  ];

  imports = [
    ./media
    ./utils
  ];
}