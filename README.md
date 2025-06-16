# Configs using stow
## pre
`brew install stow`

### stow
`stow nvim` :: stow the dir
`stow -D nvim` :: unstow the dir

## git

[alias]
  fixup = "!git log -n 50 --pretty=format:'%h %s' --no-merges | fzf | cut -c -7 | xargs -o git commit --fixup"

gir rebase -i --autosquash main
