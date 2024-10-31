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
vim.keymap.set('n', '<space>fS', ':FlutterRun --dart-define=RUN_EMULATORS=true -d ipad<CR>', opts)
vim.keymap.set('n', '<space>fr', ':FlutterReload<CR>', opts)
vim.keymap.set('n', '<space>fR', ':FlutterRestart<CR>', opts)
vim.keymap.set('n', '<space>fd', ':FlutterOpenDevTools<CR>', opts)
vim.keymap.set('n', '<space>fc', ':FlutterLogClear<CR>', opts)
vim.keymap.set('n', '<space>fQ', ':FlutterQuit<CR>', opts)

