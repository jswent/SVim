local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local custom = require('lualine.themes.nightfox') 
custom.normal.a.bg = "#23a9d5"

local theme = os.getenv("NVIM_THEME") 
if(theme == "nord" or vim.fn.has("gui_vimr") == 1) then
  custom = "nord" 
elseif(theme == "tokyonight") then
  custom = "tokyonight"
end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = custom,
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline", "toggleterm", "TelescopePrompt" },
    always_divide_middle = true,
    globalstatus = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
