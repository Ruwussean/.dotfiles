{ ... }:

{
  imports = [
    ./chat.nix
  ];

  home.packages = with pkgs; [
    vlc
  ];
}