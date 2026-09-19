{ nixpkgs, pkgs, config, ... }:

let
  duckstation = pkgs.appimageTools.wrapType2 rec {
    pname = "duckstation";
    version = "1.0.0";

    src = pkgs.fetchurl {
      url = "https://github.com/stenzek/duckstation/releases/download/latest/DuckStation-x64.AppImage";
      hash = "sha256:c2fd26257ac5cfefe4f77b61b04b8fe299f9c4e0cf6b851fc5259c815979466a";
       
    };

    extraInstallCommands =
      let
        contents = pkgs.appimageTools.extract {
          inherit pname version src;
        };
      in
      ''
        install -m 444 -D \
          ${contents}/duckstation.desktop \
          $out/share/applications/duckstation.desktop

        install -m 444 -D \
          ${contents}/duckstation.png \
          $out/share/icons/hicolor/512x512/apps/duckstation.png
      '';
  };
in

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
    duckstation

  ];

}

