" This is GiaNU's Vim Configuration
" vim:set ts=2 sts=2 sw=2 expandtab:
"

" remove all existing autocmds
" autocmds!

set nocompatible

" Enable filetype detection
" Use the default filetype settings, so that mail get 'tw' set to 72,
" 'cindent' is on C files, etc
" Also load indent files, to automatically do language-dependent indenting.
" GiaNU: There is a problem if don't turn off first the filetype. FIX!!
filetype off

packadd minpac
call minpac#init()

call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('lotabout/skim', { 'dir': '~/.skim', 'do': './install' })
call minpac#add('lotabout/skim.vim') " fuzzy finder in rust
call minpac#add('tpope/vim-fugitive') " Some fancy git commands inside Git
call minpac#add('airblade/vim-gitgutter') " Show git diff
call minpac#add('janko/vim-test') " Run tests
call minpac#add('pangloss/vim-javascript')
call minpac#add('tpope/vim-commentary') " Easy way to comment
call minpac#add('machakann/vim-highlightedyank') " Highlight yanked lines
call minpac#add('HerringtonDarkholme/yats.vim') " Typescript Syntax
call minpac#add('neoclide/coc.nvim', {'branch': 'release'}) " Make neovim as smart as VSCode
call minpac#add('dbeniamine/todo.txt-vim')
call minpac#add('cespare/vim-toml')
call minpac#add('tpope/vim-surround')
call minpac#add('mileszs/ack.vim')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('scrooloose/nerdtree')
call minpac#add('morhetz/gruvbox')
call minpac#add('elixir-editors/vim-elixir')


filetype plugin indent on

set t_Co=256

if !exists('g:syntax_on')
  syntax on
endif

if !exists('g:loaded_color')
  let g:loaded_color = 1

  set background=dark
  " Put your favorite colorscheme here
  colorscheme gruvbox
endif

" syntax on
" let base16colorspace=256
" let g:hardtime_default_on = 1
"colorscheme base16-eighties
" colorscheme nord
" colorscheme gruvbox

set noerrorbells
set novisualbell
set t_vb=

let g:python3_host_prog = '/opt/homebrew/bin/python3'

" moving around, searching, and patterns ----------------------------------
set incsearch
set showmatch
set smartcase
set ignorecase smartcase
set gdefault
set inccommand=nosplit
" displaying text
set number
set linebreak
set nowrap
" syntax, highlighting, spelling
set hlsearch
set background=dark
" set colorcolumn=80

set mouse=a

" Remember more commands and search history
set history=1000
set laststatus=2

" hightlight current line
set cursorline
set nocursorcolumn
set cmdheight=1
set switchbuf=useopen

set showtabline=2
set winwidth=79
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


" :set termguicolors
"
" tabs and indenting ------------------------------------------------------
set tabstop=2 "Tab = 2 spaces in normal mode
set shiftwidth=2
set softtabstop=2 "Tab = 2 spaces in insert mode
set autoindent
set smartindent
set expandtab

"autocmd FileType typescript setlocal shiftwidth=2 tabstop=2 softtabstop=2
"autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript
autocmd FileType mail setlocal fo+=aw
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead *.txt set filetype=markdown

set shiftround
" folding -----------------------------------------------------------------
set foldmethod=manual
set foldmarker={{{,}}}
" set nofoldenable

" Insert only one space when joining lines that contain sentence-terminating
" punctuation like `.`.
set nojoinspaces


" If a file is changed outside of vim, automatically reload it wihout asking
set autoread

" Use the old vim regex engine (version 1, as opposed to version 2, which was
" introduced in Vim 7.3.969). The Ruby syntax highlighting is significantly
" slower with the new regex engine.
" set re=1


:set updatetime=300
" :set completeopt=menu,preview

let NERDTreeShowHidden=1

" let g:typescript_compiler_binary='tsc'
" let g:typescript_compiler_options='--jsx react'


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


