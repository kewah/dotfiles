if exists("wm_loaded")
  finish
endif
let wm_loaded = 1

function! WMFocusMasterWindow()
  exe "1wincmd w"
endfunction

function! WMSwapWithMasterWindow()
  call WMMarkWindowSwap()
  call WMFocusMasterWindow()
  call WMDoWindowSwap()
endfunction

function! WMMarkWindowSwap()
  let g:markedWinNum = winnr()
endfunction

function! WMDoWindowSwap()
  let curNum = winnr()
  let curBuf = bufnr( "%" )
  exe g:markedWinNum . "wincmd w"

  let markedBuf = bufnr( "%" )
  exe 'hide buf' curBuf

  exe curNum . "wincmd w"
  exe 'hide buf' markedBuf
endfunction

function! WMReStack()
  let curBuf = bufnr( "%" )
  exe "windo wincmd K"
  let bufWinNum = bufwinnr( curBuf )
  exe bufWinNum . "wincmd w"
  exe "wincmd H"
endfunction
