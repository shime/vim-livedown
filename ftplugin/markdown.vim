augroup livedown
  if g:livedown_autorun
    au! BufWinEnter <buffer> LivedownPreview
  endif

  au! VimLeave <buffer> LivedownKill
augroup END
