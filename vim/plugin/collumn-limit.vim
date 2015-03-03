" Hightlight when the line is longer than 80 chars
augroup collumnLimit
  autocmd!
  autocmd BufEnter,WinEnter,Filetype javascript,markdown,php
    \ highlight CollumnLimit guibg=NONE guifg=VioletRed gui=bold
  let collumnLimit = 80
  let pattern = '\%<' . (collumnLimit+1) . 'v.\%>' . collumnLimit . 'v'
  autocmd BufEnter,WinEnter,Filetype javascript,markdown,php
    \ let w:m1=matchadd('CollumnLimit', pattern, -1)
augroup END
