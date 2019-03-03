# Pin version of nixpkgs to ensure build reproduceability
import ((import <nixpkgs> {}).fetchFromGitHub {
  owner = "reflex-frp";
  repo = "reflex-platform";
  rev = "ca2dc8a7768abbcdf3edd3ede9c359144c84dd3f";
  sha256  = "0zqg9fq7bnl1zr673ij73cd0z95w38qp9i1r7gjc1f5zi8gmpwhx";
})
