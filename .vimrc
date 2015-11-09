set number
set imdisable
" neobundle settings {{{
if has('vim_starting')
  set nocompatible
  " neobundle をインストールしていない場合は自動インストール
  if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
    echo "install neobundle..."
    " vim からコマンド呼び出しているだけ neobundle.vim のクローン
    :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
  endif
  " runtimepath の追加は必須
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle'))
let g:neobundle_default_git_protocol='https'

" neobundle#begin - neobundle#end の間に導入するプラグインを記載します。
NeoBundleFetch 'Shougo/neobundle.vim'
" ↓こんな感じが基本の書き方
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'vim-scripts/DirDiff.vim.git'
NeoBundle "ctrlpvim/ctrlp.vim"
NeoBundle 'scrooloose/nerdtree'

" vimrc に記述されたプラグインでインストールされていないものがないかチェックする
NeoBundleCheck
call neobundle#end()
filetype plugin indent on
" どうせだから jellybeans カラースキーマを使ってみましょう
set t_Co=256
syntax on
colorscheme jellybeans

let g:vimfiler_as_default_explorer = 1
let g:vimfiler_edit_action = 'tabopen'
"autocmd VimEnter * execute 'NERDTree'

nnoremap <Tab>      <C-w>w
nnoremap <S-Tab>    :bn<CR>
nnoremap <ESC><ESC> :nohlsearch<CR>
nnoremap <C-e> :NERDTreeToggle<CR>

set title
set hidden
set nrformats-=octal
set whichwrap=b,s,[,],<,>
set mouse=a

" http://qiita.com/himinato/items/c97970ab34ff55ff3167
filetype plugin indent on

syntax on

set nowrap

set hlsearch
set ignorecase
set smartcase

set autoindent
set ruler
set number
set wildmenu
set showcmd

set shiftwidth=4
set softtabstop=4
set expandtab
set tabstop=4
set smarttab

set clipboard=unnamed
