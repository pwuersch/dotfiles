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
    use { 'hashivim/vim-terraform' }
    use { 'scrooloose/nerdtree' }
    use { 'ryanoasis/vim-devicons' }
    use { 'junegunn/fzf' }
    use { 'junegunn/fzf.vim' }
    use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }
  end,
  config = {
	  display = {
		  open_fn = function()
			  return require('packer.util').float({ border = 'rounded' })
		  end
	  }
  }
})
