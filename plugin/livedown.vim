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

if !exists('g:livedown_command')
  " Check if livedown is available globally
  let g:livedown_command = 'livedown'
  if !executable(g:livedown_command)
    " Lastly, try local livedown installation relative to plugin
    let g:livedown_command = expand('<sfile>:h') . '/../node_modules/.bin/livedown'
  endif
endif

function! s:LivedownBrowser()
  if g:livedown_browser == "chrome" && has('macunix')
    let l:browser = "'Google Chrome'"
  else
    let l:browser = g:livedown_browser
  endif

  return '"' . l:browser . '"'
endfunction

function! s:LivedownRun(command)
  let l:platform_command = has('win32') ?
    \ "start /B " . a:command :
    \ a:command . " &"
  let l:Func = has('nvim') ?
    \ function('jobstart') :
    \ function('system')

  silent! call l:Func(l:platform_command)
endfunction

function! s:LivedownPreview()
  let l:command = g:livedown_command . " start \"" . expand('%:p') . "\"" .
      \ (g:livedown_open ? " --open" : "") .
      \ " --port " . g:livedown_port .
      \ (exists("g:livedown_browser") ? " --browser " . s:LivedownBrowser() : "")

  call s:LivedownRun(command)
endfunction

function! s:LivedownKill()
  call s:LivedownRun(g:livedown_command . " stop --port " . g:livedown_port)
endfunction

function! s:LivedownToggle()
	if !exists('s:livedownPreviewFlag')
		call s:LivedownPreview() | let s:livedownPreviewFlag = 1
	else
		call s:LivedownKill() | unlet! s:livedownPreviewFlag
	endif
endfunction
