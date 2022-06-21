vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.exrc = true
vim.opt.relativenumber = true
vim.opt.nu = true
vim.opt.hidden = true
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.scrolloff = 5
vim.opt.completeopt = 'menuone,noinsert,noselect'
vim.opt.signcolumn = 'yes'
vim.opt.cmdheight = 0
vim.opt.updatetime = 50
vim.opt.shortmess = vim.o.shortmess .. 'c'
vim.opt.laststatus = 3
vim.opt.mouse = 'a'

--Not working options:
--vim.opt.nohlsearch = true
--vim.opt.noerrorbells = true
--vim.opt.nowrap = true
--vim.opt.noswapfile = true
--vim.opt.nobackup = true
--vim.opt.noshowmode = true

--let g:dashboard_default_executive = 'telescope.nvim'
--let g:mapleader = ' '

--Enable theming support
if vim.fn.has("termguicolors") == 1 then
  vim.opt.termguicolors = true
end

--use alt+hjkl to move between split/vsplit panels
vim.cmd([[
  tnoremap <A-h> <C-\><C-n><C-w>h
  tnoremap <A-j> <C-\><C-n><C-w>j
  tnoremap <A-k> <C-\><C-n><C-w>k
  tnoremap <A-l> <C-\><C-n><C-w>l
  nnoremap <A-h> <C-w>h
  nnoremap <A-j> <C-w>j
  nnoremap <A-k> <C-w>k
  nnoremap <A-l> <C-w>l  
]])

vim.cmd('colorscheme onedark')
