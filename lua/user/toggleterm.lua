local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

toggleterm.setup({
  size = 20,
  open_mapping = [[<c-t>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = "float",
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = "curved",
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
})

  function _G.set_terminal_keymaps()
    local opts = {noremap = true}
    vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
  end

  vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal = require("toggleterm.terminal").Terminal



local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end

local gitpush = Terminal:new({ cmd = "git push && git status", hidden = true })
-- Added so I can now launch a terminal and insta-push my changes.
function _GITPUSH_TOGGLE()
  gitpush:toggle()
end

local node = Terminal:new({ cmd = "node", hidden = true })

function _NODE_TOGGLE()
	node:toggle()
end

-- I wish gdu would have worked, weird since it works in float_Tterm, when called incrementally.
local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })

function _NCDU_TOGGLE()
  ncdu:toggle()
end

-- Because who doesn't love H-top???...
local htop = Terminal:new({ cmd = "htop", hidden = true })

function _HTOP_TOGGLE()
  htop:toggle()
end

-- Basic Python 3.10+ shell.
local python = Terminal:new({ cmd = "python3", hidden = true })

function _PYTHON_TOGGLE()
  python:toggle()
end

-- Finally adding my own TT_TUI magic.
local ipython = Terminal:new({ cmd = "ipython3", hidden = true })

function _IPYTHON_TOGGLE()
  ipython:toggle()
end

-- Finally adding my own TT_TUI magic.
local nmon = Terminal:new({ cmd = "nmon", hidden = true })

function _NMON_TOGGLE()
  nmon:toggle()
end
-- Finally adding my own TT_TUI magic. Needs sudo exception to p/w require.
local nethogs = Terminal:new({ cmd = "nethogs", hidden = true })

function _NETHOGS_TOGGLE()
  nethogs:toggle()
end

-- Finally adding my own TT_TUI magic.
local vifm = Terminal:new({ cmd = "vifm", hidden = true })

function _VIFM_TOGGLE()
  vifm:toggle()
end
