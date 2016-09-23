command! LivedownPreview :call s:LivedownPreview()
command! LivedownKill :call s:LivedownKill()
command! LivedownToggle :call s:LivedownToggle()

if !exists('g:livedown_autorun')
  let g:livedown_autorun = 0
endif

if !exists('g:livedown_open')
  let g:livedown_open = 1
endif

if !exists('g:livedown_port')
  let g:livedown_port = 1337
endif

function! s:LivedownRun(command)
  let a:platform_command = has('win32') ?
    \ "start /B " . a:command :
    \ a:command . " &"
  let a:Func = has('nvim') ?
    \ function('jobstart') :
    \ function('system')

  silent! call a:Func(a:platform_command)
endfunction

function! s:LivedownPreview()
  call s:LivedownRun("livedown start \"" . expand('%:p') . "\"" .
      \ (g:livedown_open ? " --open" : "") .
      \ " --port " . g:livedown_port .
      \ (exists("g:livedown_browser") ? " --browser " . g:livedown_browser : ""))
endfunction

function! s:LivedownKill()
  call s:LivedownRun("livedown stop --port " . g:livedown_port)
endfunction

function! s:LivedownToggle()
	if !exists('s:livedownPreviewFlag')
		call s:LivedownPreview() | let s:livedownPreviewFlag = 1
	else
		call s:LivedownKill() | unlet! s:livedownPreviewFlag
	endif
endfunction

