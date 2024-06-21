{ pkgs, ... }:

{
  # Environment variables to always set at login.
  # https://nix-community.github.io/home-manager/options.html#opt-home.sessionVariables
  home.sessionVariables = {
  };

  # Extra directories to add to $PATH
  # https://nix-community.github.io/home-manager/options.html#opt-home.sessionPath
  home.sessionPath = [
    # home-manager per-user profile
    # This is supposed to be set automatically by the home-manager.useUserPackages flag
    # However, it doesn't seem to be working for me
    # Therefore, I'm adding it manually
    # https://nix-community.github.io/home-manager/index.xhtml#sec-flakes-nix-darwin-module
    # FIXME: Remove this once the issue is fixed
    # "/etc/profiles/per-user/kobza/bin"
  ];

  # The set of packages to appear in the user environment
  # https://nix-community.github.io/home-manager/options.html#opt-home.packages
  home.packages = with pkgs; [
    # Nix Formatter being used by VS Code
    # https://discourse.nixos.org/t/error-with-integration-with-vscode/20848/2
    nixpkgs-fmt

    ##################################
    # Nix-related packages
    ##################################
    cachix # to store cache binaries on cachix.org
    nix-prefetch-git # to get git signatures for fetchFromGit

    ##################################
    # Containerization
    ##################################

    ##################################
    # Languages
    ##################################

    ##################################
    # Utilities
    ##################################
    neovim
    jq # JSON in shell
  ];
}
