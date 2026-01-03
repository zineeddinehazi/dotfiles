-- Panel/window navigation (splits)
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

-- Unbind the arrow keys
vim.keymap.set({'n','i','v'}, '<Up>', '<Nop>', { silent = true })
vim.keymap.set({'n','i','v'}, '<Down>', '<Nop>', { silent = true })
vim.keymap.set({'n','i','v'}, '<Left>', '<Nop>', { silent = true })
vim.keymap.set({'n','i','v'}, '<Right>', '<Nop>', { silent = true })

-- Buffers hopping
vim.keymap.set('n', '<leader>n', ':bnext<CR>', { silent = true, desc = 'Next buffer' })
vim.keymap.set('n', '<leader>p', ':bprevious<CR>', { silent = true, desc = 'Previous buffer' })
