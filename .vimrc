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
  NeoBundle 'vim-airline/vim-airline-themes'
  NeoBundle 'tpope/vim-fugitive'
  NeoBundle 'kchmck/vim-coffee-script'
  NeoBundle 'tpope/vim-surround'
  NeoBundle 'w0rp/ale'
  NeoBundle 'cohama/lexima.vim'
  NeoBundle 'mattn/emmet-vim'
  NeoBundle 'tpope/vim-endwise'
  NeoBundle 'alvan/vim-closetag'
  NeoBundle 'ngmy/vim-rubocop'
  NeoBundle 'pangloss/vim-javascript'
  NeoBundle 'mxw/vim-jsx'
  " vimrc に記述されたプラグインでインストールされていないものがないかチェックする
  NeoBundleCheck
call neobundle#end()

" vim-airlineのフォント設定
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" NERDTree
let NERDTreeShowHidden=1
nnoremap <C-e> :NERDTreeToggle<CR>

" カラースキームの設定
colorscheme jellybeans
if &term =~ "xterm-256color" || "screen-256color"
  set t_Co=256
  set t_Sf=[3%dm
  set t_Sb=[4%dm
elseif &term =~ "xterm-color"
  set t_Co=8
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif

" DirDiff設定
let g:DirDiffExcludes = ".git,*.class,*.o"

" ALE
let g:ale_sign_column_always = 1
let g:ale_sign_error = 'E>'
let g:ale_sign_warning = 'W-'
highlight clear ALEErrorSign
highlight clear ALEWarningSign

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

" Shift + 左右でジャンプリスト移動
nnoremap <S-Left>   <C-o>
nnoremap <S-Right>  <C-i>

set title
set hidden
set nrformats-=octal
set whichwrap=b,s,[,],<,>
set mouse=a

" http://qiita.com/himinato/items/c97970ab34ff55ff3167
filetype plugin indent on

syntax on

"set nowrap

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

set encoding=utf-8

" Allow backspace key
set backspace=indent,eol,start

" http://qiita.com/inodev/items/4f4d5412e65c2564b273
" カーソル行の背景色変更
set cursorline
" スクロールを開始する残り行数を指定
set scrolloff=5
" ESC連打で検索結果強調を解除
set hlsearch
nnoremap <ESC><ESC> :nohlsearch<CR>
" エラービープ音の全停止
set visualbell t_vb=
set noerrorbells
" 検索語が画面の真ん中に来るようにする
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz
" インサートモードから抜ける時に便利なキーバインド
inoremap <silent> jj <ESC>

" ヤンクしたデータをクリップボードで使用
set clipboard=unnamed

" vimgrepやgrep した際に、cwindowしてしまう
autocmd QuickFixCmdPost *grep* cwindow

" 全角スペースの可視化
augroup UsingJapanese
  au!
  autocmd VimEnter,ColorScheme * highlight def link IdeographicSpace Visual
  autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END

" 自動改行をオフ
set formatoptions=q

" filenames like *.xml, *.html, *.xhtml, ...
let g:closetag_filenames = "*.xml,*.html,*.xhtml,*.phtml,*.html.erb"

" 長いテキストで重くなる現象を回避
set synmaxcol=200
