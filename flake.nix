{
  description = "8ruken dev env";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      fenix,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        commonPkgs = with pkgs; [
          git
          nixfmt
        ];
        toolchain = fenix.packages.${system}.fromToolchainFile {
          dir = ./.;
          sha256 = "sha256-SBKjxhC6zHTu0SyJwxLlQHItzMzYZ71VCWQC2hOzpRY=";
        };
      in
      {
        devShells = {
          default = pkgs.mkShell {
            packages = commonPkgs;
          };
          rust = pkgs.mkShell {
            packages = commonPkgs ++ [
              toolchain
              fenix.packages.${system}.rust-analyzer
            ];
          };
          python = pkgs.mkShell {
            packages =
              commonPkgs
              ++ (with pkgs; [
                python3
                python3Packages.pip
                python3Packages.virtualenv
              ]);
          };
          node = pkgs.mkShell {
            packages =
              commonPkgs
              ++ (with pkgs; [
                nodejs_20
                pnpm
              ]);
          };
        };
      }
    );
}
