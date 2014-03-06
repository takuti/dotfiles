" ---------- plugin
if has('vim_starting')
  set nocompatible
  set runtimepath+=$HOME/.vim/bundle/neobundle.vim
endif
call neobundle#rc(expand('~/.vim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Align'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/vimplenote-vim'
filetype plugin indent on

let g:neocomplcache_enable_at_startup = 1
let g:Powerline_symbols = 'fancy'

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
set vb t_vb=                        " disable beep sound

autocmd BufWritePre * :%s/\s\+$//ge " delete extra spaces at tail of rows (save-time)
autocmd BufWritePre * :%s/\t/  /ge  " replace from tab to spaces (save-time)

noremap ; :

autocmd ColorScheme * hi Normal ctermfg=grey ctermbg=black
autocmd ColorScheme * hi CursorLine cterm=underline ctermfg=none ctermbg=none

syntax enable
colorscheme molokai
