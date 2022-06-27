-- changed silent to false, b/c for now I have the space for it,
-- and prefer verbosity!
  local opts = { noremap = true, silent = false }

-- Terminal options for.
  local term_opts = { silent = true }

-- Shorten function name.
  local keymap = vim.api.nvim_set_keymap

--Re-map space as leader key.
--I already did this on vim & neovim(init.vim).
  keymap("", "<Space>", "<Nop>", opts)
  vim.g.mapleader = " "
  vim.g.maplocalleader = " "

-- Modes:
--  normal_mode = "n",
--  insert_mode = "i",
--  visual_mode = "v",
--  visual_block_mode = "x",
--  term_mode = "t",
--  command_mode = "c",

-- Normal --
-- Better window navigation
-- Exactly what I would have done...
  keymap("n", "<C-h>", "<C-w>h", opts)
  keymap("n", "<C-j>", "<C-w>j", opts)
  keymap("n", "<C-k>", "<C-w>k", opts)
  keymap("n", "<C-l>", "<C-w>l", opts)

-- Toggle NetRW Plugin for now...
-- keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Resize with with Ctrl-Up/Down/Left/Right.
-- Tweaked slightly like on the Video-series.
  keymap("n", "<C-Up>", ":resize +2<CR>", opts)
  keymap("n", "<C-Down>", ":resize -2<CR>", opts)
  keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
  keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- Navigate buffers:
-- I like changing buffers this way,
-- b/c I was running into problems w/ Ctrl-f/b.
  keymap("n", "<S-l>", ":bnext<CR>", opts)
  keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert:
-- Press jk fast to enter Normal-mode, from Insert-mode.
-- keymap("i", "jk", "<ESC>", opts)

-- Visual:
-- Stay in indent mode.
-- I like this idea.
  keymap("v", "<", "<gv", opts)
  keymap("v", ">", ">gv", opts)

-- Move text highlights up & down.
  keymap("v", "<A-j>", ":m .+1<CR>==", opts)
  keymap("v", "<A-k>", ":m .-2<CR>==", opts)
  keymap("v", "p", '"_dP', opts)
-- Subltle change, but if you paste over a visual selection;
-- Now it won't put what you pasted over into the 2-be-pasted-next buffer. 

-- Visual Block --
-- Move full lines Up/Down.
  keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
  keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
  keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
  keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- "############################
-- "# leader-mappings section: #
-- "############################
  keymap("n", "<leader>top", ":set paste<CR>", opts)  -- Turn special pasting on ONLY when needed.

-- "################################################################
-- "# Toggle highlight searching.                                  #
-- "# Map nh to toggle off the search highlighting in Normal mode. #
-- "################################################################
  keymap("n", "<leader>nh", ":nohl<CR>", opts)

-- ##########################################################
-- ## Map nn, to toggle regular line-numberings on,          #
-- ## to check for which specific line of the file your on. #
-- ##########################################################
  keymap("n", "<leader>lno", ":set nonu<CR>", opts) -- Turn line-numbers OFF.
  keymap("n", "<leader>ln", ":set nu<CR>", opts)    -- Turn line-numbers back on.

-- ###################################################################
-- ## Map nr to toggle off the relative line numbers in Normal mode. #
-- ###################################################################
  keymap("n", "<leader>nno", ":set nornu<CR>", opts) -- Turn relative line-numbers OFF.
  keymap("n", "<leader>rn", ":set rnu<CR>", opts)  -- Turn relative line-numbers back on.

-- ###########################################################################
-- ##I'm mapping comma{,} + lower-case 'l' to disable special char listings. #
-- ###########################################################################
  keymap("n", "<leader>nls", ":set nolist<CR>", opts) -- Turn special hidden chars OFF.
  keymap("n", "<leader>ls", ":set list<CR>", opts)    -- Turn List(ls) mode back on.

-- ###############################################################################
-- ## cm == copy-mode. disables special characters($) and relative-line-numbers. #
-- ###############################################################################
 keymap("n", "<leader>cm", ":set nolist <CR> <bar> :set nornu <CR> <bar> :set nonu <CR>", opts)

-- ##############################################################
-- ## Spell check set to sc(Spell-Check)/es(Switch 2 ESpañol.). #
-- ##############################################################
  keymap("n", "<leader>sc", ":setlocal spell! spelllang=en_us<CR>", opts)
  keymap("n", "<leader>es", ":set spelllang=es<CR>", opts)

