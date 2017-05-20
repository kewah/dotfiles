" vim:foldmethod=marker:foldlevel=0

" Install vim-plug if necessary
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !mkdir -p ~/.vim/autoload
  silent !curl -fLo ~/.vim/autoload/plug.vim
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')

" colorschemes
Plug 'chriskempson/base16-vim'
Plug 'mhartington/oceanic-next'
Plug 'joshdick/onedark.vim'

" utilities
Plug 'henrik/vim-qargs', {'on': 'Qdo'}
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-repeat'
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-scripts/matchit.zip'
Plug 'tpope/vim-sleuth'
Plug 'wesQ3/vim-windowswap'
Plug 'terryma/vim-multiple-cursors'
Plug 'gorkunov/smartpairs.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'rking/ag.vim' "{{{
  set grepprg=ag\ --nogroup\ --nocolor " Use ag over grep
  nnoremap <leader>r :Ag!<space>
  nnoremap <leader>R :Ag! "<C-R><C-W>"<CR>
"}}}
Plug 'tpope/vim-commentary' "{{{
  autocmd FileType apache set commentstring=#\ %s
  autocmd FileType php set commentstring=\/\/\ %s
  autocmd FileType less set commentstring=\/\*\ %s\ \*\/
"}}}
Plug 'xolox/vim-misc' | Plug 'xolox/vim-session', { 'on': ['OpenSession', 'SaveSession', 'DelteSession', 'CloseSession'] } "{{{
  let g:session_directory = "~/.cache/vim-session"
  let g:session_autoload = "no"
  let g:session_autosave = "no"
" }}}
Plug 'bronson/vim-trailing-whitespace' " {{{
  nnoremap <leader>ss :FixWhitespace<CR>
" }}}
Plug 'sbdchd/neoformat', { 'do': 'npm install -g prettier stylefmt' } " {{{
  nnoremap <silent> <leader>es :Neoformat<CR>
  vnoremap <silent> <leader>es :Neoformat<CR>
  let g:neoformat_javascript_prettier = {
    \ 'exe': 'prettier',
    \ 'args': ['--single-quote', '--trailing-comma es5'],
    \ 'stdin': 1,
  \ }
  let g:neoformat_enabled_javascript = ['prettier']
  let g:neoformat_enabled_css = ['stylefmt']
  let g:neoformat_try_formatprg = 1
  let g:neoformat_basic_format_retab = 1
  let g:neoformat_basic_format_trim = 1
" }}}
Plug 'w0rp/ale' " {{{
  nmap <silent> <leader>[ <Plug>(ale_previous_wrap)
  nmap <silent> <leader>] <Plug>(ale_next_wrap)
  let g:ale_lint_on_save = 1
  let g:ale_lint_on_text_changed = 0
  let g:ale_linters = {
    \ 'javascript': ['eslint']
  \}
  highlight clear ALEWarningSign
" }}}
Plug 'SirVer/ultisnips' " {{{
  let g:UltiSnipsEditSplit = "vertical"
  let g:UltiSnipsJumpForwardTrigger="<tab>"
  let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
  let g:UltiSnipsExpandTrigger="<nop>"
  let g:ulti_expand_or_jump_res = 0
" }}}
Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' } " {{{
  autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>
  let g:tern_show_argument_hints='on_hold'
  let g:tern_map_keys=1
" }}}
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' } " {{{
  let g:ycm_key_list_select_completion=["<tab>"]
  let g:ycm_key_list_previous_completion=["<s-tab>"]
  let g:ycm_autoclose_preview_window_after_completion = 1

  function! <SID>ExpandSnippetOrReturn()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
      return snippet
    else
      return "\<CR>"
    endif
  endfunction
  inoremap <expr> <CR> pumvisible() ? "<C-R>=<SID>ExpandSnippetOrReturn()<CR>" : "\<CR>"
" }}}

