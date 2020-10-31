if exists('g:loaded_oldfiles')
    finish
endif
let g:loaded_oldfiles = 1

let s:save_cpo = &cpo
set cpo&vim

command! -bang -complete=customlist,Oldfiles#Complete -nargs=+
            \ Oldfile call Oldfiles#EditFirstMatchingOldfile(<q-args>, 0, <q-mods>, <q-bang>)
command! -complete=customlist,Oldfiles#Complete -nargs=+
            \ Soldfile call Oldfiles#EditFirstMatchingOldfile(<q-args>, 1, <q-mods>, '')

let &cpo = s:save_cpo
unlet s:save_cpo
