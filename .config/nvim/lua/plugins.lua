vim.cmd('packadd packer.nvim')

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup({
  function(use)
    use { 'wbthomason/packer.nvim' }
    use { 'lewis6991/impatient.nvim' }

    use {
      'glepnir/dashboard-nvim',
      config = function()
      	require('config.dashboard')
      end
    }

    -- Themes
    use {
      { 'joshdick/onedark.vim' },
      { 'morhetz/gruvbox', cmd = 'colorscheme'},
      { 'shaunsingh/nord.nvim', cmd = 'colorscheme' },
      { 'NLKNguyen/papercolor-theme', cmd = 'colorscheme' },
      { 'ghifarit53/tokyonight-vim', cmd = 'colorscheme' },
      { 'sainnhe/everforest', cmd = 'colorscheme' },
      { 'rmehri01/onenord.nvim', cmd = 'colorscheme' },
      { 'dracula/vim', as = 'dracula' },
      { 'catppuccin/nvim', as = 'catppuccin' },
    }

    -- which-key
    use {
      'folke/which-key.nvim',
      config = function() require('config.which-key') end,
    }

    -- lsp
    use {
      'neovim/nvim-lspconfig',
      config = function()
        require('config.lsp')
      end,
      requires = {
        'williamboman/nvim-lsp-installer'
      }
    }

    -- completion
    use {
      'hrsh7th/nvim-cmp',
      config = function()
        require('config.completion')
      end,
      requires = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-calc',
        'hrsh7th/cmp-emoji',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lsp-signature-help',
        'saadparwaiz1/cmp_luasnip',
        'f3fora/cmp-spell',
        'petertriho/cmp-git',
        'rafamadriz/friendly-snippets',
        'L3MON4D3/LuaSnip',
      }
    }

    -- completion kinds
    use { 'onsails/lspkind.nvim' }


    -- telescope popup
    use {
      'nvim-lua/popup.nvim',
    }

    -- telescope
    use {
      'nvim-telescope/telescope.nvim',
      config = function()
        require('config.telescope')
      end,
      requires = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-packer.nvim',
        'nvim-telescope/telescope-file-browser.nvim',
        'kdheepak/lazygit.nvim'
      }
    }

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
      'lewis6991/gitsigns.nvim',
      config = function() require('config.gitsigns') end,
    }

    use {
      'windwp/nvim-autopairs',
      config = function() require('config.autopairs') end,
      event = { 'InsertEnter' },
      opt = true,
    }

    use {
      'folke/trouble.nvim',
      event = "BufReadPre",
      requires = 'kyazdani42/nvim-web-devicons',
      cmd = { 'TroubleToggle', 'Trouble' },
      config = function() require('config.trouble') end,
    }

    use {
      'akinsho/bufferline.nvim',
      tag = 'v2.*',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function()
        require('config.bufferline')
      end
    }

    use {
      'kyazdani42/nvim-tree.lua',
      requires = 'kyazdani42/nvim-web-devicons',
      tag = 'nightly',
      config = function()
        require("config.nvim-tree")
      end
    }

    use {
      'APZelos/blamer.nvim',
      event = 'BufEnter'
    }

    use {
      'tami5/lspsaga.nvim',
      event = 'VimEnter',
      cmd = { 'Lspsaga' },
      config = function() require('config.lspsaga') end,
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