" Navigation
Plug 'kshenoy/vim-signature'
Plug 'ctrlpvim/ctrlp.vim' " {{{
  nnoremap <C-x> :CtrlPBuffer<CR>
  let g:ctrlp_map = '<c-p>'
  let g:ctrlp_working_path_mode = 'ra' " current working dir
  let g:ctrlp_switch_buffer = 0 " always open files in new buffers
  let g:ctrlp_clear_cache_on_exit = 0
  let g:ctrlp_cache_dir = '~/.cache/ctrlp'
  if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l -U --nocolor --hidden -g ""'
  endif
" }}}
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] } " {{{
  noremap <F2> :NERDTreeToggle<CR>
  noremap <leader>k :NERDTreeFind<cr>
  let NERDTreeShowHidden = 1
  let NERDTreeShowBookmarks = 1
  let NERDTreeChDirMode = 2
  let NERDTreeQuitOnOpen = 1
  let NERDTreeIgnore = [
    \ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$', '\.o$',
    \ '\.so$', '\.egg$', '\.swf$', '^\.git$', '\.os$',
    \ '\.dylib$', '\.a$', '^\.DS_Store$', '\.pdf',
    \ '\.sass-cache$', '\.settings$'
  \]
" }}}
Plug 'jistr/vim-nerdtree-tabs' " {{{
  let nerdtree_tabs_open_on_gui_startup = 0
" }}}
Plug 'Lokaltog/vim-easymotion' " {{{
  let g:EasyMotion_leader_key = '<Space>'
" }}}
Plug 'justinmk/vim-sneak' " {{{
  let g:sneak#s_next = 1
" }}}
Plug 'terryma/vim-smooth-scroll' " {{{
  noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
  noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
  noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
  noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
" }}}

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git', { 'for': ['git', 'gitcommit', 'gitconfig', 'gitrebase', 'gitsendemail'] }

" GUI
Plug 'vim-airline/vim-airline' " {{{
  let g:airline_powerline_fonts=1
  let g:airline_left_sep=''
  let g:airline_right_sep=''
  let g:airline#extensions#whitespace#checks = ['indent', 'trailing']
  let g:airline#extensions#tabline#enabled = 0
  let g:airline#extensions#branch#enabled = 0
  let g:airline#extensions#hunks#enabled = 0
" }}}
Plug 'vim-airline/vim-airline-themes' " {{{
  let g:airline_theme='oceanicnext'
" }}}

" html / templates
Plug 'gregsexton/MatchTag', { 'for': 'html' }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'mustache/vim-mustache-handlebars', { 'for': ['html.handlebars', 'html.mustache'] }
Plug 'digitaltoad/vim-pug', { 'for': ['jade', 'pug'] }
Plug 'mattn/emmet-vim', { 'for': 'html' } " {{{
  imap <C-e> <C-y>,
  let g:use_emmet_complete_tag = 1
  let g:user_emmet_settings = {
    \ 'javascript' : {
    \     'extends' : 'jsx'
    \ }
  \}
" }}}

" JavaScript
Plug 'othree/yajs.vim', { 'for': ['javascript.jsx', 'javascript'] }
Plug 'moll/vim-node'
Plug 'mvolkmann/vim-js-arrow-function', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx', 'html'] } " {{{
  let g:javascript_ignore_javaScriptdoc = 1
  let g:javascript_plugin_flow = 1
" }}}
Plug 'mxw/vim-jsx', { 'for': ['javascript.jsx', 'javascript'] } " {{{
  let g:jsx_ext_required = 0
  let g:jsx_pragma_required = 0
" }}}

" CSS
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
Plug 'wavded/vim-stylus', { 'for': ['stylus', 'markdown'] }
Plug 'groenewege/vim-less', { 'for': 'less' }

" language-specific plugins
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'StanAngeloff/php.vim', {'for': 'php'}
Plug '2072/PHP-Indenting-for-VIm', {'for': 'php'}
Plug 'mitsuhiko/vim-python-combined', {'for': 'python'}
Plug 'elmcast/elm-vim', {'for': 'elm'}
Plug 'elixir-lang/vim-elixir', {'for': 'elixir'}
Plug 'mutewinter/nginx.vim', {'for': 'nginx'}

Plug 'elzr/vim-json', { 'for': 'json' } " {{{
  let g:vim_json_syntax_conceal = 0 " don't hide quotes in json files
" }}}

call plug#end()
