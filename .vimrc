" ===> PLUG

" Auto install plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
  " Theme
  Plug 'dracula/vim', { 'as': 'dracula' }

  " Tools
  Plug 'preservim/NERDTree'
  Plug 'PhilRunninger/nerdtree-visual-selection'
  Plug 'preservim/nerdcommenter'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'tpope/vim-fugitive'

  " Languagages
  Plug 'dart-lang/dart-vim-plugin', { 'for': ['dart'] }
  Plug 'pangloss/vim-javascript', { 'for': ['javascript'] }
  Plug 'maxmellon/vim-jsx-pretty', { 'for': ['javascript'] }
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': ['go'] }

call plug#end()

" <=== PLUG

" ===> SETTINGS

syntax on
colorscheme dracula
let g:dracula_italic = 0
set background=dark
highlight Normal ctermbg=black

set re=2
set noesckeys
set hidden
set relativenumber
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

" <=== SETTINGS

" ===> MAPPINGS

let mapleader = ","


nmap <silent> <leader>; :Buf<CR>
nmap <silent> <leader>[ :bp<CR>
nmap <silent> <leader>] :bn<CR>

nmap <silent> <leader>b :NERDTreeToggle<CR>
nmap <silent> <leader>f :NERDTreeFind<CR>
nmap <silent> <leader>p :FZF<CR>
nmap <silent> <space>h :set hls!<CR>

command W write

" <=== MAPPINGS

" ===> PRETTIER

command! -nargs=0 Prettier :CocCommand prettier.formatFile

" <=== PRETTIER

" ===> COC

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gR <Plug>(coc-rename)
nmap <silent> gs <Plug>(coc-codeaction-selected)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gc  <Plug>(coc-codeaction-cursor)
nmap <silent> <leader>r <Plug>(coc-codeaction-refactor)
nmap <silent> <leader>d :CocList diagnostics<CR>

" Confirm select on ENTER
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
				\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" COC format
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

" <=== COC
