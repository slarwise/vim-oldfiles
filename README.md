# vim-oldfiles

A (neo)vim plugin for editing oldfiles. Two commands are provided, `Oldfile` and
`Soldfile`, which works similarly to `buffer` and `sbuffer`.

## Features

- Tab completion
- Only list readable oldfiles
- Works with partial filenames, the latest edited file that matches will be
  chosen. Note how this is different to `[s]buffer`, which will only allow a
  unique match.
- `Oldfile` is simply a wrapper for `edit` (and `Soldfile` for `split`), so
  `<bang>`, `++opt`,`+cmd` and command modifiers such as `vertical` should all
  work.

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
new split. Prefix `Soldfile` with `vertical` to get a vertical split. See the
docs, `:help :Oldfile` and `:help :Soldfile`, for all details. Happy vimming :)

## Doing it the vim way

This plugin is an alternative to `:browse oldfiles` and the numbered marks.
These are described under `help :oldfiles` and `:help viminfo-file-marks` in vim
and `:help shada-file-marks` in neovim.

## Related plugins

- [vim-oldfiles](https://github.com/gpanders/vim-oldfiles)
