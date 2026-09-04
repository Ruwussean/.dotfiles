{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    profiles = {
      default = {
        extensions = with pkgs.vscode-extensions; [
          ms-python.python
        ];
      };
    };
  };

  programs.git.enable = true;

  programs.fish.enable = true;

  home.packages = [
    nano	
  ];

}
