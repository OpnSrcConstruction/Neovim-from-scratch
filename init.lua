-- Below is the sourced file where I keep most of my general options.
-- Please remember the lua @ the begining & end of the string are implied.
-- In other words "user.abbrs" is the same as "lua.user.abbrs" | "user.abbrs.lua" | "lua.user.abbrs.lua".
require "user.options"
-- I have auto-commands for cursor-file persistance,
-- auto. vertically centering, & auto-saving text-folds.
require "user.autocmds"
-- where my Hot-keys will be kept.
-- Eventually this will include ALL hotkeys, from all of my plugins.
require "user.keymaps"
-- Abbreviations for manual text-replacements.
-- Populated mostly with a top 100 list of commonly misspelled words.
require "user.abbrs"
-- My personnel plugins lua configuration file.
-- I will be adding to this file often,
-- b/c it's where I will be adding plugins to packer.
-- I like that Packer is fully in lua.
require "user.plugins"
-- This is where I will add my color-schemes.
require "user.colorscheme"
-- This is where I will learn about completion.
require "user.cmp"
-- Where I will keep my Language-server-protocol configuration.
require "user.lsp"
-- Learning about telescope, targeted(fuzzy) searching plugin configuration:
require "user.telescope"
-- Adding in the indent-line plugin...
-- require "user.indentline"
-- Disabled Tree-sitter, until I can understand it  better, so I stashed It's branch of merged changes Fr. this branch and 
-- inspired by my OG nvim(init.vim) Fr.--> OG vim(gotbletu/metalx1000/FrugalGuy/boomerGuy,Brodie,LinuxCast/DT/primeagen)
-- require "user.treesitter"
-- I am hoping to get Auto-pair functioning going in my mostly lua neo-vim.
require "user.autopairs"
require "user.comment"
