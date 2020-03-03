function! s:SID()
  return matchstr(expand('<sfile>'), '<SNR>\zs\d\+\ze_SID$')
endfunction
function! s:SIDP()
  return '<SNR>' . s:SID() . '_'
endfunction
let g:submode_keep_leaving_key = 1
"" tab間移動
call submode#enter_with('changetab', 'n', '', 'gt', 'gt')
call submode#enter_with('changetab', 'n', '', 'gT', 'gT')
call submode#map('changetab', 'n', '', 't', 'gt')
call submode#map('changetab', 'n', '', 'T', 'gT')
"" tab移動
function! s:movetab(n)
  let new_position = tabpagenr() -1 + a:n
  let number_of_tags = tabpagenr("$")

  if new_position < 0
    execute 'tabmove $'
  elseif new_position >= number_of_tags
    execute 'tabmove 0'
  elseif a:n == 1
    execute '+tabmove'
  else
    execute '-tabmove'
  endif
endfunction

let s:movetab = ':<C-u>call ' . s:SIDP() . 'movetab(%d)<CR>'
call submode#enter_with('movetab', 'n', '', 'gl', printf(s:movetab, 1))
call submode#enter_with('movetab', 'n', '', 'gL', printf(s:movetab, -1))
call submode#map('movetab', 'n', '', 'l', printf(s:movetab, 1))
call submode#map('movetab', 'n', '', 'L', printf(s:movetab, -1))
unlet s:movetab
