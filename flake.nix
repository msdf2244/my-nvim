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
      customRC = ''luafile ${./config/init.lua}'';
      dependencies = with pkgs; [
        lua-language-server
        nil
      ];
      start = with pkgs.vimPlugins; [ mini-nvim ];
      opt = [ ];
      config = {
        viAlias = true;
        vimAlias = true;
        withNodeJs = false;
        withPython3 = false;
        withRuby = false;
        # extraLuaPackages = x: [];
        extraMakeWrapperArgs = ''--prefix PATH : "${pkgs.lib.makeBinPath dependencies}"'';
        configure = {
          inherit customRC;
          packages.myPlugins.start = start;
          packages.myPlugins.opt = opt;
        };
      };
    in
    rec {
      packages.mynvim = pkgs.wrapNeovim pkgs.neovim-unwrapped config;
      packages.x86_64-linux.default = packages.mynvim;
      devShells.x86_64-linux.default = pkgs.mkShell {
        buildInputs = [ packages.mynvim ];
        shellHook = ''
          echo "Entering dev shell with neovim"
        '';
      };
      apps.x86_64-linux.default = { type = "app"; program = packages.mynvim; };
    };
}
