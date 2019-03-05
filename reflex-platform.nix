# Pin version of nixpkgs to ensure build reproduceability
import ((import <nixpkgs> {}).fetchFromGitHub {
  owner = "reflex-frp";
  repo = "reflex-platform";
  rev = "d5b662e220a73e9d711aff0133265b6aafda89d8";
  sha256  = "1ri7khnxid8365s3vkgyny5ncgk1as86fjyznx3qj157mxgh3f3n";
})
