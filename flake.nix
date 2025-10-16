{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      grammars = with pkgs.vimPlugins; [
        (nvim-treesitter.withPlugins (_: nvim-treesitter.allGrammars))
      ];
      dependencies = with pkgs; [
        # tools
        ripgrep
        fantomas
        yazi
        # language servers
        lua-language-server
        nil
        pyright
        rust-analyzer
        fsautocomplete
      ];
      start =
        with pkgs.vimPlugins;
        [
          mini-nvim
          yazi-nvim
          gitsigns-nvim
          catppuccin-nvim
          Ionide-vim
        ]
        ++ grammars;
      opt = [ ];
      prelude = builtins.concatStringsSep "\n" (map (x: "vim.opt.runtimepath:append(',${x}')") grammars);
      customLuaRC = ''
        ${prelude}
        ${builtins.readFile ./config/init.lua}
      '';
      config = {
        viAlias = true;
        vimAlias = true;
        withNodeJs = false;
        withPython3 = false;
        withRuby = false;
        # extraLuaPackages = x: [];
        extraMakeWrapperArgs = ''--prefix PATH : "${pkgs.lib.makeBinPath dependencies}"'';
        configure = {
          inherit customLuaRC;
          packages.myPlugins.start = start;
          packages.myPlugins.opt = opt;
        };
      };
      mynvim = pkgs.wrapNeovim pkgs.neovim-unwrapped config;
    in
    rec {
      packages.mynvim = mynvim;
      packages.default = packages.mynvim;
      packages.x86_64-linux.default = packages.mynvim;
      devShells.x86_64-linux.default = pkgs.mkShell {
        buildInputs = [ packages.mynvim ];
        shellHook = ''
          echo "Entering dev shell with neovim"
        '';
      };
      apps.x86_64-linux.default = {
        type = "app";
        program = "${packages.mynvim}/bin/nvim";
      };
    };
}
