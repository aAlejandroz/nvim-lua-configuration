-- Keymaps for better default experience

-- See `:help vim.keymap.set()`

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

local defaultOpts = { silent = true, noremap = true }

-- Save file using traditional CTRL + s
vim.keymap.set("n", "<C-s>", "<cmd> w <CR>", { desc = "Uses traditional method of saving using Control and s keys" })

-- Quit file using CTRL + q
vim.keymap.set("n", "<C-q>", "<cmd> q <CR>", { desc = "Quit using control and q keys" })

-- Delete single character (using x) WITHOUT it copying the char to the clipboard
vim.keymap.set("n", "x", '"_x', defaultOpts)

-- Vertical scroll and center
vim.keymap.set("n", "<C-d>", "<C-d>zz", defaultOpts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", defaultOpts)

-- Find and center
vim.keymap.set("n", "n", "nzzzv", defaultOpts)
vim.keymap.set("n", "N", "Nzzzv", defaultOpts)

-- Stay indenting instead
vim.keymap.set("v", "<", "<gv", defaultOpts)
vim.keymap.set("v", ">", ">gv", defaultOpts)

-- Keep last yanked when pasting over highlighted shit
vim.keymap.set("v", "p", '"_dP', defaultOpts)

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Make backspace work like other ones
vim.opt.backspace = { "indent", "eol", "start" }

-- Allows you to select/highlight N-lines and then move them up and down... Holy shit finally..
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Allows you to use ctrl+backspace to delete full words behind the cursor (Unfortunately backspace is a trick key to bind in terminals)
-- vim.keymap.set("i", "<C-BS>", "<C-o>bw", { noremap = true })

-- Allows you to delete full word infront of the
vim.keymap.set("i", "<C-Del>", "<C-o>dw", { noremap = true })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows

--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", { desc = "Move focus to the upper window" })

-- vim.keymap.set("n", "<leader>x", ":Bdelete!<CR>", defaultOpts)

-- Buffers navigation
vim.keymap.set("n", "<Tab>", ":bnext<CR>", defaultOpts)
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", defaultOpts)
vim.keymap.set("n", "<leader>x", ":bdelete!<CR>", defaultOpts) -- close buffer
vim.keymap.set("n", "<leader>b", "<cmd> enew <CR>", defaultOpts) -- new buffer

-- Keymaps for transfer.nvim plugin
vim.keymap.set("n", "<C-A-X>", "<cmd>TransferUpload<CR>", defaultOpts)
vim.keymap.set("n", "<C-A-C>", "<cmd>TransferDownload<CR>", defaultOpts)

-- TODO: FIGURE OUT WHICH Tree/explorer plugin to use...
-- Remap for NvimTree so we can toggle it on and off
-- vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
-- NOTE: Using oil.nvim here
vim.keymap.set("n", "<leader>e", ":Oil --float <CR>")

-- vim: ts=2 sts=2 sw=2 et
