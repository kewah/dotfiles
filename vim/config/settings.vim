" Set syntax highlighting options.
set t_Co=256
set background=dark
colorscheme base16-default

" Remove delay between modes
set timeout
set timeoutlen=1000 " Wait {num} ms before timing out a mapping
set ttimeoutlen=0 " Wait {num} ms to change mode

set autoindent
set autoread " reload files when changed on disk, i.e. via `git checkout`
" set paste
set pastetoggle=<F3>
set clipboard=unnamed " yank and paste with the system clipboard
set copyindent
set backspace=indent,eol,start
set cursorline " Highlight current line
set nu " Enable line numbers
set relativenumber
set encoding=utf-8
set gdefault " assume the /g flag on :s substitutions
set hlsearch " Highlight searches
set hidden
set ignorecase " Ignore case of searches.
set smartcase " Ignore case if search pattern is all lowercase
set incsearch " Highlight dynamically as pattern is typed.
set linespace=3 " Line height
set mousehide " Hide mouse when typing
set mouse=a
set noerrorbells " don't beep
set visualbell " don't beep
set nostartofline
set numberwidth=4

set shiftwidth=2
set spelllang=en_gb
set title " change the terminal's title

" Indent settings
set scrolloff=2 " Start scrolling three lines before horizontal border of window.
set smartindent " use smart indent if there is no indent file
set softtabstop=2
set tabstop=2
set expandtab " Expand TABs to spaces

" Open new split panes to right and bottom
set splitbelow
set splitright

set nobackup
set noswapfile

" Undo settings
set history=1000
set undofile
set undodir=~/.vim/undo
set undolevels=1000

" Don't add the comment prefix when I hit enter or o/O on a comment line.
set formatoptions-=or

" set list " Show 'invisible' characters
set listchars=tab:▸\ ,trail:·,nbsp:_ " Set characters used to indicate 'invisible' characters
set showbreak=⌞
set wrap
set linebreak
set nolist

" Folding settings
set foldmethod=manual
set foldnestmax=10 " deepest fold is 10 levels
set nofoldenable " don't fold by default
set foldlevel=1

" Wild settings
set wildchar=<TAB> " Character for CLI expansion (TAB-completion).
set wildmenu
set wildmode=full " autocomplete menu like ZSH

set wildignore="" " reset
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem " Disable output and VCS files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz " Disable archive files
set wildignore+=*/.sass-cache/* " Ignore sass cache
set wildignore+=*/.settings/* " Ignore settings folders
set wildignore+=*.pyc " Python byte code
set wildignore+=*.swp,*~,._* " Ignore temp and backup files
set wildignore+=*.png,*.jpg,*.jpeg,*.gif,*.psd,*.tiff,*.swf,*.fla " Ignore image files
set wildignore+=*.DS_Store " Ignore .DS_Store files
set wildignore+=*.ogg,*.mp3,*.aac " Ignore sound files

" Status line
set laststatus=2 " Always show status line
set statusline=[%<%f] " Filename
set statusline+=%w%h%m%r " Options
set statusline+=\ %y " Type
set statusline+=%=%-14.(%l,%c%V%)\ %p%% " Right aligned file nav info
