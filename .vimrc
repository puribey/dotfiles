" This is GiaNU's Vim Configuration
" vim:set ts=2 sts=2 sw=2 expandtab:
"

" remove all existing autocmds
autocmd!

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LOAD Plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

" My Bundles
Plug 'tomtom/tcomment_vim'
" Plug 'rakr/vim-one'
" Plug 'skalnik/vim-vroom'
" Plug 'othree/yajs.vim'
" Plug 'othree/es.next.syntax.vim'
" Plug 'mxw/vim-jsx'
" Plug 'peitalin/vim-jsx-typescript'
" Plug 'dag/vim-fish'
" Plug 'elixir-editors/vim-elixir'
Plug 'scrooloose/nerdtree'
" Plug 'ekalinin/Dockerfile.vim'
Plug 'leafgarland/typescript-vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'Quramy/tsuquyomi'
Plug 'w0rp/ale'

" Plug 'jvirtanen/vim-hcl'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
" Plug 'zivyangll/git-blame.vim'
" Plug 'godlygeek/tabular'
" Plug 'plasticboy/vim-markdown'
" Plug 'martinda/Jenkinsfile-vim-syntax'
" Plug 'cespare/vim-toml'
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'jonathanfilip/vim-lucius'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BASIC CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
" Allow unsaved background buffers and remember marks/undo for them
set hidden
" Remember more commands and search history
set history=1000
set expandtab "Turn tabs into spaces
set tabstop=2 "Tab = 2 spaces in normal mode
set shiftwidth=2
set softtabstop=2 "Tab = 2 spaces in insert mode
set autoindent
set laststatus=2
set showmatch
set incsearch
set hlsearch
" Make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase
" highlight current line
set cursorline
set nocursorcolumn
set cmdheight=1
set switchbuf=useopen
set showtabline=2
set winwidth=79
" set numberwidth=5
set shell=bash
" Prevent vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=
" Keep more context when scrolling off the end of a buffer
set scrolloff=3
set scrolljump=8
" Store temporary files in a central spot
set nobackup
set nowritebackup
set backupdir=~/.vim-tmp,~/.tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,/var/tmp./tmp
" Allow backspacing over everything in insert mode
set backspace=indent,eol,start
" Display incomplete command
set showcmd
" Display the line number and column number
" set ruler
" Show line number in the left side
set number
" Enable syntax highlighting
syntax on
" Enable filetype detection
" Use the default filetype settings, so that mail get 'tw' set to 72,
" 'cindent' is on C files, etc
" Also load indent files, to automatically do language-dependent indenting.
" GiaNU: There is a problem if don't turn off first the filetype. FIX!!
filetype off
" Use emacy-style tab completion when selection file, etc.
" If I want to show $ at the end of the line, wildmode=longest,list
set wildmode=list:longest,full
" Make tab completion for files/buffer act like bash
set wildmenu
" Se the prefered encoding of the files
set fileencoding=utf-8
set fileencodings=utf-8
set encoding=utf-8
set lazyredraw

:set termguicolors

let mapleader=","
let maplocalleader=","

:set timeout timeoutlen=1000 ttimeoutlen=100

" Normally, Vim messes with iskeyword when you open a shell file. This can
" leak out, polluting other files types even after a 'set ft=' change. This
" variable prevents the iskeyword change so it can't hurt anyone.
let g:sh_noisk=1

set modeline
set modelines=3

set foldmethod=manual
set nofoldenable

" Insert only one space when joining lines that contain sentence-terminating
" punctuation like `.`.
set nojoinspaces
" If a file is changed outside of vim, automatically reload it wihout asking
set autoread

" Use the old vim regex engine (version 1, as opposed to version 2, which was
" introduced in Vim 7.3.969). The Ruby syntax highlighting is significantly
" slower with the new regex engine.
set re=1


filetype plugin indent on

:set updatetime=200
:set completeopt=menu,preview

let NERDTreeShowHidden=1

" let g:typescript_compiler_binary='tsc'
" let g:typescript_compiler_options='--jsx react'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM AUTOCMD
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l,c)
endfunction

augroup vimrcEx
  " Clear all autocmds in the group
  autocmd!
  autocmd FileType text setlocal textWidth=78
  " Jump to last cursor position unless it's invalid or in event handler
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Autoindent with two spaces, always expand tabs.
  autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2 et
  autocmd FileType python set sw=4 sts=4 et

  autocmd! BufRead, BufNewfile *.sass set filetype sass

  autocmd BufRead *.mkd set ai formatoptions=tcroqn2 comments=n:&gt;
  autocmd BufRead *.markdown set ai formatoptions=tcroqn2 comments=n:&gt;

  " Indent p tags
  if !exists("g:html_indent_tags")
    let g:html_indent_tags=""
  endif
  autocmd FileType html,eruby if g:html_indent_tags !~ '\\|p\>' | let g:html_indent_tags .= '\|p\|li\|dt\|dd\|nav\|section' | endif

  " Don't syntax highight markdown because it's often wrong
  autocmd! FileType mkd setlocal syn=off

  " Remove Trailing whitespace
  autocmd FileType c,cpp,java,php,ruby,python,javascript autocmd BufWritePre <buffer> :call StripTrailingWhitespaces()


  autocmd BufWritePre * :%s/\s\+$//e
