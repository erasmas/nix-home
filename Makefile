.PHONY: build switch

build:
	nix build .#darwinConfigurations.kobza.system

switch: build
	nix run nix-darwin -- switch --flake .#kobza
