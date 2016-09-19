" Install vim-plug if necessary
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !mkdir -p ~/.vim/autoload
  silent !curl -fLo ~/.vim/autoload/plug.vim
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')

" ----- Plugins -----
Plug 'rking/ag.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'junegunn/goyo.vim', {'for': 'markdown'}
Plug 'junegunn/limelight.vim', {'for': 'markdown'}
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'gorkunov/smartpairs.vim'
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'xolox/vim-easytags'
Plug 'Lokaltog/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
Plug 'henrik/vim-qargs'
Plug 'kshenoy/vim-signature'
Plug 'justinmk/vim-sneak'
Plug 'bronson/vim-trailing-whitespace'
Plug 'sjl/vitality.vim'
Plug 'sjl/gundo.vim', {'on': 'GundoToggle'}
Plug 'kewah/vim-stylefmt', {'on': ['Stylefmt', 'StylefmtVisual']}
Plug 'majutsushi/tagbar'
Plug 'godlygeek/tabular', {'on': 'Tabularize'}
Plug 'kana/vim-smartword'
Plug 'airblade/vim-gitgutter', {'on': 'GitGutterToggle'}
Plug 'wakatime/vim-wakatime'
Plug 'terryma/vim-smooth-scroll'
Plug 'jaawerth/nrun.vim'

if has('nvim')
  Plug 'neomake/neomake'
endif

" JavaScript
Plug 'millermedeiros/vim-esformatter', {'on': ['Esformatter', 'EsformatterVisual']}
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mvolkmann/vim-js-arrow-function', { 'for': ['javascript', 'javascript.jsx'] }
" Plug 'flowtype/vim-flow', { 'for': ['javascript', 'javascript.jsx'] }

" Syntaxes
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'othree/html5.vim'
Plug 'LeonB/HTML-AutoCloseTag'
Plug 'hail2u/vim-css3-syntax'
Plug 'tpope/vim-git'
Plug 'elzr/vim-json', {'for': 'json'}
Plug 'kchmck/vim-coffee-script', {'for': 'coffee'}
Plug 'mustache/vim-mustache-handlebars', {'for': ['mustache', 'hbs', 'html.handlebars']}
Plug 'wavded/vim-stylus', {'for': 'stylus'}
Plug 'digitaltoad/vim-jade', {'for': 'jade'}
Plug 'mutewinter/nginx.vim', {'for': 'nginx'}
Plug 'StanAngeloff/php.vim', {'for': 'php'}
Plug '2072/PHP-Indenting-for-VIm', {'for': 'php'}
Plug 'mitsuhiko/vim-python-combined', {'for': 'python'}
Plug 'elmcast/elm-vim', {'for': 'elm'}
Plug 'elixir-lang/vim-elixir', {'for': 'elixir'}

call plug#end()

autocmd BufNewFile,BufRead *.mustache set filetype=mustache
autocmd BufNewFile,BufRead *.css set filetype=less


" Local plugins settings
" -----------------------------------------------------------------------------

nnoremap <leader>n :call RenameFile()<cr>
nnoremap <leader>ss :call StripWhitespace()<CR>
nnoremap <silent> <F10> :call ToggleErrors()<CR>

" Window managment
nnoremap <silent> <leader>w<Space> :call WMFocusMasterWindow()<CR>
nnoremap <silent> <leader>w<CR> :call WMSwapWithMasterWindow()<CR>
nnoremap <leader>wm :call WMMarkWindowSwap()<CR>
nnoremap <leader>wx :call WMDoWindowSwap()<CR>
nnoremap <leader>wt :call WMReStack()<CR>


" Remote plugins settings
" -----------------------------------------------------------------------------

" ------ scrooloose/nerdtree settings -----
" Show the current buffer in NERDTree
noremap <leader>k :NERDTreeFind<cr>
let NERDTreeShowHidden = 1
let NERDTreeShowBookmarks = 1
" The CWD is changed whenever the tree root is changed
let NERDTreeChDirMode = 2
" Close nerdtree when we open a file
let NERDTreeQuitOnOpen = 1
let NERDTreeIgnore = [ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$', '\.o$', '\.so$', '\.egg$', '\.swf$', '^\.git$', '\.os$', '\.dylib$', '\.a$', '^\.DS_Store$', '\.pdf', '\.sass-cache$', '\.settings$' ]

" ------ jistr/vim-nerdtree-tabs settings -----
noremap <F2> :NERDTreeToggle<CR>
noremap <leader>v :NERDTreeFocusToggle<CR>
let nerdtree_tabs_open_on_gui_startup = 0

" ----- Lokaltog/vim-easymotion settings -----
let g:EasyMotion_leader_key = '<Space>'

" ----- rking/ag.vim settings ------
set grepprg=ag\ --nogroup\ --nocolor " Use ag over grep"
nnoremap <leader>r :Ag!<space>
nnoremap <leader>R :Ag! "<C-R><C-W>"<CR>

" ----- kien/ctrlp.vim settings ------
nnoremap <C-x> :CtrlPBuffer<CR>
let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 'ra' " current working dir
let g:ctrlp_switch_buffer = 0 " always open files in new buffers
let g:ctrlp_use_caching = 0 " Ag is faster enough
let g:ctrlp_extensions = ['buffertag', 'dir']
let g:ctrlp_user_command = 'ag %s -l -U --nocolor --hidden -g ""'

" ----- bling/vim-airline settings -----
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#whitespace#checks = ['indent', 'trailing']
let g:airline#extensions#hunks#enabled = 0
let g:airline_powerline_fonts = 1
let g:airline_theme = 'powerlineish'

if !has("gui_running")
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

  " unicode symbols
  let g:airline_left_sep = '»'
  let g:airline_left_sep = ''
  let g:airline_right_sep = '«'
  let g:airline_right_sep = ''
  let g:airline_symbols.linenr = '␊'
  let g:airline_symbols.linenr = '␤'
  let g:airline_symbols.linenr = 'LN'
  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.paste = 'Þ'
  let g:airline_symbols.paste = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
endif

" ----- mattn/emmet-vim settings -----
imap <C-e> <C-y>,
let g:use_emmet_complete_tag = 1
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx'
\  },
\}

