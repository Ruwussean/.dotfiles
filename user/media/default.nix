{ pkgs, ... }:

{
  imports = [
    ./chat.nix
    ./duckstation.nix
  ];

  home.packages = with pkgs; [
    vlc
  ];
}
