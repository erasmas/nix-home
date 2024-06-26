{ config, ... }:
let
  # Make symlink from source out of Nix stores
  inherit (config.lib.file) mkOutOfStoreSymlink;

  # Local nixpkgs working directory
  # FIXME: Find a way to access the home directory without hardcoding it
  # Because we will need it once we want to serve WSL system
  nixConfigDirectory = "/Users/kobza/Dev/nix-home/assets/config";
in
{

  xdg.configFile."nvim" = {
    source = "${nixConfigDirectory}/nvim";
    recursive = true;
  };

  xdg.configFile."wezterm" = {
    source = "${nixConfigDirectory}/wezterm";
    recursive = true;
  };

  xdg.configFile."karabiner" = {
    source = "${nixConfigDirectory}/karabiner";
    recursive = true;
  };
}
