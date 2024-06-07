# Neovim

`:TSUpdate`
`:Mason`
`:Copilot`
`:PackerSync`
`:PackerCompile`

## Nerd Fonts

`VictorMono Nerd Font Mono`


## Req..

- deno

## Conficts Fugitive



[reddit](https://www.reddit.com/r/vim/comments/leo0ji/is_there_any_better_merge_conflict_resolution/)
[video](https://www.youtube.com/watch?v=iPk4nOLj8w4)

> I like the way Fugitive works actually. I made a short video about it here.
> 
> Some tips:
> 
> I always operate out of the status window which you can get to from just :G. This will show the status including the conflicts.
> 
> Press dd on the file you want to deconflict.
> 
> Use ]c and [c to jump between conflict markers. I can rip through files that have lots of conflicts with this.
> 
> By default, dd should give you a vertical 3-way split. But if you want to force vertical, use dv or use dh for horizontal (ds also works if you prefer the "split" mnemonic).
> 
> Use the middle pane to view and navigate. Everything should scroll together automatically because of :set scrollbind being enabled by Fugitive.
> 
> The left pane is numbered 2 and the right pane is numbered 3 (you're in number 1). So use d2o or d3o to "obtain" from either 2 or 3. Remember with the mnemonic "Diff 2 Obtain" and "Diff 3 Obtain".
> 
> If you want to just use one entire side, move your cursor to that side with <Ctrl-w> h, for example. Then do :Gwrite!.