" Syntastic
let g:syntastic_check_on_wq = 1
let g:syntastic_check_on_open = 0
let g:syntastic_enable_signs = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_javascript_eslint_exec = nrun#Which('eslint')
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_mode_map = {'passive_filetypes': ['html']}

" ----- junegunn/goyo.vim settings -----
nnoremap <silent> <leader>z :Goyo 81<cr>

function! s:goyo_enter()
  if has('gui_running')
    set guifont=Consolas\ for\ Powerline:h16
    set linespace=7
  endif
  Limelight
endfunction

function! s:goyo_leave()
  Limelight!

  if has('gui_running')
    set guifont=Consolas\ for\ Powerline:h13
    set linespace=3
  endif
endfunction

autocmd  User GoyoEnter nested call :goyo_enter()
autocmd  User GoyoLeave nested call :goyo_leave()

" ----- elzr/vim-json settings -----
let g:vim_json_syntax_conceal = 0

" ----- justinmk/vim-sneak settings -----
let g:sneak#s_next = 1

" ----- SirVer/ultisnips settings -----
let g:UltiSnipsEditSplit = "vertical"
let g:UltiSnipsExpandTrigger="<c-p>"
let g:UltiSnipsJumpForwardTrigger = "<c-b>"
let g:UltiSnipsJumpBackwardTrigger = "<c-z>"

" ----- pangloss/vim-javascript -----
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"

" ----- mattn/gist-vim settings -----
let g:gist_open_browser_after_post = 1
let g:gist_post_private = 1

" ----- sjl/gundo.vim settings -----
nnoremap <F5> :GundoToggle<CR>
let g:gundo_width = 60
let g:gundo_preview_height = 40
let g:gundo_right = 1

" ----- pangloss/vim-javascript -----
let g:javascript_ignore_javaScriptdoc = 1

" ----- mxw/vim-jsx settings -----
" autocmd BufNewFile,BufRead *.jsx set ft=javascript
let g:jsx_ext_required = 0
let g:jsx_pragma_required = 0

" ----- millermedeiros/vim-esformatter settings -----
nnoremap <silent> <leader>es :Esformatter<CR>
vnoremap <silent> <leader>es :EsformatterVisual<CR>

" ----- kewah/vim-stylefmt settings -----
nnoremap <silent> <leader>cs :Stylefmt<CR>
vnoremap <silent> <leader>cs :StylefmtVisual<CR>

" ----- xolox/vim-easytags settings -----
" Where to look for tags files
set tags=~/.vim/tags
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" ----- majutsushi/tagbar settings -----
" Open/close tagbar with ,b
nnoremap <silent> <leader>b :TagbarToggle<CR>

" ----- tpope/vim-commentary settings -----
autocmd FileType apache set commentstring=#\ %s
autocmd FileType php set commentstring=\/\/\ %s
autocmd FileType less set commentstring=\/\*\ %s\ \*\/

" ----- elmcast/elm-vim settings -----
nnoremap <silent> <leader>ef :ElmFormat<CR>
nnoremap <silent> <leader>et :ElmTest<CR>
let g:elm_format_autosave = 0

" ----- kana/vim-smartword settings -----
map <space>w <Plug>(smartword-w)
map <space>b <Plug>(smartword-b)
map <space>e <Plug>(smartword-e)
map <space>ge <Plug>(smartword-ge)

" ----- airblade/vim-gitgutter -----
let g:gitgutter_enabled = 0
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

nnoremap <silent> <leader>g :GitGutterToggle<CR>
nnoremap ]h <Plug>GitGutterNextHunk
nnoremap [h <Plug>GitGutterPrevHunk
nnoremap <Leader>ha <Plug>GitGutterStageHunk
nnoremap <Leader>hu <Plug>GitGutterRevertHunk

" ----- terryma/vim-smooth-scroll -----
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" ----- neomake/neomake -----
if has('nvim')
  " Run NeoMake on read and write operations
  autocmd! BufReadPost,BufWritePost * Neomake

  " Disable inherited syntastic
  let g:syntastic_mode_map = {'passive_filetypes': ['html', 'javascript', 'json']}

  let g:neomake_serialize = 1
  let g:neomake_serialize_abort_on_error = 1
  let g:neomake_javascript_eslint_exe = nrun#Which('eslint')
  let g:neomake_javascript_enabled_makers = ['eslint']
  let g:neomake_json_enabled_makers = ['jsonlint']
endif

" ----- Shougo/deoplete.nvim -----
if has('nvim')
  let g:deoplete#enable_at_startup = 1
endif
