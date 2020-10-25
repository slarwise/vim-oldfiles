" TODO: Support :vertical, ++opt, +cmd
" TODO: Can the error handling be handled by vim? Or throw the correct error

function! Oldfiles#Complete(arglead, cmdline, cursorpos) abort
    return filter(s:GetReadableOldfiles(), 'v:val =~ "' . a:arglead . '"')
endfunction

function! Oldfiles#EditFirstMatchingOldfile(partial_filename)
    let first_matched_oldfile = matchstr(s:GetReadableOldfiles(), a:partial_filename)
    if empty(first_matched_oldfile)
        echohl ErrorMsg
        echo "Can't find file " . a:partial_filename . " in oldfiles"
        echohl None
    else
        execute 'edit ' . first_matched_oldfile
    endif
endfunction

function s:GetReadableOldfiles()
    return filter(copy(v:oldfiles), 'filereadable(v:val)')
endfunction
