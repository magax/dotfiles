call plug#begin()
  Plug 'dracula/vim', { 'as': 'dracula' }

  Plug 'preservim/NERDTree'
  Plug 'preservim/nerdcommenter'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'tpope/vim-fugitive'
  Plug 'jiangmiao/auto-pairs'

  Plug 'dart-lang/dart-vim-plugin'
  Plug 'pangloss/vim-javascript'
  Plug 'darfink/vim-plist'
call plug#end()

syntax enable
colorscheme dracula 

set hidden
set number
"set relativenumber
set tabstop=2 shiftwidth=2 expandtab smarttab 
set backspace=indent,eol,start
set cursorline
set colorcolumn=80
set belloff=all
set foldmethod=syntax
set nofoldenable
set splitright

let mapleader = ","
let g:dart_format_on_save = 1

nmap <silent> <C-b> :NERDTreeToggle<CR>
nmap <silent> <C-f> :NERDTreeFind<CR>
nmap <silent> <C-p> :FZF<CR>

" Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Coc
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

