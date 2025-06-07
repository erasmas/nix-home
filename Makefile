.PHONY: build switch

build:
	sudo nix build .#darwinConfigurations.kobza.system

switch: build
	sudo nix run nix-darwin -- switch --flake .#kobza

nix-fmt:
	fd nix | xargs nixpkgs-fmt
