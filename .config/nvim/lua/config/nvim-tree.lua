require('nvim-tree').setup({
  sort_by = 'case_sensitive',
  diagnostics = {
    enable = true,
  },
  view = {
    adaptive_size = true,
    preserve_window_proportions = true,
  },
  renderer = {
    group_empty = true,
    add_trailing = true,
    highlight_git = true,
    highlight_opened_files = "all",
    indent_markers = {
      enable = true
    }
  },
})

vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
      vim.cmd("quit")
    end
  end
})
