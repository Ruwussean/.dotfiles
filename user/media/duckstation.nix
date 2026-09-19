{
  pkgs,
  lib,
  ...
}:

let
  pname = "duckstation";
  version = "0.0.27";

  src = pkgs.fetchurl {
    url = "https://github.com/stenzek/duckstation/releases/download/latest/DuckStation-x64.AppImage";
    sha256 = "sha256:c2fd26257ac5cfefe4f77b61b04b8fe299f9c4e0cf6b851fc5259c815979466a";
  };

  # Extract the AppImage into the nix store.
  extracted = pkgs.appimageTools.extract { inherit pname src version; };

  # FHS env so Electron + bundled libs find a normal /usr/lib style tree.
  fhsEnv = pkgs.buildFHSEnv {
    name = "duckstation-fhs";

    targetPkgs = pkgs: with pkgs; [
      fuse
      glib
      zlib
      libGL
      libxkbcommon
      xorg.libX11
      xorg.libXext
      xorg.libXrender
      xorg.libXi
      xorg.libXcursor
      xorg.libXrandr
      wayland
    ];

    runScript = "${pkgs.appimage-run}/bin/appimage-run ${duckstation}";

  };
in
{
  home.packages = [
    (pkgs.writeShellScriptBin pname ''
      #!/usr/bin/env bash
      exec ${fhsEnv}/bin/duckstation
    '')
  ];

  # Desktop entry so it shows up in app launchers, with the real Jagex icon.
  # (Written directly via home.file because xdg.desktopEntries isn't emitting
  # files in this setup. Icon points at the PNG extracted from the AppImage.)
  home.file.".local/share/applications/duckstation.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Name=duckstation
    Exec=${pname}
    Terminal=false
    Comment=ps1 emulator
    Categories=Game;
    MimeType=x-scheme-handler/rshub;
    StartupWMClass=duckstation
  '';
}