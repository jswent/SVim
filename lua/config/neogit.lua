local neogit = require "neogit"

neogit.setup {
  disable_signs = false,
  disable_hint = true,
  disable_context_highlighting = false,
  disable_commit_confirmation = true,
  -- Neogit refreshes its internal state after specific events, which can be expensive depending on the repository size.
  -- Disabling `auto_refresh` will make it so you have to manually refresh the status after you open it.
  auto_refresh = true,
  disable_builtin_notifications = false,
  use_magit_keybindings = false,
  -- Change the default way of opening neogit
  kind = "tab",
  -- Change the default way of opening the commit popup
  commit_popup = {
    kind = "split",
  },
  -- Change the default way of opening popups
  popup = {
    kind = "split",
  },
  -- customize displayed signs
  signs = {
    -- { CLOSED, OPENED }
    section = { ">", "v" },
    item = { ">", "v" },
    hunk = { "", "" },
  },
  integrations = {
    diffview = true,
  },
  -- Setting any section to `false` will make the section not render at all
  sections = {
    untracked = {
      folded = false,
      hidden = false
    },
    unstaged = {
      folded = false,
      hidden = false
    },
    staged = {
      folded = false,
      hidden = false
    },
    stashes = {
      folded = true,
      hidden = false
    },
    unpulled = {
      folded = true,
      hidden = false 
    },
    unmerged = {
      folded = false,
      hidden = false
    },
    recent = {
      folded = true,
      hidden = false
    },
  },
  -- override/add mappings
  mappings = {
    -- modify status buffer mappings
    status = {
      ["q"] = "Close",
      ["1"] = "Depth1",
      ["2"] = "Depth2",
      ["3"] = "Depth3",
      ["4"] = "Depth4",
      ["<tab>"] = "Toggle",
      ["x"] = "Discard",
      ["s"] = "Stage",
      ["a"] = "StageUnstaged",
      ["<c-s>"] = "StageAll",
      ["u"] = "Unstage",
      ["U"] = "UnstageStaged",
      ["d"] = "DiffAtFile",
      ["$"] = "CommandHistory",
      ["<c-r>"] = "RefreshBuffer",
      ["o"] = "GoToFile",
      ["<enter>"] = "Toggle",
      ["<c-v>"] = "VSplitOpen",
      ["<c-x>"] = "SplitOpen",
      ["<c-t>"] = "TabOpen",
      -- ["<space>"] = "Stage",
      -- Removes the default mapping of "s"
      -- ["s"] = "",
    },
  },
}
