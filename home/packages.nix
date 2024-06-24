{ pkgs, ... }:

{
  # Environment variables to always set at login.
  # https://nix-community.github.io/home-manager/options.html#opt-home.sessionVariables
  home.sessionVariables = {
    JAVA_HOME = "${pkgs.jdk21}";
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
    "/etc/profiles/per-user/kobza/bin"
  ];

  # The set of packages to appear in the user environment
  # https://nix-community.github.io/home-manager/options.html#opt-home.packages
  home.packages = with pkgs; [
    aws-mfa
    awscli2
    bat
    cachix # to store cache binaries on cachix.org
    coreutils
    delta
    devenv
    direnv
    fd
    fzf
    go
    htop
    httpie
    jdk21
    jq
    lazydocker
    lazygit
    neovim
    nix-prefetch-git # to get git signatures for fetchFromGit
    nixpkgs-fmt
    nodejs_20
    postgresql
    ripgrep
    tig
    watch
    wget
    zoxide
  ];
}
