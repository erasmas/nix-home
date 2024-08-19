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
  homebrew.masApps = {
    "Xcode" = 497799835;
  };


  # List of Homebrew casks to install.
  # https://daiderd.com/nix-darwin/manual/index.html#opt-homebrew.casks
  homebrew.casks = [
    "1password"
    "arc"
    "bambu-studio"
    "karabiner-elements"
    "mos"
    "raycast"
    "slack"
    "wezterm"
    "zoom"
    "signal"
    "steam"
    "spotify"
    "ticktick"
    "vscodium"
  ];
}
