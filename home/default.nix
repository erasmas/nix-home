{ pkgs, ... }:

{
  # https://nix-community.github.io/home-manager/index.html#sec-usage-configuration
  #
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.

  # https://nix-community.github.io/home-manager/options.html#opt-home.stateVersion
  home.stateVersion = "24.05";

  # Let Home Manager install and manage itself.
  # https://nix-community.github.io/home-manager/options.html#opt-programs.home-manager.enable
  programs.home-manager.enable = true;

  programs.fish = {
    enable = true;

    shellInit = builtins.readFile ../assets/config/fish/init.fish;

    functions = {
      songwhip = builtins.readFile ../assets/config/fish/functions/songwhip.fish;
    };

    plugins = [
      {
        name = "fzf.fish";
        src = pkgs.fetchFromGitHub {
          owner = "PatrickF1";
          repo = "fzf.fish";
          rev = "8920367";
          sha256 = "T8KYLA/r/gOKvAivKRoeqIwE2pINlxFQtZJHpOy9GMM=";
        };
      }
    ];
  };

  imports = [
    ./assets.nix
    ./git.nix
    ./packages.nix
  ];
}
