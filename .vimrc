" neobundle のセットアップ
if has('vim_starting')
  set nocompatible
  " neobundle をインストールしていない場合は自動インストール
  if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
    echo "install neobundle..."
    " vim からコマンド呼び出しているだけ neobundle.vim のクローン
    :call system("git clone git://github.com/Shougo/neobundle.vim " . $HOME . "/.vim/bundle/neobundle.vim")
  endif
  " runtimepath の追加は必須
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" neobundle#begin - neobundle#end の間に導入するプラグインを記載します。
call neobundle#begin(expand('~/.vim/bundle'))
  let g:neobundle_default_git_protocol='https'
  " neobundle プラグイン
  NeoBundleFetch 'Shougo/neobundle.vim'
  NeoBundle 'nanotech/jellybeans.vim'
  NeoBundle 'vim-scripts/DirDiff.vim.git'
  NeoBundle "ctrlpvim/ctrlp.vim"
  NeoBundle 'scrooloose/nerdtree'
  NeoBundle 'bling/vim-airline'
  NeoBundle 'tpope/vim-fugitive'
  NeoBundle 'kchmck/vim-coffee-script'
  NeoBundle 'tpope/vim-surround'
  " vimrc に記述されたプラグインでインストールされていないものがないかチェックする
  NeoBundleCheck
call neobundle#end()

" vim-airlineのフォント設定
"let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

"autocmd VimEnter * execute 'NERDTree'
" 隠しファイルをデフォルトで表示させる
let NERDTreeShowHidden=1

" カラースキームの設定
set t_Co=256
colorscheme jellybeans

" 表示行単位で上下移動するように
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk
" 逆に普通の行単位で移動したい時のために逆の map も設定しておく
nnoremap gj j
nnoremap gk k

" コマンドラインのCtrl-pとCtrl-nでフィルタ出来るように
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

"nnoremap <Tab>      <C-w>w
nnoremap <S-Tab>    <C-w>t
nnoremap <S-Left>   :bp<CR>
nnoremap <S-Right>  :bn<CR>

nnoremap <ESC><ESC> :nohlsearch<CR>
nnoremap <C-e> :NERDTreeToggle<CR>

" カーソルキーを封印
noremap <Up>    <Nop>
noremap <Down>  <Nop>
noremap <Left>  <Nop>
noremap <Right> <Nop>

set title
set hidden
set nrformats-=octal
set whichwrap=b,s,[,],<,>
set mouse=a

" http://qiita.com/himinato/items/c97970ab34ff55ff3167
filetype plugin indent on

syntax on

"set nowrap

set hlsearch
set ignorecase
set smartcase

set autoindent
set ruler
set number
set wildmenu
set showcmd

set shiftwidth=2
set softtabstop=2
set expandtab
set tabstop=2
set smarttab

set clipboard=unnamed

" Add
set incsearch
set noswapfile
set nobackup
set noundofile

" CtrlPの設定
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" let g:airline#extensions#tabline#enabled = 1

set encoding=utf-8

