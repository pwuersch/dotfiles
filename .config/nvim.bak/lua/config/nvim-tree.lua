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