augroup END

autocmd FileType go setlocal autoindent noexpandtab tabstop=4 shiftwidth=4
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOR
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :set t_Co=256
" syntax enable

" colorscheme gruvbox
colorscheme lucius
:set background=dark

" highlight Comment cterm=italic

" STATUS LINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM-ALE CONFIG
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = {'javascript': [], 'typescript': ['tsserver', 'eslint'], 'typescript.tsx': ['tsserver', 'eslint']}
let g:ale_fixers = {'javascript': [], 'typescript': ['prettier'], 'typescript.tsx': ['prettier']}
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_delay = 0
let g:ale_set_quickfix = 0
let g:ale_set_loclist = 0
let g:ale_javascript_eslint_executable = 'eslint --cache'
nnoremap gj :ALENextWrap<cr>
nnoremap gk :ALEPreviousWrap<cr>
nnoremap g1 :ALEFirst<cr>
" This mapping will kill all ALE-related processes (including tsserver). It's
" necessary when those processes get confused. E.g., tsserver will sometimes
" show type errors that don't actually exist. I don't know exactly why that
" happens yet, but I think that it's related to renaming files.
nnoremap g0 :ALEStopAllLSPs<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tsuquyomi
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-ale handles TypeScript quickfix, so tell Tsuquyomi not to do it.
let g:tsuquyomi_disable_quickfix = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC KEY MAP
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set clipboard=unnamed
vmap <C-c> y:call system("pbcopy", getreg("\""))<CR>
nmap <leader>y :call setreg("\"", system("pbpaste"))<CR>p

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
" Insert hashrocket with <c-l> in insert mode
imap <c-l> <space>=><space>
imap <c-c> <esc>
" Clear the search buffer when hitting return
:nnoremap <CR> :nohlsearch<cr>
nnoremap <leader><leader> <c-^>

"Align selected lines
vnoremap <leader>ib :!align<cr>

" Close all other splits
nnoremap <leader>o :only<cr>
" Toggle NERDTree
" nnoremap <C-\> :NERDTreeToggle<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ARROW KEYS ARE UNACCEPTABLE (great Idea GRB!)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Left> :echo "no!"<cr>
map <Right> :echo "no!"<cr>
map <Up> :echo "no!"<cr>
map <Down> :echo "no!"<cr>

inoremap <Left> <NOP>
inoremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPEN FILE IN DIRECTORY OF CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! GetCurrentPath()
  let file_path = expand('%:h')
  if strlen(file_path) == 0
    return './'
  else
    return file_path.'/'
  endif
endfunction

cnoremap %% <C-R>=GetCurrentPath()<cr>
map <leader>e :edit %%
map <leader>v :view %%

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name:', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
  endif
endfunction
map <leader>n :call RenameFile()<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAPS AND CONFIGURATION TO JUMP TO SPECIFIC COMMAND-T TARGETS AND FILES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <leader>f :GFiles %%<cr>
" map <leader>d :GFiles --exclude-standard --others --cached %%<cr>
" map <leader>f :Files<cr>
map <leader>F :Files<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" INSERT CURRENT TIME
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! InsertTime :normal a<c-r>=strftime('%F %H:%M:%S.0 %z')<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC COMMANDS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Find non-printable characters
map <leader>nc :/[^ -~\t]\+<cr>
" Edit .vimrc file
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALIGNMENT COMMANDS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:easy_align_delimiters = {'f': { 'pattern': 'from' } }
"
" vmap <Enter> <Plug>(EasyAlign)
"
" nmap ga <Plug>(EasyAlign)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree Commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <leader>t :NERDTreeToggle<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" git related Commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" map <leader>b :Gblame<cr>
map <leader>b :<C-u>call gitblame#echo()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TSX Color support
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" dark red
hi tsxTagName guifg=#E06C75

" orange
hi tsxCloseString guifg=#F99575
hi tsxCloseTag guifg=#F99575
hi tsxAttributeBraces guifg=#F99575
hi tsxEqual guifg=#F99575

" yellow
hi tsxAttrib guifg=#F8BD7F cterm=italic

" light-grey
hi tsxTypeBraces guifg=#999999
" dark-grey
hi tsxTypes guifg=#666666

hi ReactState guifg=#C176A7
hi ReactProps guifg=#D19A66
hi Events ctermfg=204 guifg=#56B6C2
hi ReduxKeywords ctermfg=204 guifg=#C678DD
hi WebBrowser ctermfg=204 guifg=#56B6C2
hi ReactLifeCycleMethods ctermfg=204 guifg=#D19A66
