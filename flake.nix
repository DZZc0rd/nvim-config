{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    mnw.url = "github:gerg-l/mnw";
    systems.url = "github:nix-systems/default";
  };

  outputs = {
    self,
    nixpkgs,
    mnw,
    systems,
  }: let
    forEachSystem = nixpkgs.lib.genAttrs (import systems);
  in {
    packages = forEachSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in rec {
      neovim = mnw.lib.wrap pkgs {
        luaFiles = [./init.lua];

        plugins = {
          dev.config.pure = ./.;

          start = with pkgs.vimPlugins; [
            nvim-lspconfig
            nvim-cmp
            cmp-buffer
            cmp-path
            cmp-cmdline
            cmp-nvim-lsp
            cmp_luasnip
            nvim-treesitter.withAllGrammars
            nvim-autopairs
            alpha-nvim
            base16-nvim
            fyler-nvim
            fzf-lua
            lualine-nvim
            noice-nvim
            trouble-nvim
            which-key-nvim
            nvim-notify
            mini-icons
          ];
        };

        extraBinPath = with pkgs; [
          nixd
          alejandra
          statix
        ];
      };

      default = neovim;
    });

    devShell = forEachSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
      in
        pkgs.mkShell {
          packages = with pkgs; [
            lua-language-server
            stylua
          ];
        }
    );
  };
}
