if has('win32') || has ('win64')
  source $VIMRUNTIME/delmenu.vim
  set langmenu=ja_jp.utf-8
  source $VIMRUNTIME/menu.vim
endif

if has('mac')
  set guifont=Monaco:h14
endif

colorscheme jellybeans

" スクロールバーの非表示
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=b

hi Comment gui=NONE

set imdisable
