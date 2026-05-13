{ inputs, pkgs, lib, ... }:
{
  imports = [ inputs.nixvim.homeModules.nixvim ];

  programs.nixvim = {
    enable = true;

    globals = {
      mapleader = " ";
      maplocalleader = "\\";
      skip_ts_context_commentstring_module = true;
    };

    opts = {
      termguicolors = true;
      swapfile = false;
      tabstop = 2;
      softtabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      number = true;
      showmode = false;
      laststatus = 0;
      wrap = true;
      breakindent = true;
      linebreak = true;
      clipboard = "unnamedplus";
      fillchars = { eob = " "; };
    };

    keymaps = [
      { mode = [ "n" "v" ]; key = "J"; action = "4j"; options.noremap = true; }
      { mode = [ "n" "v" ]; key = "K"; action = "4k"; options.noremap = true; }
      { mode = "n"; key = "gJ"; action = "J"; options.noremap = true; }
      { mode = "n"; key = "gK"; action = "K"; options.noremap = true; }
      {
        mode = "n";
        key = "<space>f";
        action.__raw = ''function() require("conform").format() end'';
        options.noremap = true;
      }
      { mode = "n"; key = "<space>o"; action = "<cmd>Oil<CR>"; options.noremap = true; }
      { mode = "n"; key = "gh"; action.__raw = "vim.diagnostic.open_float"; options.noremap = true; }
      { mode = "i"; key = "<C-BS>"; action = "<C-w>"; }
      { mode = "i"; key = "<C-h>"; action = "<C-w>"; }
      { mode = "n"; key = "<space>h"; action = ":bprevious<CR>"; options.noremap = true; }
      { mode = "n"; key = "<space>l"; action = ":bnext<CR>"; options.noremap = true; }
      { mode = "n"; key = "<space>d"; action = ":bdelete<CR>"; options.noremap = true; }
      { mode = "n"; key = "<space>p"; action = "<cmd>FzfLua files<cr>"; }
      { mode = "n"; key = "<space>P"; action = "<cmd>FzfLua live_grep<cr>"; }
      { mode = "n"; key = "<space>x"; action = "<cmd>Trouble diagnostics toggle<cr>"; options.noremap = true; }
      { mode = "n"; key = "<space>X"; action = "<cmd>Trouble diagnostics toggle filter.buf=0<cr>"; options.noremap = true; }
      { mode = [ "n" "v" "i" ]; key = "<A-h>"; action = "<Esc>:BufferLineCyclePrev<CR>"; options.noremap = true; }
      { mode = [ "n" "v" "i" ]; key = "<A-l>"; action = "<Esc>:BufferLineCycleNext<CR>"; options.noremap = true; }
      { mode = [ "n" "v" ]; key = "<A-H>"; action = ":BufferLineMovePrev<CR>"; options.noremap = true; }
      { mode = [ "n" "v" ]; key = "<A-L>"; action = ":BufferLineMoveNext<CR>"; options.noremap = true; }
    ];

    plugins = {
      lsp = {
        enable = true;
        servers = {
          lua_ls = {
            enable = true;
            settings.Lua.diagnostics.globals = [ "vim" ];
          };
          clangd.enable = true;
          html.enable = true;
          emmet_ls.enable = true;
          gopls.enable = true;
          pyright.enable = true;
          terraformls.enable = true;
          tinymist.enable = true;
        };
      };

      treesitter = {
        enable = true;
        settings = {
          highlight.enable = true;
          indent.enable = true;
        };
      };

      blink-cmp = {
        enable = true;
        settings = {
          keymap = {
            preset = "default";
            "<Tab>" = [ "accept" "fallback" ];
            "<A-j>" = [ "select_next" ];
            "<A-k>" = [ "select_prev" ];
          };
          appearance.nerd_font_variant = "mono";
          sources = {
            default = [ "lsp" "path" "snippets" "buffer" "copilot" ];
            providers.copilot = {
              name = "copilot";
              module = "blink-cmp-copilot";
              score_offset = 100;
              async = true;
            };
          };
        };
      };

      conform-nvim = {
        enable = true;
        settings = {
          formatters_by_ft = {
            lua = [ "stylua" ];
            c = [ "clang-format" ];
            cpp = [ "clang-format" ];
            typescript = [ "prettierd" ];
            typescriptreact = [ "prettierd" ];
            javascript = [ "prettierd" ];
            javascriptreact = [ "prettierd" ];
            python = [ "black" ];
            kdl = [ "kdlfmt" ];
          };
          format_on_save = {
            timeout_ms = 500;
            lsp_format = "fallback";
          };
        };
      };

      copilot-lua = {
        enable = true;
        settings = {
          suggestion.enabled = false;
          panel.enabled = false;
        };
      };

      gitsigns.enable = true;

      oil = {
        enable = true;
        settings = {
          view_options.show_hidden = true;
          win_options.signcolumn = "yes:2";
        };
      };

      bufferline = {
        enable = true;
        settings.options = {
          show_buffer_close_icons = false;
          show_close_icon = false;
        };
      };

      nvim-autopairs.enable = true;

      mini = {
        enable = true;
        modules.surround = {};
      };

      trouble = {
        enable = true;
        settings.auto_close = true;
      };

      fzf-lua = {
        enable = true;
        settings.keymap.fzf = {
          "alt-j" = "down";
          "alt-k" = "up";
        };
      };

      diffview.enable = true;

      octo = {
        enable = true;
        settings = {
          use_local_fs = false;
          enable_builtin = true;
          default_remote = [ "upstream" "origin" ];
          picker = "fzf-lua";
        };
      };

      web-devicons.enable = true;

      ts-context-commentstring = {
        enable = true;
        settings.enable_autocmd = false;
      };
    };

    extraLuaPackages = ps: [ ps.magick ];

    extraPlugins = with pkgs.vimPlugins; [
      catppuccin-nvim
      friendly-snippets
      nvim-scrollbar
      nvim-highlight-colors
      glance-nvim
      blink-cmp-copilot
      oil-git-status-nvim
      image-nvim
      (pkgs.vimUtils.buildVimPlugin {
        name = "claudecode-nvim";
        src = pkgs.fetchFromGitHub {
          owner = "coder";
          repo = "claudecode.nvim";
          rev = "main";
          hash = "sha256-h8wYaWBKjKrb7hYYKYs5yUS5RI0JVFo8Emcy99YK6Qw=";
        };
      })
    ];

    extraPackages = with pkgs; [
      imagemagick
      lua-language-server
      clang-tools
      typescript-go
      vscode-langservers-extracted
      emmet-ls
      gopls
      pyright
      terraform-ls
      stylua
      prettierd
      black
    ];

    extraConfigLua = builtins.readFile ./extraConfig.lua;
  };
}
