vim.g.mapleader = ";"

local keymap = vim.keymap

-- general keymaps

keymap.set("i", "jk", "<ESC>")

-- windows
keymap.set("n", "<leader>wv", "<C-w>v")      -- split windows vertically
keymap.set("n", "<leader>wh", "<C-w>s")      -- split windows horizontally
keymap.set("n", "<leader>we", "<C-w>=")      -- make split windows equal width
keymap.set("n", "<leader>wx", ":close<CR>")  -- close current split window

--tab
keymap.set("n", "<leader>to", ":tabnew<CR>")    -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>")  -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>")      -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>")      -- go to previous tab

-- plugin keymaps

-- vim-maximizer
keymap.set("n", "<leader>wm", ":MaximizerToggle<CR>")  -- maximizes and restores the current window in Vim

-- nvim-tree
keymap.set("n", "<leader>ct", ":NvimTreeToggle<CR>")   -- open or close the tree
keymap.set("n", "<leader>cf", ":NvimTreeFocus<CR>")    -- open the tree if it is closed, and then focus on the tree

--  telescope for search
keymap.set("n", "<leader>sf", "<cmd>Telescope find_files<CR>")  -- lists files in your current working directory, respects .gitignore
keymap.set("n", "<leader>sl", "<cmd>Telescope live_grep<CR>")   -- search for a string in your current working directory
keymap.set("n", "<leader>sb", "<cmd>Telescope buffers<CR>")     -- lists open buffers in current neovim instance 
keymap.set("n", "<leader>sh", "<cmd>Telescope help_tags<CR>")
keymap.set("n", "<leader>sc", "<cmd>Telescope grep_string<CR>") -- searches for the string under your cursor in your current working directory
