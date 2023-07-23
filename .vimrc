call plug#begin()
  Plug 'dracula/vim', { 'as': 'dracula' }

  Plug 'preservim/NERDTree'
  Plug 'preservim/nerdcommenter'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'tpope/vim-fugitive'

  Plug 'dart-lang/dart-vim-plugin', { 'for': ['dart'] }
  Plug 'pangloss/vim-javascript', { 'for': ['javascript'] }
  Plug 'maxmellon/vim-jsx-pretty', { 'for': ['javascript'] }
  Plug 'mattn/emmet-vim'
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': ['go'] }
call plug#end()

syntax on
colorscheme dracula
let g:dracula_italic = 0
set background=dark
highlight Normal ctermbg=black

set hidden
set number
set colorcolumn=
set tabstop=2 shiftwidth=2 expandtab smarttab 
set backspace=indent,eol,start
set cursorline
set belloff=all
set splitright
set splitbelow
set backupdir=/tmp//
set directory=/tmp//
set undodir=/tmp//

let mapleader = ","

nmap <silent> <leader>b :NERDTreeToggle<CR>
nmap <silent> <leader>f :NERDTreeFind<CR>
nmap <silent> <leader>p :FZF<CR>

" GO
let g:go_doc_keywordprg_enabled = 0
let g:go_def_mapping_enabled = 0

let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1

" FLUTTER
nmap <silent> <leader>fe :CocCommand flutter.emulators<CR>
nmap <silent> <leader>fd :CocCommand flutter.devices<CR>
nmap <silent> <leader>fS :CocCommand flutter.run<CR>
nmap <silent> <leader>fr :CocCommand flutter.dev.hotReload<CR>
nmap <silent> <leader>fR :CocCommand flutter.dev.hotRestart<CR>
nmap <silent> <leader>fl :CocCommand flutter.dev.openDevLog<CR>
nmap <silent> <leader>fq :CocCommand flutter.dev.quit<CR>

" PRETTIER
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" COC
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gR <Plug>(coc-rename)
nmap <silent> gs <Plug>(coc-codeaction-selected)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> <leader>A :set keymap=accents<CR>
nmap <silent> <leader>a :set keymap=<CR>
nmap <silent> <leader>d :CocList diagnostics<CR>

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
				\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

command! -nargs=0 Fmt :call CocActionAsync('format')

" Remap <C-j> and <C-k> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-j> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-j>"
  nnoremap <silent><nowait><expr> <C-k> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-k>"
  inoremap <silent><nowait><expr> <C-j> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-k> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-j> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-j>"
  vnoremap <silent><nowait><expr> <C-k> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-k>"
endif

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
