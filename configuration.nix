{ pkgs, lib, ... }:
{
  # Make sure the nix daemon always runs
  # Without this configuration, the switch command won't work due to this error:
  # error: The daemon is not enabled but this is a multi-user install, aborting activation
  services.nix-daemon.enable = true;

  # Configure extra options: https://nix-community.github.io/home-manager/options.html#opt-nix.extraOptions
  # `auto-optimise-store` | Storage optimization: https://nixos.wiki/wiki/Storage_optimization
  # `experimental-features` | Enable flakes permanently: https://nixos.wiki/wiki/Flakes#Permanent
  # `extra-nix-path` | Temporary fix for `nix-shell`: https://github.com/DeterminateSystems/nix-installer/pull/270
  nix.extraOptions = ''
    auto-optimise-store = true
    experimental-features = nix-command flakes
    extra-nix-path = nixpkgs=flake:nixpkgs
  '';

  # Add trusted substituters
  # I grabbed the public key from https://app.cachix.org/cache/kobza#pull
  # Example: https://github.com/LnL7/nix-darwin/blob/0e6857fa1d632637488666c08e7b02c08e3178f8/modules/examples/lnl.nix#L97-L98
  # nix.settings.trusted-public-keys = [ "kobza.cachix.org-1:BN70psyYfOc8wFoWbRhJo8C40bSejomRRci0BaNhCLE=" ];
  # nix.settings.trusted-substituters = [ https://kobza.cachix.org ];

  # macOS system defaults configuration
  # https://daiderd.com/nix-darwin/manual/index.html#opt-system.defaults.dock.autohide
  system.defaults.dock.autohide = true;

  # Keyboard mapping
  # https://daiderd.com/nix-darwin/manual/index.html#opt-system.keyboard.enableKeyMapping
  # system.keyboard.enableKeyMapping = true;
  # https://daiderd.com/nix-darwin/manual/index.html#opt-system.keyboard.remapCapsLockToEscape
  # system.keyboard.remapCapsLockToEscape = true;

  # Explicitly set the home directory for the user.
  # https://github.com/nix-community/home-manager/issues/4026#issuecomment-1565487545
  # https://github.com/nix-community/home-manager/issues/4026#issuecomment-1565974702
  # https://daiderd.com/nix-darwin/manual/index.html#opt-users.users._name_.home
  users.users.kobza.home = "/Users/kobza";

  networking.hostName = "akira";

  fonts.packages = with pkgs; [
    # https://nixos.wiki/wiki/Fonts    
    # Include selected fonts from https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts
    (nerdfonts.override { fonts = [ "Iosevka" "JetBrainsMono" ]; })
  ];

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "terraform"
    ];

}
