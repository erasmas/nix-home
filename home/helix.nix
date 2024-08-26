{ pkgs, ... }:

{
  programs.helix = {
    enable = true;

    settings = {
      keys.normal = {
        space.space = "file_picker";
        space.w = ":w";
        space.q = ":q";
      };

      editor.cursor-shape = { insert = "bar"; };
    };

    languages = {

      language-server.pylsp = {
        command = "${pkgs.python312Packages.python-lsp-server}/bin/pylsp";
        args = [ "--stdio" ];
      };

      language-server.nil = {
        command = "${pkgs.nil}/bin/nil";
        args = [ "--stdio" ];
      };

      language-server.pyright = { command = "${pkgs.pyright}/bin/pyright"; };

      language-server.typescript-lsp = {
        command =
          "${pkgs.nodePackages.typescript-language-server}/bin/typescript-language-server";
        args = [
          "--stdio"
          "--tsserver-path=${pkgs.typescript}/lib/node_modules/typescript/lib"
        ];
      };

      language = [
        {
          name = "nix";
          auto-format = true;
          formatter.command = "${pkgs.nixfmt-classic}/bin/nixfmt";
        }
        {
          name = "python";
          language-servers = [ "pyright" ];
          formatter = {
            command = "${pkgs.ruff}/bin/ruff";
            args = [ "format" ];
          };
        }
        {
          name = "typescript";
          language-servers = [ "typescript-lsp" ];
          formatter = {
            command = "${pkgs.nodePackages.prettier}/bin/prettier";
          };
        }
      ];
    };
  };
}
