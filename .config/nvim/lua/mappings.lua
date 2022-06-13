local wk = require('which-key')
vim.g.mapleader = ' '

-- wk.register(mapping, opts)
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
}, { mode = 'n' })

wk.register({
	jj = { "<ESC>", "ESC" },
  ['<C-s>'] = { "<cmd>:update<cr>", "Save file" },
}, { mode = 'i' })

wk.register({
	['<C-c>'] = { '"*y<cr>', "Copy" },
}, { mode = 'v' })
