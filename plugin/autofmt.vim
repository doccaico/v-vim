if exists("g:loaded_autofmt")
  finish
endif
let g:loaded_autofmt = 1

let s:save_cpo = &cpo
set cpo&vim

augroup autoFmt
    autocmd!
    autocmd BufWritePre * :silent! call autofmt#fmt()
augroup END

let &cpo = s:save_cpo
unlet s:save_cpo
