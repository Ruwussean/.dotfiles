{ config, pkgs, ... }:

{
  users.users.robby = {
    isNormalUser = true;
    description = "Robby";
    extraGroups = [
      "wheel"
      "networkmanager"
      "audio"
      "video"
    ];

    shell = pkgs.fish;
    packages = [
      pkgs.fish
    ];

  };
}

