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
    dashboard.button("<Leader> f f", icons.documents.Files .. " Find file", ":Telescope find_files <CR>"),
    dashboard.button("<Leader> f r", icons.ui.History .. " Recent files", ":Telescope oldfiles <CR>"),
    dashboard.button("<Leader> f g", icons.ui.List .. " Project Grep", ":Telescope live_grep <CR>"),
    dashboard.button("u", " Update plugins" , ":PackerSync<CR>"),
    dashboard.button("e", icons.ui.NewFile .. " New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("<Leader> n v m", icons.ui.Gear .. " Config", ":e ~/.config/nvim/init.lua <CR>"),
    dashboard.button("q", icons.diagnostics.Error .. " Quit", ":qa<CR>"),
}

-- local fortune = require("alpha.fortune")
-- dashboard.section.footer.val = fortune()

  local function footer()
    return "Powered by Swent Technologies -- Release 0.1.0"
  end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Keyword"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true

-- Send config to alpha
alpha.setup(dashboard.opts)