-- #########################################################################
-- ## hotkey mappings for jumps, marks, buffer-LiSting, and changes lists. #
-- #########################################################################
  keymap("n", "<leader>mm", ":marks<CR>", opts)     -- This will open up the Marks-list.
  keymap("n", "<leader>jj", ":jumps<CR>", opts)     -- This will open up the Jumps-list.
  keymap("n", "<leader>ll", ":ls<CR>", opts)        -- This opens up the buffers-list.
  keymap("n", "<leader>cc", ":changes<CR>", opts)   -- This will open up the Changes-list.
  keymap("n", "<leader>rr", ":registers<Cr>", opts) -- This will open up the Registers-list.

-- #########################################################################
-- ## Adding some hotkeys to more easily deal with splits.                 #
-- ## qq == :q aka quit file. You will be prompted if the file is unsaved. #
-- ## wq == :wq aka Save and quit.                                         #
-- ## qa == :qa! aka quit the file without saving                          #
-- ## w == :w <ENTER> aka save(write) file.                                #
-- #########################################################################
  keymap("n", "<leader>qq", ":q<CR>", opts)
  keymap("n", "<leader>wq", ":wq<CR>", opts)
  keymap("n", "<leader>qa", ":qa!<CR>", opts)
  keymap("n", "<leader>s", ":w<CR>", opts)

-- ##################
-- ## Mark-keymaps: #
-- ##################
  keymap("n", "<leader>dm", ":delmarks!<CR>", opts)     -- Delete ALL marks:

-- #################
-- # TAB keymaps:  #
-- #################
  keymap("n", "<leader>tn", ":tabnew ", opts)          -- New-tab
  keymap("n", "<leader>tc", ":Bdelete<CR>", opts)      -- Close-tab
  -- keymap("n", "<leader>bt", "gT", opts)             -- Backward-tab(s)
  -- keymap("n", "<leader>ft", "gt", opts)             -- Forward-tab(s)
  -- redundant keymap("n", "<leader>db", ":bd<CR>", opts)        -- Delete-Buffer

-- ################################################################################
-- # Split-keymaps:                                                               #
-- # The following combos split the view, and it is up to you to switch to        #
-- # different files or locations in a large file perhaps.                        #
-- # *~In a powershell or cmd prompt, there is possibly no session or             #
-- # tmux|screen|byobu or jobs like functionality I've been able to find.         #
-- # Although clink 4 cmd does have history/jab-control, but sadly no shell-view  #
-- # multi-plexing. :(                                                            #
-- ################################################################################

  keymap("n", "<leader>sp", ":split<CR>", opts)     -- Splits current view horizontally.
  keymap("n", "<leader>vp", ":vsplit<CR>", opts)    -- Splits current view Vertically. 

  keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)

-- keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
  keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)

-- Better terminal navigation... ???
-- This is the ONLY block I am not sure if I want to include in my config,
-- b/c I don't understand what it does; so I'll disable it for now...
-- Terminal --
-- Better terminal navigation
  keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
  keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
  keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
  keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Indent-Lines-Toggle:
  keymap("n", "<leader>ilt", ":IndentLinesToggle<CR>", opts)

-- Nvimtree
  keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- #########################################################
-- ## Toggle Startify for ascii comic relief & bookmarks. ##
-- #########################################################
  keymap("n", "<leader>st", ":Startify<CR>", opts)     -- Delete ALL marks:

-- Toggle-term TUI-app maps:
  keymap("n", "<leader>lgt", ":lua _LAZYGIT_TOGGLE()<CR>", opts)    -- Maps L->lgt to lazygit.

  keymap("n", "<leader>ncdu", ":lua _NCDU_TOGGLE()<CR>", opts)      -- Maps L->ncdu to ncdu fs analyzer.

  keymap("n", "<leader>htop", ":lua _HTOP_TOGGLE()<CR>", opts)      -- maps L->htop to my htop system monitor.

  keymap("n", "<leader>node", ":lua _NODE_TOGGLE()<CR>", opts)      -- Maps L->node to the NodeJS pkg. mgr.

  keymap("n", "<leader>py3", ":lua _PYTHON_TOGGLE()<CR>", opts)     -- Maps L->py3 to the Basic IDLE python-3 shell.

  keymap("n", "<leader>nmon", ":lua _NMON_TOGGLE()<CR>", opts)      -- Great sytem-monitoring tool.
  -- Some basic keys after your in nmon:
  -- c == CPU monitor
  -- d == Disk I/O
  -- m == Memory
  -- n == NT
  -- q == quit
  -- ? == help-menu

  keymap("n", "<leader>ipy3", ":lua _IPYTHON_TOGGLE()<CR>", opts)      -- Great sytem-monitoring tool.

  keymap("n", "<leader>tree", ":UndotreeToggle<CR>", opts)      -- Amazing Vim Undoo-tree visualization tool.

  keymap("n", "<leader>tbar", ":TagbarToggle<CR>", opts)      -- Amazing Vim Undoo-tree visualization tool.
