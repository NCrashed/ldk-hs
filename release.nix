let
  nixpkgs = import ./pkgs.nix;
  project = import ((nixpkgs {}).fetchFromGitHub {
    owner = "NCrashed";
    repo = "haskell-nix";
    rev = "eb45250ac342027d92f27fb97949b95dbbe1a689";
    sha256  = "sha256-eG6Bz/XlZqLngCUZGOBjRX7wgpi6TG2BKMeKsPDHWH0=";
  }) { inherit nixpkgs; };
in project {
  compiler = "ghc910";
  packages = {
    lightning-types = ./lightning-types;
  };
  shellTools = pkgs: with pkgs.haskell.packages.ghc910; [
    cabal-install
    haskell-language-server
  ];
}