function! Oldfiles#Complete(arglead, cmdline, cursorpos) abort
    return filter(s:GetReadableOldfiles(), 'v:val =~ "' . a:arglead . '"')
endfunction

function s:GetReadableOldfiles() abort
    try
        let ignore_pattern = empty(g:oldfiles_ignore) ? '^$' : join(g:oldfiles_ignore, '\|')
    catch
        let ignore_pattern = '^$'
    endtry
    return filter(copy(v:oldfiles), 'filereadable(v:val) && v:val !~# ignore_pattern')
endfunction

function! Oldfiles#EditFirstMatchingOldfile(cmdline_args, split, mods, bang) abort
    let args = s:ParseArgs(a:cmdline_args)
    if empty(args['file'])
        call s:EchoError('No filename was given')
        return
    endif

    let first_matched_oldfile = matchstr(s:GetReadableOldfiles(), args['file'])
    if empty(first_matched_oldfile)
        call s:EchoError('No matching oldfile for ' . args['file'])
        return
    endif

    let edit_cmd = (a:split ? 'split' : 'edit') . a:bang
    let cmd = join([a:mods, edit_cmd, args['cmd'], first_matched_oldfile])
    execute cmd
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

function! s:EchoError(msg) abort
    echohl ErrorMsg
    echo 'Oldfiles: ' . a:msg
    echohl None
endfunction
