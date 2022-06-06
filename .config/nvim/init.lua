require('impatient').enable_profile()

require('opts')

require('plugins')

require('mappings')

require('lsp')

--Enable theming support
if vim.fn.has("termguicolors") == 1 then
  vim.opt.termguicolors = true
end

--Theme
vim.cmd('colorscheme onedark')

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
