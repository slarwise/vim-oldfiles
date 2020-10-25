if exists('g:loaded_oldfiles')
    finish
endif
let g:loaded_oldfiles = 1

let s:save_cpo = &cpo
set cpo&vim

command -complete=customlist,Oldfiles#Complete -nargs=1
            \ Oldfile call Oldfiles#EditFirstMatchingOldfile(<f-args>)

let &cpo = s:save_cpo
unlet s:save_cpo
