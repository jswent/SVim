local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local dashboard = require "alpha.themes.dashboard"

local function button(sc, txt, keybind, keybind_opts)
  local b = dashboard.button(sc, txt, keybind, keybind_opts)
  b.opts.hl_shortcut = "Macro"
  return b
end

local icons = require "config.icons"

-- Set header
dashboard.section.header.val = {
    "                                  ",
    "  ███████╗██╗   ██╗██╗███╗   ███╗ ",
    "  ██╔════╝██║   ██║██║████╗ ████║ ",
    "  ███████╗██║   ██║██║██╔████╔██║ ",
    "  ╚════██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    "  ███████║ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    "  ╚══════╝  ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "                                  ",
}

-- Set menu
dashboard.section.buttons.val = {
    dashboard.button("f", icons.documents.Files .. "  > Find file", ":Telescope find_files <CR>"),
    dashboard.button("r", icons.ui.History .. "  > Recent files", ":Telescope oldfiles <CR>"),
    dashboard.button("g", icons.ui.List .. "  > Project Grep", ":Telescope live_grep <CR>"),
    dashboard.button("u", "  > Update plugins" , ":PackerSync<CR>"),
    dashboard.button("e", icons.ui.NewFile .. "  > New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("c", icons.ui.Gear .. "  > Config", ":e ~/.config/nvim/init.lua <CR>"),
    dashboard.button("q", icons.diagnostics.Error .. "  > Quit", ":qa<CR>"),
}

-- local fortune = require("alpha.fortune")
-- dashboard.section.footer.val = fortune()

local text = require "utils.text"
local svim_version = require("utils.git").get_svim_version()

dashboard.section.footer.val = text.align_center({ width = 0 }, {
    "",
    "jwswent.com",
    svim_version,
  }, 0.5)

dashboard.section.footer.opts.hl = "Type"
dashboard.section.footer.opts.position = "center"
dashboard.section.header.opts.hl = "Keyword"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true

-- Send config to alpha
alpha.setup(dashboard.opts)
