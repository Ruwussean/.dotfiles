#home-manager/home.nix

{ pkgs, inputs, ... }: 

{

  imports = [
    ./media
    ./utils

    inputs.zen-browser.homeModules.beta

  ];
  programs.home-manager.enable = true;
  programs.fastfetch.enable = true;

  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;
  };

  home = {
    
    stateVersion = "26.05";
    username = "robby";
    homeDirectory = "/home/robby";
    packages = with pkgs; [
      firefox
      lutris
      mangohud
    ];
  };
}
