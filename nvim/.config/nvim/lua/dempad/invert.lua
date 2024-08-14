vim.cmd([[
:function! Invert(calledFromVisual)
   let antonyms = ['true', 'false', 'after', 'before', 'start', 'end', 'left', 'right', 'first', 'last',
                  \'True', 'False', 'After', 'Before', 'Start', 'End', 'Left', 'Right', 'First', 'Last']

   if a:calledFromVisual
     normal gv"wy
   else
     normal "wyiw
   endif
   let wordUnderCaret = @w

   let eraseWord = a:calledFromVisual ? 'gvc' : 'ciw'
   let count = 0
   while (count < len(antonyms))
     if (antonyms[count] ==# wordUnderCaret)
       let antonym = (count % 2 ==? 0) ? antonyms[count + 1] : antonyms[count - 1]
       execute 'normal ' .. eraseWord .. antonym
       break
     endif
     let count += 1
   endwhile
 endfunction

 nnoremap ! :call Invert(0)<CR>
 vnoremap ! :<C-u>call Invert(1)<CR>
]])
