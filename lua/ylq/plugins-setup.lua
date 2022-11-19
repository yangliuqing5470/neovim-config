local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
    return
end

return packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  -- lua functions that many plugins use
  use 'nvim-lua/plenary.nvim'
  -- colortheme
  use 'bluz71/vim-nightfly-colors'
  -- tmux & split window navigation
  use 'christoomey/vim-tmux-navigator'
  -- maximizes and restores current window
  use 'szw/vim-maximizer'
  -- surroundings
  use 'tpope/vim-surround'
  -- commenting with gc
  use 'numToStr/Comment.nvim'
  -- file explorer
  use 'nvim-tree/nvim-tree.lua'
  -- icons
  use 'nvim-tree/nvim-web-devicons'
  -- statusline
  use 'nvim-lualine/lualine.nvim'
  -- fuzzy finding
  use ({'nvim-telescope/telescope-fzf-native.nvim', run='make'})
  use ({'nvim-telescope/telescope.nvim', branch = '0.1.x'})
  -- autocompletion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp'
  -- snippets
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'
  -- manageing & installing lsp servers
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  -- configuration lsp servers
  use 'neovim/nvim-lspconfig'
  use ({'glepnir/lspsaga.nvim', branch='main'})
  use 'onsails/lspkind.nvim'
  -- treesitter
  use ({
      'nvim-treesitter/nvim-treesitter',
      run = function()
          require('nvim-treesitter.install').update({with_sync = true})
      end,
  })
  -- auto closing
  use 'windwp/nvim-autopairs'
  -- git signs plugin
  use 'lewis6991/gitsigns.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
