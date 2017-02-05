 "***important"{{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible

execute pathogen#infect()

" Enable syntax highlighting
syntax on

" Enable filetype plugins
filetype plugin on
filetype indent on

" map leader
nnoremap <Space> <nop>
let mapleader = " "

"}}}

"***moving around, searching and patterns"{{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"set whichwrap+=<,>,h,l,[,]
set whichwrap=b,s,h,l,<,>,[,]   " backspace and cursor keys wrap to

" cursos is kept in the same column -set nosol
set nostartofline

" Makes search act like search in modern browsers
set incsearch

" For regular expressions turn magic on
set magic

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Smart home row
" Ctrl-j: Cycle through the splits. 
nnoremap <c-j> <c-w>w
" map <C-k> <C-W>k  -- system clipboard paste
" cycle betwen previous buffer 
nnoremap <silent> <c-h> :b#<CR>
" cycle tabs 
nnoremap <silent> <c-l> :tabn<CR>
" cycle buffers 
nnoremap <silent> <s-tab> :bn<CR>

" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Speed up scrolling of the viewport slightly
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

"clearing highlighted search
nmap <silent> <leader><cr> :nohlsearch<CR>

" turns off Vim crazy default regex 
" nnoremap / /\v
" vnoremap / /\v

" global search no by default :%s/foo/bar/
set gdefault

" open ag.vim
nnoremap <leader>a :Ag -i   <left><left>
nnoremap <leader>A :LAg -i   <left><left>

let g:agprg='ag --column'

"Search and replace using quickfix list in Vim
":Ggrep findme
":Qargs | argdo %s/findme/replacement/gc | update
nnoremap <leader>9 :Qargs <bar> argdo %s/yyfind/yyreplace/gc <bar> update

" Ctrl-sr: Easier (s)earch and (r)eplace
nnoremap <leader>r :%s/<c-r><c-w>//gc<left><left><left>

"}}}

"***displaying text"{{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Minimal number of screen lines to keep above and below the cursor
set scrolloff=5
set sidescrolloff=8
set sidescroll=1

" How many lines to scroll at a time, make scrolling appears faster
set scrolljump=3

"wrap long lines at a character in 'breakat'
set linebreak               " nice word line breaks for wrap
set nowrap                  " dont wrap lines

"string to put before wrapped screen lines
set showbreak=↪

" Solid line for vsplit separator
"fillchars	characters to use for the status line, folds and filler lines
set fcs=vert:│

" Height of the command bar
set cmdheight=1

" Don't redraw while executing macros (good performance config)
set lazyredraw

"set number

"}}}

"***syntax, highlighting and spelling"{{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set background=dark

" Highlight search results
set hlsearch

set cursorline                  " highlight current line
hi cursorline guibg=\#333333     " highlight bg color of current line
hi CursorColumn guibg=\#333333   " highlight cursor

set nospell

"}}}

"***multiple windows"{{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Always show the status line
set laststatus=2

" A buffer becomes hidden when it is abandoned
" allow switching buffers, which have unsaved changes
set hidden

"}}}

"***terminal"{{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set title                " change the terminal's title

"titlelen percentage of 'columns' used for the window title
set titlelen=85

"}}}

"***using the mouse"{{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"set mouse=a              " enable mouse

"set clipboard=unnamed    " yank to X clipboard

"}}}

"***messages and info"{{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set showcmd                 " show partially typed commands

set showmode                " show the current mode

"Always show current position
set ruler

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set visualbell "No sounds

"}}}

"***editing text"{{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nopaste
set pastetoggle=<F2>

set textwidth=500

" Configure backspace so it acts as it should act
"specifies what <BS>, CTRL-W, etc. can do in Insert mode
set backspace=eol,start,indent

" comments
"definition of what comment lines look like
set com=b:#,:%,n:>

" comment character will not be automatically inserted in the next line under any situation.
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Auto complete setting
set completeopt=longest,menuone

" Enable omni completion
set omnifunc=syntaxcomplete#Complete

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set matchtime=2

"}}}

"***tabs and indenting and splits "{{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs 
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4           " used in smarttab. same as tabstop

" use multiple of shiftwidth when indenting with '<' and '>'
set shiftround

"Auto indent
set autoindent

"Smart indent
set smartindent

" copy the previous indentation on autoindenting
"copy whitespace for indenting from previous line
set copyindent

" quick split window
nnoremap <Leader>v :vsplit<cr>
nnoremap <Leader>s :split<cr>

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt

"}}}

"***folding"{{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Open all folds initially
"set nofoldenable "dont fold by default
"folding type: "manual", "indent", "expr", "marker" or "syntax"
set foldenable                  " auto fold code
set foldlevelstart=99
set foldmethod=indent

"}}}

"***mapping"{{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" timeout for shortcuts
"timeoutlen
"set tm=500

" Lower the delay of escaping out of other modes
" set timeout timeoutlen=1000 ttimeoutlen=1
"timeout allow timing out halfway into a mapping
"ttimeout allow timing out halfway into a key code
set timeout timeoutlen=500 ttimeoutlen=1

" viminfo
" Tell vim to remember certain things when we exit
"  '30  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
set viminfo='30,\"100,:20,%


"}}}

"***reading and writing files"{{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"set nomodeline             " disable mode lines (security measure)
set modeline
"number of lines to check for modelines
set modelines=1

"list of file formats to look for when editing a file
set fileformats=unix,dos,mac

" Use Unix as the standard file type
"end-of-line format: "dos", "unix" or "mac"
set fileformat=unix

" ***************
"set cm=blowfish
"set noswapfile
"set nowritebackup
"set viminfo=
"set nobackup
"set backup
"set ic hlsearch
" ***************

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowritebackup
set noswapfile

" Set to auto read when a file is changed from the outside
set autoread

"}}}

"***command line editing"{{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Sets how many lines of history VIM has to remember
set history=700

" Turn on the wild menu
"command-line completion shows a list of matches
set wildmenu

"specifies how command line completion works
set wildmode=list:longest,full
set wildmenu "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/Library/**,*/.rbenv/**
set wildignore+=*/.nx/**,*.app

"}}}

"***running make and jumping to errors"{{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"help keep ack-grep search clean
"string used to put the output of ":make" in the error file
set shellpipe=>

"}}}

"*** multi-byte characters"{{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

"}}}

" Colors and Fonts "{{{
colorscheme elflord

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T           " remove the toolbar
    set lines=40                " 40 lines of text instead of 24,
	set columns=84
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" 256bit terminal
set t_Co=256

hi Pmenu guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
"highlight PmenuSel       ctermfg=4 ctermbg=7 guifg=LightBlue

"}}}

" my timesavers "{{{

if has("user_commands")
    command! -bang -nargs=? -complete=file E e<bang> <args>
    command! -bang -nargs=? -complete=file W w<bang> <args>
    " command! -bang -nargs=? -complete=file Wq wq<bang> <args>
    " command! -bang -nargs=? -complete=file WQ wq<bang> <args>
    command! -bang Wa wa<bang>
    command! -bang WA wa<bang>
    command! -bang Q q<bang>
    command! -bang QA qa<bang>
    command! -bang Qa qa<bang>
endif

" Making it so ; works like : for commands
" nnoremap ; :

" Yank smart, to be consistent with C and D
nnoremap Y y$

" Fast saving nmap <leader>w :w!<cr> 
nmap <leader>w :w!<cr> 

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" use these to escape in insert more
imap jk <Esc>
imap kj <Esc>

" So both C-[ and C-] are equivalent to <Esc> (widen the target area)
" Note that in normal mode, C-] means follow link, so you should train 
" yourself to use C-[, this is just here in case you screw up once.
imap <C-]> <Esc>
vmap <C-]> <Esc> 

" C-a to select all
nnoremap <C-a> ggVG
inoremap <C-a> ggVG

" stop recording
nnoremap q <nop>
" stop EX mode
nnoremap Q <nop>

" U: Redos since 'u' undos
nnoremap U :redo<cr>

" H: Go to beginning of line.
noremap H ^

noremap L g_

"}}}

" my templates "{{{

nmap <F4> a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <F4> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>
" template 
nmap <F5> a<CR>username: <CR>comments: <CR><Esc>
imap <F5> <CR>username: <CR>comments: <CR>

"}}}

" my useful mappings "{{{

nnoremap <leader>n :bn<cr>
nnoremap <leader>p :bp<cr>
nnoremap <leader>d :Bdelete<cr>
nnoremap <leader>x :bufdo :Bdelete<cr>
nnoremap <leader>o :close<cr>

" fast save and exit
nmap __ :wa<CR>:qa<CR>

" fast exit
nmap == :qa<CR>
nmap qq :qa<CR>

" <Leader>``: Force quit all
nnoremap <Leader>`` :qa!<cr>

" Ctrl-sw: Quickly surround word
nmap <c-s><c-w> ysiw

" Fix annoying surround.vim message
vmap s S

"}}}

" my functions "{{{

" Auto semi colon 
" If there isn't one, append a semi colon to the end of the current line.
function s:appendSemiColon()
    if getline('.') !~ ';$'
        let original_cursor_position = getpos('.')
        exec("s/$/;/")
        call setpos('.', original_cursor_position)
    endif
endfunction

" For programming languages using a semi colon at the end of statement.
autocmd FileType c,cpp,css,java,javascript,perl,php nmap <silent><C-\> :call <SID>appendSemiColon()<cr>

"}}}

" Normal Mode Key Mappings "{{{
"===============================================================================

" n: Next, keep search matches in the middle of the window
nnoremap n nzzzv

" Search mappings: search will center on the line 
map N Nzzv

" Up Down Left Right resize splits
nnoremap <up> <c-w>+
nnoremap <down> <c-w>-
nnoremap <left> <c-w><
nnoremap <right> <c-w>>

" Tab: Go to matching element
nnoremap <tab> %
vnoremap <tab> %

" Ctrl-g: Prints current file name (TODO Not very useful)
nnoremap <c-g> 1<c-g>

" Quick scratch buffer
nnoremap <leader>8 :Scratch<CR>

"}}}

" Insert Mode Key Mappings"{{{
"===============================================================================

" Ctrl-e: Go to end of line
inoremap <c-e> <esc>A

" Ctrl-a: Go to begin of line
inoremap <c-a> <esc>I

" Ctrl-f: Move cursor left
inoremap <c-f> <Left>

" Ctrl-c: Inserts line below
inoremap <c-c> <c-o>o

" Ctrl-v: Paste. For some reason, <c-o> is not creating an undo point in the
" mapping
inoremap <c-v> <c-g>u<c-o>gP

"}}}

" Visual Mode Key Mappings "{{{
"===============================================================================
"x = visual only

" y: Yank and go to end of selection
xnoremap y y`]

" Backspace: Delete selected and go into insert mode
xnoremap <bs> c

" <|>: Reselect visual block after indent
xnoremap < <gv
xnoremap > >gv

" Tab: Indent
xmap <Tab> >

" shift-tab: unindent
xmap <s-tab> <

" Ctrl-c: Copy (works with system clipboard due to clipboard setting)
vnoremap <c-c> y`]

" Ctrl-r: Easier search and replace
vnoremap <c-r> "hy:%s/<c-r>h//gc<left><left><left>

" Ctrl-s: Easier substitue
vnoremap <c-s> :s/\%V//g<left><left><left>

"}}}

" Autocommands "{{{

" markdown all non extension files
" autocmd BufEnter * if &filetype == "conf" | setlocal ft=markdown | endif
" autocmd BufNewFile,BufRead * if expand('%:t') !~ '\.' | set syntax=sh | endif
autocmd BufNewFile,BufRead /home/ubuntu/notes/* set wrap ft=markdown

augroup allFiles
    autocmd!
    " Return to last edit position when opening files (You want this!)
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif

    autocmd BufRead *.txt set tw=80                                         " limit width to n cols for txt files
    autocmd BufRead ~/.mutt/temp/mutt-* set tw=80 ft=mail nocindent spell   " width, mail syntax hilight, spellcheck
    autocmd FileType html setlocal shiftwidth=2 tabstop=2
    autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4 makeprg=python\ %
    autocmd FileType c,cpp,h set shiftwidth=8 softtabstop=8 noexpandtab tabstop=8 makeprg=make
    autocmd FileType ruby set shiftwidth=2 softtabstop=2 tabstop=2 makeprg=ruby\ %
    autocmd FileType sh set shiftwidth=2 softtabstop=2 tabstop=2 makeprg=./%
    autocmd FileType perl set shiftwidth=4 softtabstop=4 tabstop=4 makeprg=perl\ %
    autocmd FileType java set shiftwidth=4 softtabstop=4 tabstop=4 makeprg=javac\ %
    autocmd FileType lua set shiftwidth=4 softtabstop=4 tabstop=4 makeprg=lua\ %
    autocmd FileType votl set shiftwidth=2 softtabstop=2 tabstop=2 nolist
    autocmd FileType yaml set shiftwidth=2 softtabstop=2 tabstop=2 nolist

    autocmd FileType jade set shiftwidth=2 softtabstop=2 tabstop=2 foldenable foldmethod=marker foldlevel=0 nolist
    autocmd FileType stylus set shiftwidth=2 softtabstop=2 tabstop=2 foldenable foldmethod=marker foldlevel=0 nolist
    autocmd FileType javascript set shiftwidth=2 softtabstop=2 tabstop=2 foldenable foldmethod=indent foldlevel=2 nolist
    autocmd FileType yaml set shiftwidth=2 softtabstop=2 tabstop=2 foldenable foldmethod=marker foldlevel=0 nolist

augroup END

" neocomplete autocmd - Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType javascript setlocal omnifunc=tern#Complete
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"}}}

" Plugins - General "{{{

nnoremap cc :TComment<CR> 
vnoremap cc :TCommentBlock<CR> 

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"}}}

" NERD Tree Plugin Settings "{{{
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" let g:NERDTreeWinSize = 30
" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\~$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']

" Toggle the NERD Tree on an off with F7
nmap <silent> <F7> :NERDTreeToggle<CR>

"}}}

" My latest additions "{{{

" Use local vimrc if available {
if filereadable($HOME.'/.vimrc-local')
  source $HOME/.vimrc-local
endif

nnoremap <leader>h a
nnoremap <leader>j A
nnoremap <cr> :
"nnoremap <leader><bs> /

" better recording
nnoremap <leader>1 qq
nnoremap <leader>2 q
nnoremap Q @q

" show previous commands
nnoremap <leader>6 q:

" quick region select
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" nice copy paste functionality
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" useful mappings more 
nnoremap <CR> G
nnoremap <BS> gg
nnoremap <leader><leader> :

" fast whole file alignment
nnoremap <leader>= gg=G``  

" learn to use ctr-[ instead of escape
cmap wq :

map <Enter> :w<CR>

"}}}

" vim: set foldenable foldmethod=marker foldlevel=0:
