" ---------- plugin
if 0 | endif

if &compatible
 set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  call dein#add('tomasr/molokai', {'merged': 0})
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('zchee/deoplete-jedi')
  call dein#add('Shougo/denite.nvim')
  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
  call dein#add('Shougo/vimshell.vim')
  call dein#add('itchyny/lightline.vim')
  call dein#add('thinca/vim-quickrun')
  call dein#add('godlygeek/tabular')
  call dein#add('tyru/open-browser.vim')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('tpope/vim-fugitive')

  " language specific
  call dein#add('rust-lang/rust.vim')
  call dein#add('JuliaLang/julia-vim')
  call dein#add('derekwyatt/vim-scala')
  call dein#add('plasticboy/vim-markdown')
  call dein#add('kannokanno/previm')
  call dein#add('nvie/vim-flake8')
  call dein#add('fatih/vim-go')
  call dein#add('b4b4r07/vim-sqlfmt')
  call dein#add('cespare/vim-toml')

  call dein#end()
  call dein#save_state()
endif

colorscheme molokai

filetype plugin indent on

if dein#check_install()
  call dein#install()
endif

" lightline
let g:lightline = {
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'LightLineModified',
      \   'readonly': 'LightLineReadonly',
      \   'fugitive': 'LightLineFugitive',
      \   'filename': 'LightLineFilename',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

function! LightLineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'readonly' : ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? branch : ''
  endif
  return ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

let g:quickrun_config = {
\   '_' : {
\     'outputter/buffer/split' : ':botright 8sp',
\      'outputter/buffer/into' : 1,
\     'outputter/buffer/close_on_empty' : 1,
\     'hook/time/enable' : 1,
\     'runner' : 'vimproc',
\     'runner/vimproc/updatetime' : 60
\   },
\ }
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

let g:sqlfmt_auto = 0
" pip install --upgrade sqlparse
let g:sqlfmt_command = "sqlformat"
let g:sqlfmt_options = "-s -r -k upper"

let g:vim_markdown_folding_disabled = 1

augroup PrevimSettings
  autocmd!
  autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

let g:flake8_show_in_file = 1
let g:flake8_show_in_gutter = 1
autocmd BufWritePost *.py call flake8#Flake8()

autocmd BufNewFile,BufRead *.{dig*} set filetype=yaml

let mapleader = ' '

nnoremap <Leader>vs  :VimShell<CR>
nnoremap <Leader>vsp :VimShellPop<CR>

" deoplete.vim requires python3
let g:python3_host_prog = expand('$HOME') . '/.pyenv/shims/python'
let g:deoplete#enable_at_startup = 1

" ---------- appearance & setting
set t_Co=256
set laststatus=2                    " Show status line (for vim-powerline)
set imdisable
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
set mouse=
set ttimeout
set ttimeoutlen=50

augroup vimrc
  autocmd!

  " replace from tab to spaces (save-time)
  " In case of Makefile or markdown, it should use exactly tab
  let whitespace_blacklist = ['make', 'markdown', 'addp-hunk-edit.diff']
  autocmd BufWritePre * if index(whitespace_blacklist, &ft) < 0 | :%s/\s\+$//ge " delete extra spaces at tail of rows (save-time)
  autocmd BufWritePre * if index(whitespace_blacklist, &ft) < 0 | :%s/\t/  /ge

  autocmd ColorScheme * hi Normal ctermfg=grey ctermbg=black
  autocmd ColorScheme * hi CursorLine cterm=underline ctermfg=none ctermbg=none

  " enable spell checker only for document files
  autocmd BufNewFile,BufRead *.tex set spell
  autocmd BufNewFile,BufRead *.md set spell

  autocmd Filetype julia setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4

  autocmd QuickFixCmdPost *grep* cwindow

augroup END

" quickfix
nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :<C-u>cfirst<CR>
nnoremap ]Q :<C-u>clast<CR>

noremap ; :
noremap : ;
nnoremap j gj
nnoremap k gk

syntax enable
