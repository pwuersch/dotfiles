vim.cmd('packadd packer.nvim')

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

vim.g.coc_global_extensions = {
  'coc-json',
  'coc-git',
  '@yaegassy/coc-volar',
  '@yaegassy/coc-volar-tools',
  'coc-markdownlint',
  'coc-prettier',
  'coc-html',
  'coc-emmet',
  'coc-css',
  'coc-rust-analyzer'
}

return require('packer').startup({function(use)
   use { 'wbthomason/packer.nvim' }
   use { 'lewis6991/impatient.nvim' }
   use { 'dracula/vim' }
   use { 'joshdick/onedark.vim' }
   use { 'neoclide/coc.nvim', branch = 'release' }
   use { 'ray-x/go.nvim' }
   use { 'leafgarland/typescript-vim' }
   use { 'peitalin/vim-jsx-typescript' }
   use { 'scrooloose/nerdtree' }
   use { 'ryanoasis/vim-devicons' }
   use { 'folke/which-key.nvim', config = function() require 'whichkey' end }
   use { 'nvim-lua/plenary.nvim' }
   use { 'neovim/nvim-lspconfig' }
   use { 'nvim-telescope/telescope.nvim' }
   use { 'nvim-treesitter/nvim-treesitter', config = function() require "tree-sitter" end, run = "TSUpdate" }
   use { 'windwp/nvim-autopairs', setup = function()
      vim.api.nvim_create_autocmd("InsertEnter", {
        callback = function()
          vim.defer_fn(function()
            vim.cmd([[
						PackerLoad nvim-autopairs 
						]])
          end, 100)
        end,
      })
    end,
    config = function()
      require 'auto-pairs'
    end,
    opt = true
  }
  use { 'nvim-lualine/lualine.nvim', config = function () require 'lua-line' end }
  end,
  config = {
	  display = {
		  open_fn = function()
			  return require('packer.util').float({ border = 'rounded' })
		  end
	  }
  }
})
