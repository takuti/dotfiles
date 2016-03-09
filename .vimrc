" ---------- plugin
if 0 | endif

if &compatible
 set nocompatible
endif

set runtimepath^=~/.vim/bundle/neobundle.vim/

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'tomasr/molokai'
NeoBundle 'Align'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc.vim', {
\   'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'rust-lang/rust.vim'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

let g:neocomplcache_enable_at_startup = 1
let g:Powerline_symbols = 'fancy'
let g:quickrun_config = {
\   '_' : {
\     'outputter/buffer/split' : ':botright 8sp',
\     'outputter/buffer/close_on_empty' : 1,
\     'hook/time/enable' : 1,
\     'runner' : 'vimproc',
\     'runner/vimproc/updatetime' : 60
\   },
\ }
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
augroup PrevimSettings
  autocmd!
  autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

" ---------- appearance & setting
set t_Co=256
set laststatus=2                    " Show status line (for vim-powerline)
set imdisable
set antialias
set tabstop=2                       " 1 tab = 2 spaces
set shiftwidth=2                    " When automatic indent occured, shift 2 spaces.
set number                          " appear row number
set whichwrap=b,s,h,l,<,>,[,]       " don't stop cursor at head/tail of row
set cursorline                      " cursor line highlight
set visualbell t_vb=                " disable beep sound
set spelllang=en,cjk
set clipboard=unnamed
set backspace=indent,eol,start
set wildmenu
set incsearch
set hlsearch

augroup vimrc
  autocmd!

  " replace from tab to spaces (save-time)
  " In case of Makefile or markdown, it should use exactly tab
  let blacklist = ['make', '*.md', 'addp-hunk-edit.diff']
  autocmd BufWritePre * if index(blacklist, &ft) < 0 | :%s/\s\+$//ge " delete extra spaces at tail of rows (save-time)
  autocmd BufWritePre * if index(blacklist, &ft) < 0 | :%s/\t/  /ge

  autocmd ColorScheme * hi Normal ctermfg=grey ctermbg=black
  autocmd ColorScheme * hi CursorLine cterm=underline ctermfg=none ctermbg=none

  " enable spell checker only for document files
  autocmd BufNewFile,BufRead *.tex set spell
  autocmd BufNewFile,BufRead *.md set spell
augroup END

noremap ; :
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk

syntax enable
colorscheme molokai
