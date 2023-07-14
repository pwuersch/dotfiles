local wk = require('which-key')

wk.setup({
	plugins = {
			marks = true, -- shows a list of your marks on ' and `
			registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
			spelling = {
				enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
				suggestions = 20, -- how many suggestions should be shown in the list?
			},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = true, -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	  -- add operators that will trigger motion and text object completion
	  -- to enable all native operators, set the preset / operators plugin above
	operators = { gc = "Comments" },
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
		scroll_down = '<c-d>', -- binding to scroll down inside the popup
		scroll_up = '<c-u>', -- binding to scroll up inside the popup
	},
	window = {
		border = "single", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
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
})

-- mappings
vim.g.mapleader = ' '

wk.register({
	f = {
		name = "Telescope",
		f = { '<cmd>Telescope find_files find_command=rg,--files<cr>', "Find Files" },
    a = { '<cmd>Telescope find_files find_command=rg,--files,--hidden<cr>', "Find Files (All)"},
    g = { "<cmd>Telescope git_files<cr>", "Find Files (Git)" },
		t = { "<cmd>Telescope live_grep<cr>", "Search Text" },
		b = { "<cmd>Telescope file_browser<cr>", "Browse Files" },
		h = { "<cmd>Telescope help_tags<cr>", "Search Help Tags" },
    u = { "<cmd>Telescope buffers<cr>", "Search Buffers" },
    p = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Search Workspace Symbols" },
    d = { "<cmd>Telescope git_status<cr>", "Search Git Diff" },
	},
  g  = {
    name = "Git Actions",
    g = { "<cmd>LazyGit<cr>", "Open LazyGit" },
  },
	p = {
		name = "Packer",
		s = { "<cmd>PackerStatus<cr>", "Packer Status" },
		S = { "<cmd>PackerSync<cr>", "Packer Sync" },
    b = { "<cmd>Telescope packer<cr>", "List Packages with Telescope" },
	},
	['<leader>'] = {
		name = "Special Operations",
		s = { "<cmd>so %<cr>", "Source current File" },
		r = { "<cmd>call number_set#relative_numb()<cr>", "Set Relativ Number" },
		n = { "<cmd>call number_set#normal_numb()<cr>", "Set Number" },
		i = { "<cmd>IndentBlanklineToggle<cr>", "Toggle Indent Line" },
	},
	x = {
		name = 'Trouble',
		x = { '<cmd>TroubleToggle<cr>', 'Toggle Trouble' },
		q = { '<cmd>TroubleToggle quickfix<cr>', 'Quickfix' },
		d = { '<cmd>TroubleToggle document_diagnostics<cr>', 'Doc Diagnostic' },
	},
	a = {
		name = 'Aerial',
		a = { '<cmd>AerialOpen<cr>', 'Open Aerial' },
		t = { '<cmd>AerialToggle<cr>', 'Toggle Aerial' },
	},
	q = {
		name = 'Quit',
		q = { "<cmd>q<cr>", "Quit" },
		f = { "<cmd>q!<cr>", "Unsaved Quit" },
		w = { "<cmd>wq<cr>", "Save Quit" },
	},
  l = {
    name = "Code",
    r = { "<cmd>Trouble lsp_references<cr>", "Trouble References" },
    a = { "<cmd>Telescope lsp_code_actions<CR>", "Code Action" },
    d = { "<cmd>Telescope diagnostics<CR>", "Diagnostics" },
    f = { "<cmd>Lspsaga lsp_finder<CR>", "Finder" },
    i = { "<cmd>LspInfo<CR>", "Lsp Info" },
    n = { "<cmd>Lspsaga rename<CR>", "Rename" },
    R = { "<cmd>Telescope lsp_references<CR>", "Telescope References" },
  },
}, { mode = 'n', prefix = "<leader>" })

wk.register({
	['<C-t>'] = { "<cmd>NvimTreeToggle<cr>", "Toggle Nvim-Tree" },
	['<C-a>'] = { "<cmd>call run_file#Run_File()<cr>", "Run File" },
	['<C-s>'] = { "<cmd>:update<cr>", "Save File" },
	['<C-h>'] = { "<cmd>WhichKey<cr>", "Toggle WhichKey"},
	['<ESC>'] = { "<cmd>nohl<cr>", "Remove Search Highlights" },
  ['<S-l>'] = { "<cmd>BufferLineCycleNext<cr>", "Next buffer tab" },
  ['<S-h>'] = { "<cmd>BufferLineCyclePrev<cr>", "Previous buffer tab" },
  ['>b'] = { "<cmd>BufferLineMoveNext<cr>", "Move buffer tab right" },
  ['<b'] = { "<cmd>BufferLineMovePrev<cr>", "Move buffer tab left" },
}, { mode = 'n' })

wk.register({
	jj = { "<ESC>", "ESC" },
  ['<C-s>'] = { "<cmd>:update<cr>", "Save file" },
}, { mode = 'i' })

wk.register({
	['<C-c>'] = { '"*y<cr>', "Copy" },
}, { mode = 'v' })

