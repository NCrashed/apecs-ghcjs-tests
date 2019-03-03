{ mkDerivation, base, containers, criterion, fetchgit, linear, mtl
, QuickCheck, stdenv, template-haskell, vector
}:
mkDerivation {
  pname = "apecs";
  version = "0.7.2";
  src = fetchgit {
    url = "https://github.com/jonascarpay/apecs.git";
    sha256 = "1csvcvyh02sjvjjmqchn6dy10rpvmlk1p27w5c2b8v6fpc0nxv1f";
    rev = "f079b349d86186a8a1c7b2fddb869a9fc54a8653";
    fetchSubmodules = true;
  };
  postUnpack = "sourceRoot+=/apecs; echo source root reset to $sourceRoot";
  libraryHaskellDepends = [
    base containers mtl template-haskell vector
  ];
  testHaskellDepends = [ base containers linear QuickCheck vector ];
  benchmarkHaskellDepends = [ base criterion linear ];
  doCheck = false;
  homepage = "https://github.com/jonascarpay/apecs#readme";
  description = "Fast Entity-Component-System library for game programming";
  license = stdenv.lib.licenses.bsd3;
}
