if has('mac')
  set guifont=Hack:h12
  " let g:airline_left_sep = ''          " 0xe0b0
  " let g:airline_left_alt_sep = ''      " 0xe0b1
  " let g:airline_right_sep = ''         " 0xe0b2
  " let g:airline_right_alt_sep = ''     " 0xe0b3
  " let g:airline_symbols.branch = ''    " 0xe0a0
  " let g:airline_symbols.readonly = ''  " 0xe0a2
  " let g:airline_symbols.linenr = ''    " 0xe0a1
endif

colorscheme jellybeans

" スクロールバーの非表示
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=b

hi Comment gui=NONE
