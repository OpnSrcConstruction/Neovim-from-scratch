require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.colorscheme"
require "user.cmp"
require "user.lsp"
require "user.telescope"
require "user.gitsigns"
require "user.treesitter"
require "user.autopairs"
require "user.comment"
require "user.nvim-tree"
require "user.bufferline"
require "user.lualine"
require "user.toggleterm"
require "user.project"
require "user.impatient"
require "user.indentline"
require "user.alpha"
require "user.whichkey"
require "user.autocommands"
-- Abbreviations for manual text-replacements.
-- Populated mostly with a top 100 list of commonly misspelled words.
require "user.abbrs"
require "user.colorizer"  -- Adding in colorizer nvim plugin to bg colorize color-codes.
--  require "rainbows"
require('leap').add_default_mappings()
require("stay-centered").setup({
  skip_filetypes = {"typescript"},
})
