# Vim-oldfiles

A (Neo)vim plugin for editing files that are in the `v:oldfiles` list. Two
commands are provided `Oldfile` and `Soldfile` which should work exactly like
`:edit` `:find`, `:buffer`, `:split`, `:sfind`, `:sbuffer` and similar. If they
don't, file an issue! Note that you can shorten the commands, for example if you
don't have any commands starting with `O`, it will be enough to type `:O`.

## Example usage

The below examples assume that you don't have any other commands starting with
`O`. 

```vim
:O partial-filename<TAB> " Get completion for partial-filename
:O filename<CR> " Edit the first oldfile matching filename
:O +/pattern filename " Like above but go to the first match of pattern
:O! filename<CR> " Go to the first oldfile matching filename ignoring changes in current buffer
```

The command `:Soldfile` works the same as `:Oldfile` except it opens the file in
a new split.

## Related plugins

- [vim-oldfiles](https://github.com/gpanders/vim-oldfiles)

## Relevant vim help

```vim
:help :edit
:help :find
:help :buffer
:help :split
:help :sfind
:help :sbuffer
```
