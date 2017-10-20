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
  NeoBundle 'scrooloose/syntastic'
  NeoBundle 'cohama/lexima.vim'
  NeoBundle 'mattn/emmet-vim'
  NeoBundle 'tpope/vim-endwise'
  " NeoBundle 'Shougo/neocomplete.vim'
  " NeoBundle 'Shougo/neosnippet'
  " NeoBundle 'Shougo/neosnippet-snippets'
  NeoBundle 'Shougo/vimshell'
  NeoBundle 'alvan/vim-closetag'
  NeoBundle 'Shougo/vimproc', { 'build' : { 'mac' : 'make -f make_mac.mak', 'unix' : 'make -f make_unix.mak' } }
  " NeoBundle 'supermomonga/neocomplete-rsense.vim', { 'autoload' : { 'insert' : 1, 'filetypes': 'ruby' } }
  NeoBundle 'ngmy/vim-rubocop'
  NeoBundle 'pangloss/vim-javascript'
  NeoBundle 'mxw/vim-jsx'
  " vimrc に記述されたプラグインでインストールされていないものがないかチェックする
  NeoBundleCheck
call neobundle#end()

" vim-airlineのフォント設定
"let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" NERDTree
let NERDTreeShowHidden=1
" autocmd VimEnter * execute 'NERDTree'
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

" syntastic
let g:syntastic_mode_map = { 'mode': 'active',
  \ 'active_filetypes': [],
  \ 'passive_filetypes': [] }
let g:syntastic_ruby_checkers = ['rubocop'] " or ['rubocop', 'mri']
" let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_coffee_checkers = ['coffeelint']
" let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_auto_loc_list = 2
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = '❗'
let g:syntastic_style_error_symbol = '❗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_warning_symbol = '⚠'
highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

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

" Shift + 左右でバッファ切り替え
nnoremap <S-Left>   :bp<CR>
nnoremap <S-Right>  :bn<CR>

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

" neocomplete設定
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" neocomplete-rsense設定
" .や::を入力したときにオムニ補完が有効になるようにする
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

" 環境変数RSENSE_HOMEに'/usr/local/bin/rsense'を指定しても動く
let g:neocomplete#sources#rsense#home_directory = '/usr/local/bin/rsense'

" neosnippet設定
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" 自動改行をオフ
set formatoptions=q

" filenames like *.xml, *.html, *.xhtml, ...
let g:closetag_filenames = "*.xml,*.html,*.xhtml,*.phtml,*.html.erb"

" 長いテキストで重くなる現象を回避
set synmaxcol=200
