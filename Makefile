.PHONY: build switch

build:
	nix build .#darwinConfigurations.kobza.system --impure

switch: build
	nix run nix-darwin -- switch --flake .#kobza --impure
