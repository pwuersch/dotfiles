require('impatient').enable_profile()

require('plugins')

require('opts')

require('mappings')

vim.cmd([[
  augroup RestoreCursorShapeOnExit
    autocmd!
    autocmd VimLeave * set guicursor=a:ver20
  augroup END
]])
