# vim-oldfiles

A (neo)vim plugin for editing oldfiles. Two commands are provided, `Oldfile` and
`Soldfile`, which work similarly to `buffer` and `sbuffer`.

## Features

- Commmand line completion.
- Only list readable oldfiles.
- Works with partial filenames, the latest edited file that matches will be
  chosen. Note how this is different to `[s]buffer`, which will only allow a
  unique match.
- Supports command modifiers such as `vertical` and `aboveleft`.
- Supports `+cmd`, e.g. `+/pattern`.
- Supports `<bang>`.

## Examples

The below examples assume that you don't have any other commands starting with
`O`.

```vim
:O {partial-filename}<TAB> " Get completion for partial-filename
:O {filename}<CR> " Edit the first oldfile matching filename
:O +/pattern {filename} " Like above but go to the first match of pattern
:O! {filename}<CR> " Go to the first oldfile matching filename ignoring changes in current buffer
```

The command `Soldfile` works the same as `Oldfile` except it opens the file in a
new split. Prefix `Soldfile` with `vert[ical]` to get a vertical split. See the
docs, `:help :Oldfile` and `:help :Soldfile`, for all details. Happy vimming :)

## Configuration

To ignore oldfiles that match a certain pattern, do

```vim
let g:oldfiles_ignore = <list-of-patterns>
```

If an oldfile matches any of the patterns in `<list-of-patterns>` it will not be
a candidate for completion or editing. For example, to ignore commit messages
and vim helpfiles, you could do

```vim
let g:oldfiles_ignore = ['COMMIT_EDITMSG', '/runtime/doc/']
```

## Doing it the vim way

This plugin is an alternative to `:browse oldfiles` and the numbered marks.
These are described under `help :oldfiles` and `:help viminfo-file-marks` in vim
and `:help shada-file-marks` in neovim. For example, if you want to edit your
last opened file, just do `'0`.

## Related plugins

- [vim-oldfiles](https://github.com/gpanders/vim-oldfiles)
