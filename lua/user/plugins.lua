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
-- My Functionality plugins here:
-- First Function is for configuring Alpha start page.
--   use {
--     'goolord/alpha-nvim',
--     requires = { 'kyazdani42/nvim-web-devicons' },
--     config = function ()
--         require'alpha'.setup(require'alpha.themes.startify'.config)
--     end
-- } 
  use "norcalli/nvim-colorizer.lua"           -- A great & fast lua color-code bg colorizer plugin.
  use "goolord/alpha-nvim"                   -- Now I just have to get manual & fortuynes locations working.  
  use "wbthomason/packer.nvim"                -- Have packer manage itself.
  use "nvim-lua/popup.nvim"                   -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim"                 -- Useful lua functions used in lots of plugins.
  -- use "mhinz/vim-startify"                    -- Neo-vim customizable Neo-vim start-page.
  use "ryanoasis/vim-devicons"                -- Developer icons for Neo-vim plugins like file-managers...
  use "tpope/vim-surround"                    -- A great tag/code-encapsulator plugin.
  use "windwp/nvim-autopairs"                 -- Autopairs, integrates with both cmp and treesitter
  use "numToStr/Comment.nvim"                 -- Easily comment stuff
  use 'kyazdani42/nvim-web-devicons'          -- Extra WWW-developer icons.
  use 'kyazdani42/nvim-tree.lua'              -- A sweet lua-based Nerd-tree File explorer.
  use "akinsho/bufferline.nvim"               -- A Neo-vim tab-enhancement plugin.
  use "moll/vim-bbye"                         -- A more well bahaved "B"uffer-deletes. 
  use 'nvim-lualine/lualine.nvim'             -- A lua replacement for Air-line.
  use "akinsho/toggleterm.nvim"               -- A Plugin to run shells/TUIs.
  use "mbbill/undotree"                       -- A plugin to visualize Git's default built-in auto-undo-tree.
  use "preservim/tagbar"                      -- Getting my tag-bar back.
  use "tpope/vim-repeat"                      -- Now you can repeat plugin actionsave
  use "lukas-reineke/indent-blankline.nvim"   -- Hopefully better lua IL-plugin.
  -- use "alvan/vim-closetag"                 -- Tag-completion plugin.
  -- use "mattn/emmet-vim"                    -- Added the emmet Quick-tag plugin.

-- Colors-schemes:
  use "rafi/awesome-vim-colorschemes"         -- Various vim-colour schemes.
  use "lunarvim/colorschemes"                 -- A bunch of colorschemes you can try out.
  use "lunarvim/darkplus.nvim"                -- Another Random color-scheme.

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
-- TODO use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

-- Telescope:
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-media-files.nvim"

  -- Git:
  -- Git-gutter like functionality in a lua-neo-vim plugin.
  use "lewis6991/gitsigns.nvim"

-- Treesitter
--   use {
--     "nvim-treesitter/nvim-treesitter",
--     run = ":TSUpdate",
--   }
  -- use {
  --   "nvim-treesitter/nvim-treesitter",
  --   run = ":TSUpdate",
  -- }
  -- use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
