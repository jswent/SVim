vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.wrap = false
vim.opt.scrolloff = 5
vim.opt.fileencoding = 'utf-8'
vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.opt.showmode = false
vim.opt.showtabline = 2

--set default notify function
vim.notify = require('notify')

-- set color of fillchars to blankss
-- vim.wo.fillchars='eob: '
vim.cmd[[set fillchars=fold:\ ,vert:\│,eob:\ ,msgsep:‾]]

-- enable mouse use
vim.cmd[[set mouse=a]]

-- set global statusline
vim.cmd[[set laststatus=3]]

-- set nord theme options
vim.g.nord_contrast = true
vim.g.nord_borders = true
vim.g.nord_disable_background = false
vim.g.nord_italic = false

-- vimwiki options (move to config file later)
vim.g.vimwiki_global_ext = 0

-- Load the colorscheme
local theme = os.getenv("NVIM_THEME") 
if(theme == "nord") then
  require('nord').set() 
elseif(theme == "nightfox") then
  require('config.nightfox') 
else 
  vim.cmd[[colorscheme custom]]
end

-- Load vimr settings
if(vim.fn.has("gui_vimr") == 1) then
  vim.cmd[[colorscheme nord]]
end
