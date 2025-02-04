local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

toggleterm.setup({
	size = 20,
	open_mapping = [[<c-\>]],
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
local lazygit = Terminal:new({ cmd = "lazygit", hidden = false })

function _LAZYGIT_TOGGLE()
	lazygit:toggle()
end

local node = Terminal:new({ cmd = "node", hidden = false })

function _NODE_TOGGLE()
	node:toggle()
end

local btop = Terminal:new({ cmd = "btop", hidden = false })

function _BTOP_TOGGLE()
	btop:toggle()
end

local htop = Terminal:new({ cmd = "htop", hidden = false })

function _HTOP_TOGGLE()
	htop:toggle()
end

local python3 = Terminal:new({ cmd = "python3", hidden = false })

function _PYTHON3_TOGGLE()
	python3:toggle()
end

local vifm = Terminal:new({ cmd = "vifm", hidden = false })

function _VIFM_TOGGLE()
	vifm:toggle()
end

local nmon = Terminal:new({ cmd = "nmon", hidden = false })

function _NMON_TOGGLE()
	nmon:toggle()
end

local vit = Terminal:new({ cmd = "vit", hidden = false })

function _VIT_TOGGLE()
	vit:toggle()
end

local nethogs = Terminal:new({ cmd = "sudo nethogs", hidden = false })
-- Eventually I will have to add nethogs to my sodoers config.
function _NETHOGS_TOGGLE()
	nethogs:toggle()
end
