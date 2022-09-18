local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
---@diagnostic disable-next-line: missing-parameter
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packages.lua source <afile> | PackerSync
  augroup end
]]

require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use {'kyazdani42/nvim-web-devicons'}
  use {
    'goolord/alpha-nvim', 
    event = "VimEnter",
    config = [[require('config.alpha-nvim')]]
  }
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = [[require('config.indent-blankline')]]
  }

  -- cmp plugins
  use {
    "hrsh7th/nvim-cmp",
    --commit = "d93104244c3834fbd8f3dd01da9729920e0b5fe7",
    config = [[require('config.cmp')]]
  } -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-emoji"
  use "hrsh7th/cmp-nvim-lua"

  -- Java
  use "mfussenegger/nvim-jdtls"

  -- LSP
  use {
    "neovim/nvim-lspconfig",
    config = [[require('config.lsp')]]
  }
  --use "williamboman/nvim-lsp-installer"
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "jose-elias-alvarez/null-ls.nvim"
  use "ray-x/lsp_signature.nvim"
  use "folke/trouble.nvim"
  
  use {
    "RRethy/vim-illuminate",
    config = [[require('config.illuminate')]]
  }

  -- Telescope
  use {
      'nvim-telescope/telescope.nvim',
      module = "telescope",
      requires = {{'nvim-lua/plenary.nvim'}},
      cmd = "Telescope",
      config = [[require('config.telescope')]]
  }
  use { "nvim-telescope/telescope-ui-select.nvim" }
  use { "nvim-telescope/telescope-file-browser.nvim" }

  use {"folke/which-key.nvim",
  event = "VimEnter",
  config = function()
    vim.defer_fn(function() require('config.which-key') end, 2000)
  end
  }

  use {
    "windwp/nvim-autopairs",
    config = [[require('config.nvim-autopairs')]]
  }

  use {
    "NvChad/nvim-colorizer.lua",
    config = [[require('config.colorizer')]]
  }

  use {
    'kyazdani42/nvim-tree.lua',
    config = [[require('config.nvim-tree')]]
  }

  use {"lunarvim/darkplus.nvim"}
  use 'shaunsingh/nord.nvim'
  use 'EdenEast/nightfox.nvim'
  use "antoinemadec/FixCursorHold.nvim"

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true, }, 
    config = [[require('config.lualine')]]
  }

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = [[require('config.treesitter')]]
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use { "p00f/nvim-ts-rainbow" }
  -- use {'christianchiarulli/nvim-ts-rainbow'}
  --  use "nvim-treesitter/playground"
  use "windwp/nvim-ts-autotag"
  use "romgrk/nvim-treesitter-context"
  use "mizlan/iswap.nvim"
  
  -- bufferline
  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = [[require('config.bufferline')]]
  }

  -- Notify
  use {
    'rcarriga/nvim-notify',
    config = [[require('config.notify')]]
  }

  -- Git
  use {
    "f-person/git-blame.nvim",
    config = [[require('config.git-blame')]]
  }
  use {
    "lewis6991/gitsigns.nvim",
    config = [[require('config.gitsigns')]]
  }
  use {
    "ruifm/gitlinker.nvim",
    config = [[require('config.gitlinker')]]
  }
  use "mattn/vim-gist"
  use "mattn/webapi-vim"
  use "https://github.com/rhysd/conflict-marker.vim"

  -- DAP
  use "mfussenegger/nvim-dap"
  -- use "theHamsta/nvim-dap-virtual-text"
  use "rcarriga/nvim-dap-ui"
  use "Pocco81/DAPInstall.nvim"

end)
