{ pkgs, ... }:

{
  imports = [ 
    ./btop
    ./vscode.nix
  ];

  programs.git.enable = true;

  programs.fish.enable = true;

  home.packages = [
    pkgs.nano	
  ];

}