" concealing --------------------------------------------------------------
set conceallevel=2

" spliting ----------------------------------------------------------------
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

" gui setings -------------------------------------------------------------
" if has("gui")
" 	set guioptions-=T                             "hide toolbar in mvim
" 	set guioptions-=r
" 	set guioptions-=L
" 	set guifont=hack:h20
" endif

let mapleader=','
let maplocalleader=","

" Ag and Rg using skim
command! -bang -nargs=* Ag call fzf#vim#ag_interactive(<q-args>, fzf#vim#with_preview('right:50%:hidden', 'alt-h'))
command! -bang -nargs=* Rg call fzf#vim#rg_interactive(<q-args>, fzf#vim#with_preview('right:50%:hidden', 'alt-h'))

" :set timeout timeoutlen=1000 ttimeoutlen=100


" Normally, Vim messes with iskeyword when you open a shell file. This can
" leak out, polluting other files types even after a 'set ft=' change. This
" variable prevents the iskeyword change so it can't hurt anyone.
" let g:sh_noisk=1

set modeline
set modelines=3

nnoremap \ ,
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>sv :so $MYVIMRC<cr>
nnoremap / /\v
vnoremap / /\v
nnoremap <leader><space> :noh<cr>

" project navigation  -----------------------------------------------------
" nnoremap <C-p> :Files<cr>
nnoremap <C-p> :Files<cr>
nnoremap & :execute 'Ag '.expand('<cword>')<CR>
nnoremap <leader>r :Rg<cr>

" Buffers -----------------------------------------------------------------
" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
"nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <C-l> :bnext<CR>
" Move to the previous buffer
nmap <C-h> :bprevious<CR>

"nnoremap gt :bnext<CR>
"nnoremap gT :bprevious<CR>


" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" abbreviations -----------------------------------------------------------
nnoremap ; :
vnoremap ; :
inoremap jk <esc>

cnoreabbrev W w
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev Q! q!
cnoreabbrev Tabe tabe
cnoreabbrev wrap set wrap
cnoreabbrev nowrap set nowrap

set fillchars+=vert:│
hi VertSplit ctermbg=NONE guibg=NONE

highlight ExtraWhitespace ctermbg=0 guibg=#282a2e
match ExtraWhitespace /\s\+$/

let g:yats_host_keyword = 1

" coc config, mostly copied from https://github.com/neoclide/coc.nvim
let g:coc_global_extensions = [
\ 'coc-snippets',
\ 'coc-pairs',
\ 'coc-tsserver',
\ 'coc-json',
\ 'coc-elixir'
\ ]

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

inoremap <silent><expr> <c-space> coc#refresh()

" ====================== CoC Configuration ================================
" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

command! -nargs=0 Prettier :CocCommand prettier.formatFile

vmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes



" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

nmap <leader>qf  <Plug>(coc-fix-current)

augroup javascript_folding
    au!
    au FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
augroup END

augroup todo_txt
    au!
    au filetype todo setlocal omnifunc=todo#Complete
augroup END

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

let g:go_fmt_autosave = 1

augroup go_stuff
    au!
    au FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
    au FileType go nmap <leader>r  <Plug>(go-run)
    au FileType go setlocal shiftwidth=4 tabstop=4 softtabstop=4 noexpandtab
augroup END

augroup markdown
    au!
    au FileType markdown setlocal wrap
augroup END

command! -nargs=? Fold :call     CocAction('fold', <f-args>)

hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE

if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif


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
" MAPS AND CONFIGURATION TO JUMP TO SPECIFIC COMMAND-T TARGETS AND FILES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" map <leader>f :GFiles %%<cr>
" map <leader>d :GFiles --exclude-standard --others --cached %%<cr>
map <leader>f :Files<cr>
map <leader>F :Files<cr>
" map <leader>P :Files<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree Commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <leader>t :NERDTreeToggle<cr>

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

" Custom functions
command! Scratch lua require 'tools'.makeScratch()
