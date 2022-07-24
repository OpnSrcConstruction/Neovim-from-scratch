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
-- Non-Lua plugins:
  use "tpope/vim-surround"                    -- A great tag/code-encapsulator plugin.
  use "moll/vim-bbye"                         -- A more well bahaved "B"uffer-deletes.
  use "preservim/tagbar"                      -- Getting my tag-bar back.
  use "tpope/vim-repeat"                      -- Now you can repeat plugin actionsave
  use "mbbill/undotree"                       -- A plugin to view Git's default built-in auto-undo-tree.
  use "alvan/vim-closetag"                    -- Tag-completion plugin.
  use "antoinemadec/FixCursorHold.nvim"       -- This is needed to fix lsp doc highlight
  use "ggandor/lightspeed.nvim"               -- An interesting sneak/QS alternative.
-- Lua based plugins:
  use "norcalli/nvim-colorizer.lua"           -- A great & fast lua color-code bg colorizer plugin.
  use "wbthomason/packer.nvim"                -- Have packer manage itself.
  use "nvim-lua/popup.nvim"                   -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim"                 -- Useful lua functions used in lots of plugins.
  use "ryanoasis/vim-devicons"                -- Developer icons for Neo-vim plugins like file-managers...
  use "windwp/nvim-autopairs"                 -- Autopairs, integrates with both cmp and treesitter.
  use "numToStr/Comment.nvim"                 -- Easily comment stuff with gcc.
  use "kyazdani42/nvim-web-devicons"          -- Extra WWW-developer icons.
  use "kyazdani42/nvim-tree.lua"              -- A sweet lua-based Nerd-tree File explorer.
  use "akinsho/bufferline.nvim"               -- A Neo-vim tab-enhancement plugin.
  use "nvim-lualine/lualine.nvim"             -- A lua replacement for Air-line.
  use "akinsho/toggleterm.nvim"               -- A Plugin to run shells/TUIs.
  use "lukas-reineke/indent-blankline.nvim"   -- Hopefully better lua IL-plugin.
  use "goolord/alpha-nvim"                    -- Telescope enabled dash-board sttyle plugin.
  use "ahmedkhalf/project.nvim"               -- See Telescope & Alpha
  use "lewis6991/impatient.nvim"              -- Hopefully this will speed up all of my lua nvim plugins.
  use "folke/which-key.nvim"                  -- I hope I don't have to totally rewrite my Leader bindings.

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

-- Markdown:  Disabled CoC & it's snippets, so I can get the md features from fully lua plugins.
-- Also Got rid of prettier, b/c I'll eventually figure out Null-ls. TODO
  -- use "SirVer/ultisnips"                        -- Ultimate snippet solution for MD.
  -- use {"neoclide/coc.nvim", branch = "release"} -- Code-of-Completion snippet engine.
  -- use "prettier/vim-prettier"                   -- For formatting. Might be unnecessary later b/c of nulls.
  -- use "honza/vim-snippets"                      -- Another snippet solution.
  use "vimwiki/vimwiki"                         -- Vimwiki is a personal wiki for Vim.
  use {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup {
        window = {
          width = .98 -- set a small margin for zen-mode.
        },
      }
    end
  }
-- install without yarn or npm
  use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
  })

--   use({ "iamcck/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" },
-- })

-- LSP:
  use "neovim/nvim-lspconfig"                 -- enable LSP
  use "williamboman/nvim-lsp-installer"       -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim"          -- language server settings defined in json for
--  use "jose-elias-alvarez/null-ls.nvim"     -- for formatters and linters TODO

-- Telescope:
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-media-files.nvim"
  use "xiyaowong/telescope-emoji.nvim" -- Cool emoji plugin. Esc --> <selection> <ENTER> Then press "* to paste.
  use "olacin/telescope-gitmoji.nvim"  -- Plugin for makin emojiful commits. P.s. Use the lua fct. below:
  --  :lua ('telescope').extensions.gitmoji.gitmoji()
  use "nvim-telescope/telescope-github.nvim"   -- Adds 4 github-cli telescope functions.
  use "LinArcX/telescope-changes.nvim"          -- Telescope wrapper for :changes.
  -- TS cheatsheet plugin.
  use "sudormrfbin/cheatsheet.nvim"
  -- Git:
  -- Git-gutter like functionality in a lua-neo-vim plugin.
  use "lewis6991/gitsigns.nvim"
  use "tpope/vim-fugitive" -- Used mainly for diffing merge conflicts.

  -- Treesitter
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
    }
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
