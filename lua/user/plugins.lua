local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here:
return packer.startup(function(use)
-- My plugins here:
  use "norcalli/nvim-colorizer.lua"           -- A great & fast lua color-code bg colorizer plugin.
  use "wbthomason/packer.nvim"                -- Have packer manage itself.
  use "nvim-lua/popup.nvim"                   -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim"                 -- Useful lua functions used in lots of plugins.
  use "ryanoasis/vim-devicons"                -- Developer icons for Neo-vim plugins like file-managers...
  use "tpope/vim-surround"                    -- A great tag/code-encapsulator plugin.
  use "windwp/nvim-autopairs"                 -- Autopairs, integrates with both cmp and treesitter.
  use "numToStr/Comment.nvim"                 -- Easily comment stuff with gcc.
  use 'kyazdani42/nvim-web-devicons'          -- Extra WWW-developer icons.
  use 'kyazdani42/nvim-tree.lua'              -- A sweet lua-based Nerd-tree File explorer.
  use "akinsho/bufferline.nvim"               -- A Neo-vim tab-enhancement plugin.
  use "moll/vim-bbye"                         -- A more well bahaved "B"uffer-deletes.
  use 'nvim-lualine/lualine.nvim'             -- A lua replacement for Air-line.
  use "akinsho/toggleterm.nvim"               -- A Plugin to run shells/TUIs.
  use "mbbill/undotree"                       -- A plugin to view Git's default built-in auto-undo-tree.
  use "preservim/tagbar"                      -- Getting my tag-bar back.
  use "tpope/vim-repeat"                      -- Now you can repeat plugin actionsave
  use "lukas-reineke/indent-blankline.nvim"   -- Hopefully better lua IL-plugin.
  use "goolord/alpha-nvim"                    -- Telescope enabled dash-board sttyle plugin.
  use "alvan/vim-closetag"                    -- Tag-completion plugin.
  use "ahmedkhalf/project.nvim"               -- I think I need to RTFM...
  use "ggandor/lightspeed.nvim"               -- An interesting sneak/QS alternative.
  use "lewis6991/impatient.nvim"              -- Hopefully this will speed up all of my lua nvim plugins.
  use "antoinemadec/FixCursorHold.nvim"       -- This is needed to fix lsp doc highlight
  use "folke/which-key.nvim"                  -- I hope I don't have to totally rewrite my Leader bindings.
  use "vimwiki/vimwiki"                       -- Vimwiki is a personal wiki for Vim...

-- Colors-schemes:
  use "rafi/awesome-vim-colorschemes"         -- Various vim-colour schemes.

-- cmp plugins:
  use "hrsh7th/nvim-cmp"                      -- The completion plugin
  use "hrsh7th/cmp-buffer"                    -- buffer completions
  use "hrsh7th/cmp-path"                      -- path completions
  use "hrsh7th/cmp-cmdline"                   -- cmdline completions
  use "saadparwaiz1/cmp_luasnip"              -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"                  -- Neo-vim completion integration.
  use "hrsh7th/cmp-nvim-lua"                  -- I'm assuming this will add lua completion to my cmp-engine.

-- snippets:
  use "L3MON4D3/LuaSnip"                      -- Snippet engine plugin.
  use "rafamadriz/friendly-snippets"          -- A bunch of snippets to use with cmp.

-- LSP:
  use "neovim/nvim-lspconfig"                 -- enable LSP
  use "williamboman/nvim-lsp-installer"       -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim"          -- language server settings defined in json for
--  use "jose-elias-alvarez/null-ls.nvim"     -- for formatters and linters TODO

-- Telescope:
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-media-files.nvim"
  use "xiyaowong/telescope-emoji.nvim" -- Cool emoji plugin. Esc --> <selection> <ENTER> Then press "* to paste.
  use 'olacin/telescope-gitmoji.nvim'  -- Plugin for makin emojiful commits. P.s. Use the lua fct. below:
  use "nvim-telescope/telescope-github.nvim"   -- Adds 4 github-cli telescope functions.
  use "LinArcX/telescope-changes.nvim"          -- Telescope wrapper for :changes.
  --  :lua ('telescope').extensions.gitmoji.gitmoji()
  -- TS cheatsheet plugin.
  use "sudormrfbin/cheatsheet.nvim"
  -- Git:
  -- Git-gutter like functionality in a lua-neo-vim plugin.
  use "lewis6991/gitsigns.nvim"
  use {
    "AckslD/nvim-neoclip.lua",
    requires = {
      -- you'll need at least one of these
      -- {'nvim-telescope/telescope.nvim'},
      -- {'ibhagwan/fzf-lua'},
    },
    config = function()
      require('neoclip').setup()
    end,
  }

  -- Treesitter
  --   use {
  --     "nvim-treesitter/nvim-treesitter",
  --     run = ":TSUpdate",
  --   }
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
