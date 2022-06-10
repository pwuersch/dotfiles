local telescope = require('telescope')

telescope.setup({
  extensions = {
    packer = {},
    file_browser = {
      theme = "ivy",
      hijack_netrw = true,
    },
    lazygit = {},
  }
})

telescope.load_extension('packer')
telescope.load_extension('file_browser')
telescope.load_extension('lazygit')
