" Don't use arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" No more help key.
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" No Ex mode (see :help Q)
nnoremap Q <nop>

" Mapping semicolon to colon for quicker colon commands
noremap ; :
noremap : ;

nnoremap ! :!

" Switch to normal mode
inoremap jk <ESC>

" Quickly move to the beginning or end of a line
nnoremap H ^
nnoremap L $

" Buffer
nnoremap <leader>q :bp\|bd #<CR> " Delete the current buffer
nnoremap <space>l :bnext<CR> " Go to next buffer
nnoremap <space>h :bprevious<CR> " Go to next buffer

" Indent
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Remap j and k to act as expected when used on long, wrapped, lines
nnoremap j gj
nnoremap k gk

" Center search matches
nnoremap n nzzzv
nnoremap N Nzzzv

" Use ,d (or ,dd or ,dj or 20,dd) to delete a line without adding it to the
" yanked stack (also, in visual mode)
nmap <silent> <leader>d "_d
vmap <silent> <leader>d "_d

" Paste last yank
nmap <leader>p "0p
nmap <leader>P "0P

" Quick yanking to the end of the line
nmap Y y$

" Select just-pasted text
nnoremap gp `[v`]

" add a blank line below or above and keep the cursor in place
nmap <S-Return> O<Esc>j
nmap <CR> o<Esc>k

" Insert a new link before/after (like ST)
imap <D-Return> <C-o>o
imap <S-Return> <C-o>O

nmap <space>o }O

" Speed up viewport scrolling
nnoremap <C-e> 4<C-e>
nnoremap <C-y> 4<C-y>

" Search
nnoremap <silent> <leader><space> :noh<cr>

" Fold inner curly braces
nmap <leader>f zfiB

" Indent inner curly braces
nmap <leader>i =iB<C-o>

" Better split switching (Ctrl-j, Ctrl-k, Ctrl-h, Ctrl-l)
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Fix <C-h> on neovim
if has('nvim')
  nmap <BS> <C-W>h
endif

" change window position
map <leader>wh <C-w>t<C-w>H
map <leader>wv <C-w>t<C-w>K

" Moving selection
vnoremap <C-k> :mo'<-- <CR> gv
vnoremap <C-j> :mo'>+ <CR> gv

" switch between tabs
noremap <Right> :tabn<CR>
noremap <Left> :tabp<CR>

" leader+1...9 = go to that tab
map <silent> <leader>1 1gt
map <silent> <leader>2 2gt
map <silent> <leader>3 3gt
map <silent> <leader>4 4gt
map <silent> <leader>5 5gt
map <silent> <leader>6 6gt
map <silent> <leader>7 7gt
map <silent> <leader>8 8gt
map <silent> <leader>9 9gt

" Auto indent with a new line
imap <C-Return> <CR><CR><C-o>k<Tab>

" automatically expands to the path of the active buffer
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
noremap <leader>oe :e %%
noremap <leader>os :sp %%
noremap <leader>ov :vsp %%
noremap <leader>ot :tabe %%

" open the file under the cursor in a vertical panel
nnoremap <leader>of <C-w>f<C-w>L

if &term =~ "xterm" || &term =~ "screen" || &term =~ "builtin_gui"
  " Ctrl-Enter
  set  <F13>=[25~
  map  <F13> <C-CR>
  map! <F13> <C-CR>

  " Shift-Enter
  set  <F14>=[27~
  map  <F14> <S-CR>
  map! <F14> <S-CR>

  " Ctrl-Space
  set  <F15>=[29~
  map  <F15> <C-Space>
  map! <F15> <C-Space>

  " Ctrl-Backspace
  set  <F17>=[1;5P
  map  <F17> <C-BS>
  map! <F17> <C-BS>

  " Alt-Tab
  set  <F18>=[1;5Q
  map  <F18> <M-Tab>
  map! <F18> <M-Tab>

  " Alt-Shift-Tab
  set  <F19>=[1;5R
  map  <F19> <M-S-Tab>
  map! <F19> <M-S-Tab>

  " Ctrl-Comma
  set  <F26>=[33~
  map  <F26> <C-,>
  map! <F26> <C-,>
endif
