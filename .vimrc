set t_Co=256
set nocompatible
filetype off
set rtp+=~/.vim/neobundle.vim.git
" call vundle#rc()

set laststatus=2

if has('vim_starting')
  set runtimepath+=$HOME/.vim/neobundle.vim
  call neobundle#rc(expand('~/.bundle'))
endif
NeoBundle 'tpope/vim-rails'
NeoBundle 'sudo.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'kchmck/vim-coffee-script'
" NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'
NeoBundle 'ujihisa/vimshell-ssh'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'godlygeek/csapprox'
NeoBundle	'project.tar.gz'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'scrooloose/nerdtree'
filetype on
filetype plugin on
filetype indent on

let g:neocomplcache_enable_at_startup = 1
" let g:vimproc_dll_path = $HOME+'/.bundle/vimproc/autoload/proc.so'
let g:Powerline_symbols = 'fancy'

syntax enable
set background=dark

colorscheme molokai

set modifiable

set showtabline=2	" タブを常に表示
set imdisable	" IMを無効化
set antialias
" タブを表示するときの幅
set tabstop=2
" タブを挿入するときの幅
set shiftwidth=2
set number " 行番号を表示
		
"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

set visualbell t_vb=

"" カーソル行をハイライト
set cursorline
"" カレントウィンドウにのみ罫線を引く
" augroup cch
" autocmd! cch
" autocmd WinLeave * set nocursorline
" autocmd WinEnter,BufRead * set cursorline
" augroup END
" :hi clear CursorLine
" :hi CursorLine gui=underline
" highlight CursorLine ctermbg=black guibg=black

" ツールバーを削除
set guioptions-=T

