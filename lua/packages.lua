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

-- Use a protected call so we don"t error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
    prompt_border = "rounded", -- Border style of prompt popups.
  },
}

packer.startup(function()
  use "wbthomason/packer.nvim"

  -- Lua requirements
  use "nvim-lua/plenary.nvim"

  use "kyazdani42/nvim-web-devicons"
  use "goolord/alpha-nvim"
  use "lukas-reineke/indent-blankline.nvim"

  -- cmp plugins
  use {
    "hrsh7th/nvim-cmp",
    --commit = "d93104244c3834fbd8f3dd01da9729920e0b5fe7",
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
  use "neovim/nvim-lspconfig"
  --use "williamboman/nvim-lsp-installer"
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "jose-elias-alvarez/null-ls.nvim"
  use "ray-x/lsp_signature.nvim"
  use "SmiteshP/nvim-navic"
  use "folke/trouble.nvim"
  use "j-hui/fidget.nvim"

  use "RRethy/vim-illuminate"

  -- Comment
  use "numToStr/Comment.nvim"

  -- Terminal
  use "akinsho/toggleterm.nvim"

  -- Project
  use "windwp/nvim-spectre"

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-ui-select.nvim"
  use "nvim-telescope/telescope-file-browser.nvim"

  -- Keybinding
  use "folke/which-key.nvim"

  -- Editing support
  use "windwp/nvim-autopairs"
  use "NvChad/nvim-colorizer.lua"
  use "karb94/neoscroll.nvim"

  -- File Explorer
  use "kyazdani42/nvim-tree.lua"

  -- Buffer Switching
  use "ghillb/cybu.nvim"

  -- Themes
  use "folke/tokyonight.nvim"
  use "lunarvim/darkplus.nvim"
  use "shaunsingh/nord.nvim"
  use "EdenEast/nightfox.nvim"

  use "nvim-lualine/lualine.nvim"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use "p00f/nvim-ts-rainbow"
  -- use {"christianchiarulli/nvim-ts-rainbow"}
  --  use "nvim-treesitter/playground"
  use "windwp/nvim-ts-autotag"
  -- use "romgrk/nvim-treesitter-context"
  use "mizlan/iswap.nvim"
  use "kylechui/nvim-surround"

  -- bufferline
  -- use "akinsho/bufferline.nvim"

  -- Notify
  use "rcarriga/nvim-notify"

  -- Git
  use "f-person/git-blame.nvim"
  use "lewis6991/gitsigns.nvim"
  use "ruifm/gitlinker.nvim"
  use "mattn/vim-gist"
  use "mattn/webapi-vim"
  -- use "https://github.com/rhysd/conflict-marker.vim"
  use "TimUntersberger/neogit"
  use "sindrets/diffview.nvim"

  -- DAP
  use "mfussenegger/nvim-dap"
  -- use "theHamsta/nvim-dap-virtual-text"
  use "rcarriga/nvim-dap-ui"
  use "Pocco81/DAPInstall.nvim"

  -- Helpers
  use "famiu/bufdelete.nvim"

  -- Viewers
  use "nacro90/numb.nvim"

  -- Markdown
  use {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
  }

end)
