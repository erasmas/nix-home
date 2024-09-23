{ ... }:

{
  # Enable Homebrew
  # Note that enabling this option does not install Homebrew, see the Homebrew website for installation instructions.
  # https://brew.sh/
  # https://daiderd.com/nix-darwin/manual/index.html#opt-homebrew.enable
  homebrew.enable = true;

  # Automatically use the Brewfile that this module generates in the Nix store
  # https://daiderd.com/nix-darwin/manual/index.html#opt-homebrew.global.brewfile
  homebrew.global.brewfile = true;

  # List of Homebrew formulae to install.
  # https://daiderd.com/nix-darwin/manual/index.html#opt-homebrew.brews
  # homebrew.brews = [
  # ];

  # Prefer installing application from the Mac App Store
  #
  # Commented apps suffer continual update issue:
  # https://github.com/malob/nixpkgs/issues/9
  homebrew.masApps = { "Xcode" = 497799835; };

  homebrew.onActivation = {
    # Whether to enable Homebrew to auto-update itself and all formulae during nix-darwin system activation
    autoUpdate = true;
    # This uninstalls all formulae not listed in the generated Brewfile, 
    # and if the formula is a cask, removes all files associated with that cask.
    cleanup = "zap";
    # Whether to enable Homebrew to upgrade outdated formulae and Mac App Store apps
    upgrade = true;
  };

  # List of Homebrew ";to install.
  # https://daiderd.comnix-darwin/manual/index.html#opt-homebrew.casks;
  homebrew.casks = [
    "1password"
    "arc"
    "aws-vpn-client"
    "bambu-studio"
    "iina" # video player
    "karabiner-elements"
    "mos"
    "orbstack"
    "raycast"
    "signal"
    "slack"
    "spotify"
    "steam"
    "tailscale"
    "ticktick"
    "vscodium"
    "wezterm"
    "zoom"
  ];
}
