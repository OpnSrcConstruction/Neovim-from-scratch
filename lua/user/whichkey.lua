local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end

local setup = {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
            enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
            motions = false, -- adds help for motions
            text_objects = false, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true, -- bindings for prefixed with g
        },
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    -- operators = { gc = "Comments" },
    key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        -- ["<space>"] = "SPC",
        -- ["<cr>"] = "RET",
        -- ["<tab>"] = "TAB",
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
    },
    popup_mappings = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>", -- binding to scroll up inside the popup
    },
    window = {
        border = "rounded", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,
    },
    layout = {
        height = { min = 5, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "left", -- align columns left, center or right
    },
    ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
    show_help = true, -- show help message on the command line when the popup is visible
    triggers = "auto", -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
    triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = { "j", "k" },
        v = { "j", "k" },
    },
}

local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
    ["/"] = { '<cmd>lua require("Comment.api").toggle_current_linewise()<CR>', "Comment" },
    ["a"] = { "<cmd>Alpha<cr>", "Alpha" },
    -- ["b"] = {
    --   "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
    --   "Buffers",
    -- },
    ["c"] = { "<cmd>Cheatsheet<cr>", "Cheat-sheet" },
    ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
    ["w"] = { "<cmd>w!<CR>", "Save" },
    ["q"] = { "<cmd>q!<CR>", "Quit" },
    ["x"] = { "<cmd>Bdelete!<CR>", "eXit Buffer" },
    ["Z"] = { "<cmd>ZenMode<CR>", "Zen-Mode" },
    ["T"] = { "<cmd>TagbarToggle<CR>", "Tag-bar" },
    ["U"] = { "<cmd>UndotreeToggle<CR><bar><cmd>UndotreeFocus<CR>", "Undo-tree" },
    ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
    ["f"] = {
        "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
        "Find files",
    },
    ["F"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
    p = {
        name = "Packer",
        c = { "<cmd>PackerCompile<cr>", "Compile" },
        i = { "<cmd>PackerInstall<cr>", "Install" },
        s = { "<cmd>PackerSync<cr>", "Sync" },
        S = { "<cmd>PackerStatus<cr>", "Status" },
        u = { "<cmd>PackerUpdate<cr>", "Update" },
    },
    m = {
        name = "vim-Menus",
        b = { "<cmd>Telescope buffers<CR>", "Buffers-menu" },
        r = { "<cmd>Telescope registers<CR>", "Registers-menu" },
        m = { "<cmd>Telescope marks<CR>", "Marks-menu" },
        j = { "<cmd>Telescope jumplist<CR>", "Jumplist-menu" },
        c = { "<cmd>Telescope changes<CR>", "Changes-menu" },
    },
    G = {
        name = "Git",
        s = {
            name = "Signs",
            h = {
                name = "hunks",
            p = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
            n = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
            P = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
            s = { "<cmd>lua require 'gitsigns'.select_hunk()<cr>", "select Hunk" },
            },
            b = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
            r = {
                name = "Reset",
                h = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
                b = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
            },
                s = {
                name = "Stage",
                h = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
                b = { "<cmd>lua require 'gitsigns'.stage_buffer()<cr>", "Stage Buffer" },
            },
            t = {
                name = "Toggle",
                d = { "<cmd>Gitsigns toggle_deleted<cr>", "Deleted" },
                w = { "<cmd>Gitsigns toggle_word_diff<cr>", "Word-diff" },
            },
            u = {
                "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
                "Undo Stage Hunk",
            },
            d = {
                "<cmd>Gitsigns diffthis HEAD<cr>",
                "Diff",
            },
        },
        h = {
            name = "Hub",
            g = { "<cmd>Telescope gh gist<cr>", "Gist" },
            p = {
                name = "Pull-requests...",
                r = { "<cmd>Telescope gh pull_request<cr>", "Manage Pull-Request" },
                f = { "<cmd>Telescope gh pull_request_files<cr>", "Search Pull-Request files" }, -- TODO broken...
            },
            s = { "<cmd>Telescope gh secret<cr>", "Manage GH Secrets" },
            i = { "<cmd>Telescope gh issues<cr>", "Manage GH issues" },
            r = { "<cmd>Telescope gh run<cr>", "View details about Running workflows" },
        },
        e = { "<cmd>Telescope gitmoji<cr>", "Emoji" },
        f = { "<cmd>GitGutterFold<cr>", "Fold" },
        l = { "<cmd>lua _LAZYGIT_TOGGLE()<cr>", "Lazygit" },
        p = { "<cmd>lua _GITPUSH_TOGGLE()<cr>", "Insta-Push" },
        o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
        c = {
            name = "Checkout",
            b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
            c = {
                name = "Commits",
                d = { "<cmd>Telescope git_commits<cr>", "Checkout Directory commit(s)" },
                b = { "<cmd>Telescope git_bcommits<cr>", "Checkout Buffer commit(s)" },
            },
        },
        t = {
            name = "Telescopes",
            -- Searches through Git tracked filek in this project.
            f = { "<cmd>Telescope git_files<cr>", "Search project files" },
            s = { "<cmd>Telescope git_stash<cr>", "Search project stashes" },
        }
    },
    l = {
        name = "LSP",
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
        d = {
            "<cmd>Telescope lsp_document_diagnostics<cr>",
            "Document Diagnostics",
        },
        w = {
            "<cmd>Telescope lsp_workspace_diagnostics<cr>",
            "Workspace Diagnostics",
        },
        f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format" },
        i = { "<cmd>LspInfo<cr>", "Info" },
        I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
        j = {
            "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
            "Next Diagnostic",
        },
        k = {
            "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
            "Prev Diagnostic",
        },
        l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
        q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
        r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
        S = {
            "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
            "Workspace Symbols",
        },
    },
    s = {
        name = "Telescope-Searches",
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
        e = { "<cmd>Telescope emoji<cr>", "Emoji" },
        h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
        M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
        p = { "<cmd>Telescope projects<cr>", "Projects" },
        r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
        R = { "<cmd>Telescope registers<cr>", "Registers" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        C = { "<cmd>Telescope commands<cr>", "Commands" },
    },

    t = {
        name = "Terminal",
        b = { "<cmd>lua _BTOP_TOGGLE()<cr>", "Btop" },
        j = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node.Js" },
        n = { "<cmd>lua _NETHOGS_TOGGLE()<cr>", "Nethogs" },
        -- n = { "<cmd>lua _NCDU_TOGGLE()<cr>", "Ncdu" }, -- Was NOT working.
        h = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
        p = { "<cmd>lua _PYTHON3_TOGGLE()<cr>", "Python3" },
        i = { "<cmd>lua _IPYTHON_TOGGLE()<cr>", "I-Python" },
        m = { "<cmd>lua _NMON_TOGGLE()<cr>", "nMon" },
        v = { "<cmd>lua _VIFM_TOGGLE()<cr>", "Vifm" },
        V = { "<cmd>lua _VIT_TOGGLE()<cr>", "Vit" },
        e = {
            name = "Empty-shell",
            f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
            h = { "<cmd>ToggleTerm size=15 direction=horizontal<cr>", "Horizontal" },
            v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
        },
    },
}

local vopts = {
    mode = "v", -- VISUAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}
local vmappings = {
    ["/"] = { '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>', "Comment" },
}

which_key.setup(setup)
which_key.register(mappings, opts)
which_key.register(vmappings, vopts)
