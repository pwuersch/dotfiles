vim.cmd('packadd packer.nvim')

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local function use_config(name)
  return function() 
    require('config.' .. name)
  end
end

local function defer_to_autocmd(event, loader)
  return function()
    vim.api.nvim_create_autocmd(event, {
      callback = function()
        vim.defer_fn(function()
          vim.cmd(loader)
        end, 100)
      end
    })
  end
end

return require('packer').startup({
  function(use)
    use { 'wbthomason/packer.nvim' }
    use { 'lewis6991/impatient.nvim' }

    use { 'dracula/vim' }
    use { 'joshdick/onedark.vim' }
    
    -- use { 'ray-x/go.nvim' }
    -- use { 'leafgarland/typescript-vim' }
    -- use { 'peitalin/vim-jsx-typescript' }

    use { 'ryanoasis/vim-devicons' }
    use {
      'folke/which-key.nvim',
      config = function() require('config.which-key') end,
    }
    use { 'neovim/nvim-lspconfig' }
    use { 'hrsh7th/cmp-nvim-lsp', module = 'cmp_nvim_lsp' }
    use { 'hrsh7th/nvim-cmp' }
    use { 'hrsh7th/cmp-vsnip', event = { 'InsertEnter', 'CmdlineEnter' } }
    use { 'hrsh7th/cmp-path', event = { 'InsertEnter', 'CmdlineEnter' } }
    use { 'hrsh7th/cmp-buffer', event = { 'InsertEnter', 'CmdlineEnter' } }

    use { 'hashivim/vim-terraform' }

    use { 'nvim-lua/popup.nvim' }
    use { 'nvim-lua/plenary.nvim', module = 'plenary' }
    use { 'nvim-telescope/telescope.nvim' }

    use {
      'nvim-treesitter/nvim-treesitter',
      config = function() require('config.treesitter') end,
      run = "TSUpdate",
    }
    use {
      'nvim-lualine/lualine.nvim',
      config = function() require('config.lualine') end,
    }

    use {
      'windwp/nvim-autopairs',
      config = function() require('config.autopairs') end,
      event = { 'InsertEnter' },
      opt = true,
    }
  end,

  config = {
	  display = {
		  open_fn = function()
			  return require('packer.util').float({ border = 'rounded' })
		  end
	  }
  }
})
