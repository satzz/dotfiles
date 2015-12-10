set tabstop=2
set shiftwidth=2
set expandtab
set nu


set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" NeoBundleを初期化
call neobundle#begin(expand('~/.vim/bundle/'))


" インストールするプラグインをここに記述
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'kchmck/vim-coffee-script'

call neobundle#end()

" pathogen
" https://github.com/tpope/vim-pathogen
execute pathogen#infect()

" ファイルタイプ別のプラグイン/インデントを有効にする
filetype plugin indent on



let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_fail_silently = 1
let g:go_fmt_autosave = 0
syntax on



