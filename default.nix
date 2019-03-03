{ minimize ? false }:
let
  reflex-platform = import ./reflex-platform.nix {};
in reflex-platform.project ({ pkgs, ... }: {
  packages = {
    app-front = ./app-front;
    app-back = ./app-back;
  };
  shells = {
    ghcjs = ["app-front"];
    ghc = ["app-back"];
  };
  overrides = import ./overrides.nix { inherit reflex-platform minimize; };
})
