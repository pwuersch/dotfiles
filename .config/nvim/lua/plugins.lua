-- bootstrapping packer
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end

vim.cmd('packadd packer.nvim')

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile profile=false
  augroup end
]])

return require('packer').startup({
  function(use)
    use { 'wbthomason/packer.nvim' }
    use { 'lewis6991/impatient.nvim' }

    use {
      'glepnir/dashboard-nvim',
      config = function() require('config.dashboard') end
    }

    -- Themes
    use {
      { 'joshdick/onedark.vim' },
      { 'morhetz/gruvbox', opt = true },
      { 'shaunsingh/nord.nvim', opt = true },
      { 'NLKNguyen/papercolor-theme', opt = true },
      { 'ghifarit53/tokyonight-vim', opt = true },
      { 'sainnhe/everforest', opt = true },
      { 'rmehri01/onenord.nvim', opt = true },
      { 'dracula/vim', as = 'dracula', opt = true },
      { 'catppuccin/nvim', as = 'catppuccin', opt = true },
    }

    -- which-key
    use {
      'folke/which-key.nvim',
      config = function() require('config.which-key') end,
    }

    -- lsp
    use {
      'neovim/nvim-lspconfig',
      event = 'BufEnter',
      config = function() require('config.lsp') end,
      requires = {
        'williamboman/nvim-lsp-installer',
        'hrsh7th/cmp-nvim-lsp'
      }
    }

    -- completion
    use {
      'hrsh7th/nvim-cmp',
      event = 'InsertEnter',
      config = function() require('config.completion') end,
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
        'onsails/lspkind.nvim',
      }
    }

    -- lazygit
    use {
      'kdheepak/lazygit.nvim'
    }


    -- telescope
    use {
      'nvim-telescope/telescope.nvim',
      config = function() require('config.telescope') end,
      requires = {
        'nvim-lua/plenary.nvim',
      }
    }

    -- -- telescope extensions
    -- use {
    --   'nvim-telescope/telescope-packer.nvim',
    --   cmd = 'Telescope',
    --   config = function() require('config.telescope-packer') end,
    -- }

    -- use {
    --   'nvim-telescope/telescope-file-browser.nvim',
    --   cmd = 'Telescope',
    --   config = function() require('config.telescope-file-browser') end
    -- }

    -- treesitter
    use {
      'nvim-treesitter/nvim-treesitter',
      event = "BufEnter",
      config = function() require('config.treesitter') end,
      run = "TSUpdate",
    }

    -- statusline
    use {
      'nvim-lualine/lualine.nvim',
      config = function() require('config.lualine') end,
    }

    -- git status
    use {
      'lewis6991/gitsigns.nvim',
      event = 'BufEnter',
      config = function() require('config.gitsigns') end,
    }

    -- autopairs
    use {
      'windwp/nvim-autopairs',
      event = 'InsertEnter',
      config = function() require('config.autopairs') end,
    }

    -- trouble lsp interface
    use {
      'folke/trouble.nvim',
      event = "BufEnter",
      requires = 'kyazdani42/nvim-web-devicons',
      cmd = { 'TroubleToggle', 'Trouble' },
      config = function() require('config.trouble') end,
    }

    -- bufferline tabs
    use {
      'akinsho/bufferline.nvim',
      tag = 'v2.*',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function() require('config.bufferline') end
    }

    -- git blame in files
    use {
      'APZelos/blamer.nvim',
      event = 'BufEnter'
    }

    -- lsp actions and visuals
    use {
      'tami5/lspsaga.nvim',
      event = 'VimEnter',
      cmd = { 'Lspsaga' },
      config = function() require('config.lspsaga') end,
    }

    -- Automatically set up configuration after cloning packer.nvim
    if packer_bootstrap then
      require('packer').sync()
    end
  end,

  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'rounded' })
      end
    }
  }
})
