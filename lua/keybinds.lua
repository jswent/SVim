local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Remap space as leader
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- saving
keymap('n', '<c-s>', ':wq<CR>', {})
keymap('i', '<c-s>', '<Esc>:w<CR>a', {})

-- navigate windows
keymap('n', '<c-j>', '<c-w>j', opts)
keymap('n', '<c-h>', '<c-w>h', opts)
keymap('n', '<c-k>', '<c-w>k', opts)
keymap('n', '<c-l>', '<c-w>l', opts)

-- noremap space
keymap('n', '<space>', '', opts)

-- better indenting
keymap('v', '<', '<gv', { noremap = true, silent = true})
keymap('v', '>', '>gv', { noremap = true, silent = true})

-- remove buffer 
keymap('n', 'Q', '<cmd>Bdelete<cr>', opts)
