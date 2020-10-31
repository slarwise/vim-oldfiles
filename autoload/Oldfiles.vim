" TODO: Case sensitivity? Now 'ignorecase' is used.
" TODO: Blacklist e.g. git commits? Should this be done somewhere else, maybe
" bdelete or something after a git commit is closed?
"
" TODO: Write helpdoc
"           :Oldfile[!] [+cmd] {oldfile}
"           :Soldfile [+cmd] {oldfile}

function! Oldfiles#Complete(arglead, cmdline, cursorpos) abort
    return filter(s:GetReadableOldfiles(), 'v:val =~ "' . a:arglead . '"')
endfunction

function! Oldfiles#EditFirstMatchingOldfile(cmdline_args, split, mods, bang) abort
    let args = s:ParseArgs(a:cmdline_args)
    if empty(args['file'])
        echohl ErrorMsg
        echo "Oldfiles: No filename was given"
        echohl None
        return
    endif
    let first_matched_oldfile = matchstr(s:GetReadableOldfiles(), args['file'])
    if empty(first_matched_oldfile)
        echohl ErrorMsg
        echo "Oldfiles: No matching oldfile for " . args['file']
        echohl None
    else
        let edit_cmd = (a:split ? 'split' : 'edit') . a:bang
        let cmd = join([a:mods, edit_cmd, args['cmd'], first_matched_oldfile])
        execute cmd
    endif
endfunction

function! s:ParseArgs(args) abort
    let args_dict = {'cmd': '', 'file': ''}
    if a:args[0] =~# '+'
        let args_list = split(a:args, ' ', 1)
        let args_dict['cmd'] = args_list[0]
        let args_dict['file'] = join(args_list[1:-1], '')
    else
        let args_dict['file'] = a:args
    endif
    return args_dict
endfunction

function s:GetReadableOldfiles() abort
    return filter(copy(v:oldfiles), 'filereadable(v:val)')
endfunction
