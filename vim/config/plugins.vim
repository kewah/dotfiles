" Install vim-plug if necessary
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !mkdir -p ~/.vim/autoload
  silent !curl -fLo ~/.vim/autoload/plug.vim
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')

" Plugins
Plug 'rking/ag.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'kien/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'junegunn/goyo.vim'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree', {'on':  'NERDTreeToggle'}
Plug 'gorkunov/smartpairs.vim'
" Plug 'ervandew/supertab'
Plug 'marijnh/tern_for_vim', {'do': 'npm install'}
Plug 'SirVer/ultisnips'
Plug 'bling/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'Lokaltog/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
Plug 'henrik/vim-qargs'
Plug 'kshenoy/vim-signature'
Plug 'justinmk/vim-sneak'
Plug 'bronson/vim-trailing-whitespace'
Plug 'sjl/vitality.vim'
Plug 'sjl/gundo.vim', {'on': 'GundoToggle'}
Plug 'christoomey/vim-tmux-navigator'
Plug 'wakatime/vim-wakatime'
Plug 'millermedeiros/vim-esformatter'

if !has("gui_running")
  Plug 'djoshea/vim-autoread'
endif

" Syntaxes
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'elzr/vim-json'
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'mxw/vim-jsx', {'for': 'jsx'}
Plug 'kchmck/vim-coffee-script', {'for': 'coffee'}
Plug 'mustache/vim-mustache-handlebars'
Plug 'wavded/vim-stylus', {'for': 'stylus'}

call plug#end()


" Local plugins settings
" -----------------------------------------------------------------------------

nnoremap <leader>b :call NumberToggle()<cr>
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

" Nerdtree
noremap <F2> :NERDTreeToggle<CR>
noremap <leader>nf :NERDTreeFind<cr> " Show the current buffer in NERDTree

let NERDTreeShowHidden = 1
let NERDTreeShowBookmarks = 1
let NERDTreeChDirMode = 2 " the CWD is changed whenever the tree root is changed
let NERDTreeQuitOnOpen = 1 " close nerdtree when we open a file
let NERDTreeIgnore = [ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$', '\.o$', '\.so$', '\.egg$', '\.swf$', '^\.git$', '\.os$', '\.dylib$', '\.a$', '^\.DS_Store$', '\.pdf', '\.sass-cache$', '\.settings$' ]

" Nerdtree tabs
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:nerdtree_tabs_open_on_new_tab = 0
let g:nerdtree_tabs_synchronize_view = 0

" EasyMotion
let g:EasyMotion_leader_key = '<Space>'

" Ag
set grepprg=ag\ --nogroup\ --nocolor " Use ag over grep"
nnoremap <leader>r :Ag!<space> " Search in the project
nnoremap <leader>R :Ag! "<C-R><C-W>"<CR> " Search the word under the cursor

" ctrlp
nnoremap <C-b> :CtrlPBuffer<CR>

let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 'ra' " current working dir
let g:ctrlp_switch_buffer = 0 " always open files in new buffers
let g:ctrlp_use_caching = 0 " Ag is faster enough
let g:ctrlp_extensions = ['buffertag', 'dir']
let g:ctrlp_user_command = 'ag %s -l -U --nocolor --hidden -g ""'

" Airline
let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#branch#enabled = 0
let g:airline#extension#hunks#enabled = 0
let g:airline#extensions#whitespace#checks = ['indent', 'trailing']
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

" Emmet
imap <C-e> <C-y>,
let g:use_emmet_complete_tag = 1

" Syntastic
nnoremap <silent> <down> :lnext<CR>
nnoremap <silent> <up> :lprev<CR>

let g:syntastic_check_on_open = 0
let g:syntastic_enable_signs = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_mode_map = { 'passive_filetypes': ['html', 'python'] }

" Goyo (Distraction free)
nnoremap <silent> <leader>z :Goyo<cr>

" JSON syntax
let g:vim_json_syntax_conceal = 0

" JSTern
nnoremap <leader>td :TernDef<CR>
nnoremap <leader>tr :TernRefs<CR>
nnoremap <leader>tR :TernRename<CR>

let g:tern_map_keys = 1

" sneak
let g:sneak#s_next = 1

" Ultisnips
let g:UltiSnipsEditSplit = "vertical"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger = "<c-b>"
let g:UltiSnipsJumpBackwardTrigger = "<c-z>"

" Vim session
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"

" Gists
let g:gist_open_browser_after_post = 1
let g:gist_post_private = 1

" Gundo
nnoremap <F5> :GundoToggle<CR>
let g:gundo_width = 60
let g:gundo_preview_height = 40
let g:gundo_right = 1

" JSX / React
let g:jsx_ext_required = 0

" Formatter
nnoremap <silent> <leader>es :Esformatter<CR>
vnoremap <silent> <leader>es :EsformatterVisual<CR>
nnoremap <silent> <leader>ec :CSSComb<CR>


