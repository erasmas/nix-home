{ pkgs, ... }:

{
  # Environment variables to always set at login.
  # https://nix-community.github.io/home-manager/options.html#opt-home.sessionVariables
  # home.sessionVariables = { JAVA_HOME = "${pkgs.jdk21}"; };

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
    asdf-vm # to manage multiple Python versions
    aws-mfa
    awscli2
    bat
    bun # JavaScript runtime
    cachix # to store cache binaries on cachix.org
    corepack_22 # to install pnpm
    coreutils
    delta
    devenv
    direnv
    docker
    docker-compose
    fd
    fzf
    go
    htop
    httpie
    jdk21
    jq
    lazydocker
    lazygit
    minikube
    neovim
    nix-prefetch-git # to get git signatures for fetchFromGit
    nixpkgs-fmt
    nodejs_20
    pgcli
    postgresql
    ripgrep
    terraform
    tig
    watch
    wget
    zoxide
  ];
}
