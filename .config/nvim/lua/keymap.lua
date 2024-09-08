-- treat long lines as break lines
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- use ii as ESC
vim.keymap.set("i", "ii", "<ESC>")

-- use ii to back to normal mode in terminal
vim.keymap.set("t", "ii", "<C-\\><C-n>")

-- use ,<CR> to disable hlsearch
vim.keymap.set("n", "<LEADER><CR>", ":nohlsearch<CR>", { silent = true, desc = "Disable hlsearch" })

-- tab shortcuts
vim.keymap.set("n", "<LEADER>tt", ":tabnew<CR>", { silent = true, desc = "Create a new tab" })
vim.keymap.set("n", "<LEADER>tc", ":tabclose<CR>", { silent = true, desc = "Close current tab" })
vim.keymap.set("n", "<LEADER>tn", ":tabnext<CR>", { silent = true, desc = "Move to the next tab" })
vim.keymap.set("n", "<LEADER>tp", ":tabprevious<CR>", { silent = true, desc = "Move to the previous tab" })

-- use ,cd to change current directory
vim.keymap.set("n", "<LEADER>cd", ":cd %:p:h<CR>:pwd<CR>",
  { silent = true, desc = "Change current directory to file location" })
