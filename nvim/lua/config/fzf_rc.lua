local opts = { noremap=true, silent=true }

vim.keymap.set('n', '<leader>p', ':FzfLua files<CR>', opts)
vim.keymap.set('n', '<leader>f', ':FzfLua grep<CR>', opts)
vim.keymap.set('n', '<leader>;', ':FzfLua buffers<CR>', opts)
