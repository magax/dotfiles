require'flutter-tools'.setup {
  closing_tags = {
    enabled = true
  },
  widget_guides = {
    enabled = true,
  },
  decorations = {
    statusline = {
      app_version = true,
      device = true,
    }
  },
}

local opts = { silent = true, noremap = true }
vim.keymap.set('n', '<leader>fS', ':FlutterRun --dart-define=RUN_EMULATORS=true -d ipad<CR>', opts)
vim.keymap.set('n', '<leader>fr', ':FlutterReload<CR>', opts)
vim.keymap.set('n', '<leader>fR', ':FlutterRestart<CR>', opts)
vim.keymap.set('n', '<leader>fd', ':FlutterOpenDevTools<CR>', opts)
vim.keymap.set('n', '<leader>fc', ':FlutterLogClear<CR>', opts)
vim.keymap.set('n', '<leader>fQ', ':FlutterQuit<CR>', opts)

