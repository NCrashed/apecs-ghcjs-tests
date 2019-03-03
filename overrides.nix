# Here you can put overrides of dependencies
{ reflex-platform ? (import ./reflex-platform.nix {}), minimize ? false, ... }:
let
  pkgs = reflex-platform.nixpkgs;
  overrideCabal = pkgs.haskell.lib.overrideCabal;
  dontCheck = pkgs.haskell.lib.dontCheck;
  optimizeGhcjs = drv: overrideCabal drv (drv: { buildFlags = (drv.buildFlags or []) ++ ["--ghcjs-option=-O2 " "--ghcjs-option=-dedupe"]; });
  statics = ./app-front/statics;
  runClosureCompiler = drv: pkgs.haskell.lib.overrideCabal drv (drv: {
    postFixup = ''
      cd $out/bin/app-front.jsexe
      ${pkgs.closurecompiler}/bin/closure-compiler all.js --compilation_level=ADVANCED_OPTIMIZATIONS \
        --externs=all.js.externs \
        --jscomp_off=duplicate \
        --jscomp_off=undefinedVars \
        --jscomp_off=externsValidation \
        > all.min.js
        ${pkgs.zopfli}/bin/zopfli -i1000 all.min.js
        '';
  });
  prodOverride = drv: if minimize then runClosureCompiler (optimizeGhcjs drv) else drv;
in (self: super: let
  # Overrides from cabal2nix files
  derivationsOverrides = pkgs.haskell.lib.packagesFromDirectory { directory = ./derivations; } self super;
  in derivationsOverrides // {
    app-front = prodOverride super.app-front;
    http-date = dontCheck super.http-date;
    iproute = dontCheck super.iproute;
    Glob = dontCheck super.Glob;
    http2 = dontCheck super.http2;
    bsb-http-chunked = dontCheck super.bsb-http-chunked;
    reflex-dom-core = dontCheck super.reflex-dom-core;
  }
)
