"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Version: 
"       18.01 - 08/29/2019
"
" Sections:
"    -> Initialize
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> Searching vimgrep 
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"    -> Filetypes and Completions
"    -> LeaderMappings
"    -> Useful
"    -> ModeMappings
"    -> Plugins - normal
"    -> Plugins - development
"
augroup Omni
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Initialize
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible 
filetype off

" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
call plug#begin()

" Normal -STD
Plug 'itchyny/lightline.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'justinmk/vim-dirvish'
Plug 'moll/vim-bbye'
Plug 'vim-scripts/matchit.zip'
Plug 'Valloric/MatchTagAlways'
Plug 'alvan/vim-closetag'
Plug 'tomasr/molokai'
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-unimpaired'
Plug 'milkypostman/vim-togglelist'
Plug 'kshenoy/vim-signature'
Plug 'Raimondi/delimitMate'
" Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'rhysd/clever-f.vim'
Plug 'tommcdo/vim-lion'
Plug 'junegunn/vim-peekaboo'
Plug 'terryma/vim-expand-region'
Plug 'ledger/vim-ledger'
Plug 'vimoutliner/vimoutliner'
Plug 'mtth/scratch.vim'
Plug 'plasticboy/vim-markdown'
Plug 'lambdalisue/vim-foldround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
Plug 'kana/vim-arpeggio'
Plug 'jamessan/vim-gnupg'

Plug 'svermeulen/vim-cutlass'
Plug 'svermeulen/vim-yoink'
Plug 'svermeulen/vim-subversive'

Plug 'tpope/vim-commentary'
Plug 'lfilho/cosco.vim'

Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-function'
Plug 'jasonlong/vim-textobj-css'
Plug 'kana/vim-textobj-line'
Plug 'haya14busa/vim-textobj-function-syntax'
Plug 'zirrostig/vim-schlepp'

"startabc
if $HSDVIM == 'dev'
  " load DEVELOPMENT vimrc
  source $HOME/.dotfiles/vim-dev
endif
"endabc

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable filetype plugins
filetype plugin on
filetype indent on

" syntax highlighting
syntax on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
"let mapleader = ","
"let g:mapleader = ","
nnoremap <Space> <nop>
let mapleader = " "

" Fast saving
nnoremap <leader>w :w!<cr>

" Sets how many lines of history VIM has to remember
set history=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set scrolloff=7
set sidescrolloff=8
set sidescroll=1

" Avoid garbled characters in Chinese language windows OS
let $LANG='en' 
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the WiLd menu
set wildmenu
" set wildmode=list:longest,full
set wildmode=longest:full,full

" Ignore files
set wildignore=*.o,*.obj,*~ 
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/Library/**,*/.rbenv/**
set wildignore+=*/.nx/**,*.app
set wildignore+=*/node_modules/**,*/bower_components/**

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hidden

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
"set whichwrap=b,s,h,l,<,>,[,]

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set matchtime=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=

set timeout 
set timeoutlen=500 " maybe 500 
set ttimeoutlen=100

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

" Add a bit extra margin to the left
"set foldcolumn=1
set foldcolumn=0
set numberwidth=3

" tmux
if !$TMUX | set t_ut= | endif

" ctags 
set tags=./tags;/

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable 

" 256bit terminal
set t_Co=256

set background=dark

try
    "colorscheme molokai
    colorscheme sublimemonokai
catch
    colorscheme desert
endtry

hi Normal ctermbg=none

" using Source Code Pro
" set guifont=Source\ Code\ Pro:h14

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set lines=35
	set columns=90
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
	if has("gui_gtk2")
		"set guifont=Inconsolata\ 12
		set guifont=Source\ Code\ Pro\ 16
	elseif has("gui_macvim")
		set guifont=Menlo\ Regular:h14
	elseif has("gui_win32")
		"set guifont=Consolas:h11:cANSI
		set guifont=Source\ Code\ Pro:h14
	endif
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowritebackup
"set noswapfile

set backupdir=~/.vim/.tmp/backup//
set directory=~/.vim/.tmp/swap//
" set undodir=~/.vim/.tmp/undo//

set swapfile
" set undofile   

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set linebreak
set textwidth=500

" use multiple of shiftwidth when indenting with '<' and '>'
set shiftround

set autoindent
set smartindent

" no wrap lines
set nowrap "No Wrap lines

" Keep visual selecting after indenting a block
vnoremap > >gv
vnoremap < <gv

" listchars
set nolist

" Display unprintable chars
"set listchars=tab:»· 
"set listchars+=nbsp:.
set listchars=eol:¬
set listchars+=trail:· 
set listchars+=tab:▸\ ,extends:❯,precedes:❮,nbsp:␣

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable highlight when <leader><cr> is pressed
nnoremap <silent> <leader><cr> :nohlsearch<cr>

" Smart way to move between windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" Close all the buffers
nnoremap <leader>ba :bufdo bd<cr>

nnoremap <leader>l :bnext<cr>
nnoremap <leader>h :bprevious<cr>

" managing tabs
nnoremap <leader>to :tabonly<cr>
nnoremap <leader>tc :tabclose<cr>
nnoremap <leader>tn :tabnew<Space>

nnoremap <leader>tk :tabnext<CR>
nnoremap <leader>tj :tabprevious<CR>

nnoremap <leader>th :tabfirst<CR>
nnoremap <leader>tl :tablast<CR>

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nnoremap <Leader>tp :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" for editing files in the same directory
nnoremap <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
set switchbuf=useopen,usetab

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Treat long lines as break lines
nnoremap j gj
nnoremap k gk

" disable arrow keys
" nnoremap <up> <nop>
" nnoremap <down> <nop>
" nnoremap <left> <nop>
" nnoremap <right> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>

" Up Down Left Right resize splits
" nnoremap <up> <c-w>+
" nnoremap <down> <c-w>-
" nnoremap <left> <c-w><
" nnoremap <right> <c-w>>

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" Hide INSERT when using lightline.vim
set noshowmode

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
nnoremap 0 ^

" Move a line of text using ALT+[jk]
nnoremap <M-j> mz:m+<cr>`z
nnoremap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Delete trailing white space on save
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

augroup infosec01
    autocmd!
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
augroup end

nnoremap <leader>ws :call CleanExtraSpaces()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Searching vimgrep 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Ctrl-sr: Easier (s)earch and (r)eplace
nnoremap <leader>r :%s/<c-r><c-w>//g<left><left><left>

" n: Next, keep search matches in the middle of the window
nnoremap n nzzzv

" Search mappings: search will center on the line 
map N Nzzv

" fzf search
nnoremap <leader>s :Ag 
nnoremap <leader>/ :BLines<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
nnoremap <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
nnoremap <leader>sn ]s
nnoremap <leader>sp [s
nnoremap <leader>sa zg
nnoremap <leader>s? z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>4 mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" markdown set conceal level
noremap <Leader>m :set conceallevel=2

" disable mode lines (security measure)
set nomodeline

" definition window
set completeopt-=preview
set completeopt+=menu,menuone,noinsert,noselect
set shortmess+=c

" relative numbers in normal mode and the regular line numbers in insert mode.
set relativenumber
augroup infosec02
    autocmd!
    autocmd InsertEnter * :set number norelativenumber
    autocmd InsertLeave * :set number relativenumber
augroup end

" set initial path
cd %:p:h

" stop EX mode
nnoremap Q <nop>

" my templates
nmap <F4> a<C-R>=strftime("%Y-%m-%d")<CR><Esc>
imap <F4> <C-R>=strftime("%Y-%m-%d")<CR>
nmap <F5> ilogin:<CR>url:<CR><Esc>
imap <F5> login:<CR>url:<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction 

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Return TRUE if in the middle of {} or () in INSERT mode
fun BreakLine()
  if (mode() == 'i')
    return ((getline(".")[col(".")-2] == '{' && getline(".")[col(".")-1] == '}') ||
          \(getline(".")[col(".")-2] == '(' && getline(".")[col(".")-1] == ')'))
  else
    return 0
  endif
endfun

" Remap <Enter> to split the line and insert a new line in between if
" BreakLine return True
inoremap <expr> <CR> BreakLine() ? "<CR><ESC>O" : "<CR>"

" integrate ranger file browser
function! RangeChooser()
    let temp = tempname()
    " The option "--choosefiles" was added in ranger 1.5.1. Use the next line
    " with ranger 1.4.2 through 1.5.0 instead.
    "exec 'silent !ranger --choosefile=' . shellescape(temp)
    if has("gui_running")
        exec 'silent !xterm -e ranger --choosefiles=' . shellescape(temp)
    else
        exec 'silent !ranger --choosefiles=' . shellescape(temp)
    endif
    if !filereadable(temp)
        redraw!
        " Nothing to read.
        return
    endif
    let names = readfile(temp)
    if empty(names)
        redraw!
        " Nothing to open.
        return
    endif
    " Edit the first item.
    exec 'edit ' . fnameescape(names[0])
    " Add any remaning items to the arg list/buffer list.
    for name in names[1:]
        exec 'argadd ' . fnameescape(name)
    endfor
    redraw!
endfunction
command! -bar RangerChooser call RangeChooser()

nnoremap <leader>- :<C-U>RangerChooser<CR>

" Auto semi colon 
" If there isn't one, append a semi colon to the end of the current line.
" function s:appendSemiColon()
"     if getline('.') !~ ';$'
"         let original_cursor_position = getpos('.')
"         exec("s/$/;/")
"         call setpos('.', original_cursor_position)
"     endif
" endfunction

" For programming languages using a semi colon at the end of statement.
" augroup infosec03
"     autocmd!
"     autocmd FileType c,cpp,css,java,javascript,perl,php nmap <silent><leader>\ :call <SID>appendSemiColon()<cr>
" augroup end

" inoremap ;; <C-o>A;
" nnoremap <leader>\ :normal A;<CR>

" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
  let l:modeline = printf(" vim: set ft=sh ts=%d sw=%d tw=%d fdm=marker fdl=0 fen :",
        \ &tabstop, &shiftwidth, &textwidth)
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction

nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

" reload in vim dev mode
if !exists('*Makehsd')
    function! Makehsd()
        let $HSDVIM="dev"
        source $MYVIMRC
    endfun
endif

nnoremap <silent> <leader>5 :call Makehsd()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Filetypes and Completions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup OmniCompletionSetup
    autocmd!
    autocmd FileType c          set omnifunc=ccomplete#Complete
    autocmd FileType php        set omnifunc=phpcomplete#CompletePHP
    autocmd FileType python     set omnifunc=jedi#completions
    autocmd FileType ruby       set omnifunc=rubycomplete#Complete	
	" javascript
	" autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS		
	autocmd FileType javascript set omnifunc=tern#CompleteJS
    autocmd FileType html       set omnifunc=htmlcomplete#CompleteTags
    autocmd FileType css        set omnifunc=csscomplete#CompleteCSS
    autocmd FileType xml        set omnifunc=xmlcomplete#CompleteTags
augroup END

augroup allFiles
    autocmd!
" autocmd BufEnter * if &filetype == "conf" | setlocal ft=markdown | endif
" autocmd BufNewFile,BufRead /home/ubuntu/notes/* set wrap ft=markdown
    autocmd BufRead *.txt set tw=80
    autocmd BufRead ~/.mutt/temp/mutt-* set tw=80 ft=mail nocindent spell
    autocmd FileType c,cpp,h set sw=8 ts=8 sts=8 noexpandtab makeprg=make
    autocmd FileType perl set sw=4 ts=4 sts=4 makeprg=perl\ %
    autocmd FileType java set sw=4 ts=4 sts=4 makeprg=javac\ %
    autocmd FileType votl set sw=2 ts=2 sts=2 list
    autocmd FileType votl colorscheme molokai
    autocmd FileType lua set sw=4 ts=4 sts=4 makeprg=lua\ %
    autocmd FileType python setlocal expandtab ts=4 sw=4 sts=4 list makeprg=python\ %
    autocmd FileType ruby set sw=2 ts=2 sts=2 list makeprg=ruby\ %
    autocmd FileType sh set sw=2 ts=2 sts=2 list makeprg=./%

    autocmd FileType html setlocal sw=2 ts=2 sts=2 foldenable foldmethod=indent foldlevel=6 list
    autocmd FileType jade set sw=2 ts=2 sts=2 foldenable foldmethod=indent foldlevel=6 list
    autocmd FileType pug set sw=2 ts=2 sts=2 foldenable foldmethod=indent foldlevel=6 list 
    autocmd FileType stylus set sw=2 ts=2 sts=2 foldenable foldmethod=indent foldlevel=0 list 
    autocmd FileType css set sw=2 ts=2 sts=2 foldenable foldmethod=indent foldlevel=6 nolist
    autocmd FileType javascript set sw=2 ts=2 sts=2 foldenable foldmethod=indent foldlevel=6 list
    autocmd FileType jsx set sw=2 ts=2 sts=2 foldenable foldmethod=indent foldlevel=6 list
    autocmd FileType yaml set sw=2 ts=2 sts=2 list
augroup END

" Miscellaneous file types.
augroup infosec04
    autocmd!
    autocmd BufNewFile,BufRead *.babelrc set filetype=javascript
    autocmd BufNewFile,BufRead *.eslintrc,.reduxrc set filetype=json
    autocmd BufNewFile,BufRead gitconfig set filetype=gitconfig
    autocmd BufNewFile,BufRead *.prettierrc set filetype=yaml
    autocmd BufNewFile,BufRead *.svelte set filetype=html syntax=html
augroup end

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => LeaderMappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <leader>n :b#<CR>
nnoremap <leader>c :close<CR>
nnoremap <leader>o :BufExplorer<CR>
nnoremap <silent> <Leader>x :Bdelete<CR>

"nnoremap <c-p> :Files<CR>
nnoremap <bar> :Buffers<CR>
nnoremap \ :Lines<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>z :cclose<CR>
nnoremap <leader>j mO :Ack! "\b<cword>\b" <CR>

" tpope/vim-projectionist
nnoremap <Leader>pp :Eview 
nnoremap <Leader>aa :A<CR>
nnoremap <Leader>av :AV<CR>

nnoremap <leader>e :edit <c-r>=expand("%:p:h")<cr>/

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Useful
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Yank smart, to be consistent with C and D
" nnoremap Y y$

" use these to escape in insert more
" imap jk <Esc>
" imap kj <Esc>

" C-a to select all
nnoremap <C-a> ggVG
inoremap <C-a> ggVG

" U: Redos since 'u' undos
nnoremap U :redo<cr>

" fast exit
" nmap qq :qa<CR>
"nnoremap <silent> <Leader>q :qa<CR>

" Fix annoying surround.vim message
vmap s S

" Use local vimrc if available {
"if filereadable($HOME.'/.vimrc-local')
"  source $HOME/.vimrc-local
"endif

" nice copy paste functionality
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" my mappings more 
nnoremap <BS> :
nnoremap <leader>6 :

" save with enter
" nnoremap <Enter> :w<CR>
" nnoremap <expr> <cr> &modified ? ":update<cr>" : "<cr>"

" fast whole file alignment
nnoremap <leader>= gg=G``  

" Ctrl+A goes to the front of the command line
cnoremap <C-A>  <Home>
" Ctrl+E goes to the end of the command line
cnoremap <C-E>  <End>

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" highlight last inserted text
nnoremap gv `[v`]
" Jump to the last edited palce
nnoremap ge `.

nnoremap ; q:i
nnoremap : ;
vnoremap ; q:i
vnoremap : ;

nnoremap / q/i
nnoremap ? q?i

nnoremap Q @q
vnoremap Q :norm @q<cr>

if &diff
    nnoremap <leader>1 :diffget LOCAL
    nnoremap <leader>2 :diffget BASE
    nnoremap <leader>3 :diffget REMOTE
endif

nnoremap <silent> <leader>mm :set modeline \| doautocmd BufRead<CR>

" disable folding"
set nofoldenable    

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ModeMappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Insert Mode
"=========================

" Ctrl-e: Go to end of line
inoremap <c-e> <esc>A

" Ctrl-a: Go to begin of line
inoremap <c-a> <esc>I

" Ctrl-f: Move cursor left
inoremap <c-f> <Right>

" Ctrl-c: Inserts line below
inoremap <c-c> <c-o>o

" Ctrl-v: Paste. Advanced
" imap <C-v> <ESC>"+pa
inoremap <c-v> <c-g>u<c-o>gP


" Visual Mode
"=========================
"x = visual only

" Backspace: Delete selected and go into insert mode
xnoremap <bs> c

" Tab: Indent
xmap <Tab> >

" shift-tab: unindent
xmap <s-tab> <

" copy and paste
vmap <C-c> "+y
vmap <C-x> "+x
vmap <C-v> c<ESC>"+p

" Ctrl-r: Easier search and replace
vnoremap <c-r> "hy:%s/<c-r>h//g<left><left><left>

" Ctrl-s: Easier substitue
vnoremap <c-s> :s/\%V//g<left><left><left>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins - normal
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" mileszs/ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" milkypostman/vim-togglelist
let g:toggle_list_no_mappings=1
nnoremap <script> <silent> <leader>7 :call ToggleQuickfixList()<CR>
nnoremap <script> <silent> <leader>8 :call ToggleLocationList()<CR>

" alvan/vim-closetag
let g:closetag_filenames = "*.xml,*.html,*.xhtml,*.phtml,*.php,*.erb,*,js,*.jsx"

let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'javascript.jsx' : 1,
    \ 'jinja' : 1,
    \ 'liquid' : 1,
    \ 'markdown' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \}

let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.erb'
let g:closetag_emptyTags_caseSensitive = 1
  
" Raimondi/delimitMate
au FileType xml,html,phtml,php,xhtml,js,erb,jsx let b:delimitMate_matchpairs = "(:),[:],{:}"

" mileszs/ack.vim
nnoremap <leader>a :Gack 
nnoremap <leader>A :Ack! 

function! Find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! -nargs=1 Gack execute "Ack! <args> " . Find_git_root()
"command! -nargs=* Gack :execute 'Ack! '  . expand('<args>')  '%:p:h'

" plasticboy/vim-markdown
let g:vim_markdown_folding_disabled = 1
" let g:vim_markdown_folding_level = 4
" let g:vim_markdown_conceal = 0

" lambdalisue/vim-foldround
nmap <Leader>ff <Plug>(foldround-forward)
nmap <Leader>fb <Plug>(foldround-backward)

" **********
" * New 2019
" **********
" svermeulen/vim-cutlass
" ********
nnoremap x d
xnoremap x d

nnoremap xx dd
nnoremap X D
vnoremap X ygvD
vnoremap xx ygvD

" ********
" svermeulen/vim-yoink
" ********
nmap <c-n> <plug>(YoinkPostPasteSwapBack)
"nmap <c-p> <plug>(YoinkPostPasteSwapForward)
nmap <expr> <c-p> yoink#isSwapping() ? '<plug>(YoinkPostPasteSwapForward)' : ':FZF'

nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)

nmap <c-=> <plug>(YoinkPostPasteToggleFormat)
nmap y <plug>(YoinkYankPreserveCursorPosition)
xmap y <plug>(YoinkYankPreserveCursorPosition)

let g:yoinkIncludeDeleteOperations = 1
let g:yoinkSyncNumberedRegisters = 1

" ********
" svermeulen/vim-subversive
" ********
" s for substitute
nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
nmap S <plug>(SubversiveSubstituteToEndOfLine)

nmap <leader>cr <plug>(SubversiveSubstituteRangeConfirm)
xmap <leader>cr <plug>(SubversiveSubstituteRangeConfirm)
nmap <leader>crr <plug>(SubversiveSubstituteWordRangeConfirm)

xmap s <plug>(SubversiveSubstitute)
xmap p <plug>(SubversiveSubstitute)
xmap P <plug>(SubversiveSubstitute)

" ********
" kana/vim-textobj-user
" ********
" ie = inner entire buffer
onoremap ie :exec "normal! ggVG"<cr>

" ********
" lfilho/cosco.vim
" ********
autocmd FileType javascript,css,jsx nmap <silent> <Leader>\ <Plug>(cosco-commaOrSemiColon)
autocmd FileType javascript,css,jsx imap <silent> <Leader>\ <c-o><Plug>(cosco-commaOrSemiColon)
let g:cosco_filetype_whitelist = ['css', 'javascript', 'jsx']

" ********
" vimux
" ********
" Prompt for a command to run
nnoremap <leader>vp :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
nnoremap <leader>vl :VimuxRunLastCommand<CR>

" ********
" kana/vim-arpeggio
" ********
call arpeggio#load()
Arpeggio nnoremap zo :update<CR>
Arpeggio nnoremap ,. :qa<CR>
Arpeggio nnoremap cl x
Arpeggio nnoremap cm :Commentary<CR>
Arpeggio inoremap jk <Esc>
Arpeggio inoremap fun function 
Arpeggio inoremap mox module.exports
Arpeggio inoremap con console.log()<Esc>i
Arpeggio inoremap <Space>i if<Space><ESC>:call UltiSnips#ExpandSnippet()<CR>

" ********
" zirrostig/vim-schlepp
" ********
vmap <unique> <up>    <Plug>SchleppUp
vmap <unique> <down>  <Plug>SchleppDown
vmap <unique> <left>  <Plug>SchleppLeft
vmap <unique> <right> <Plug>SchleppRight

"startxyz
if $HSDVIM == 'dev'
  " load DEVELOPMENT vimrc
  source $HOME/.dotfiles/vim-dev-vimrc
endif
"endxyz

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => WORKING
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" html edits - move to after tag > INSERT
nnoremap <leader>f f>li
" html edits - move to inside quotes
nnoremap <leader>v f"l
" js edits - curly brackets open and position
imap <C-c> <CR><Esc>O
" quick exit no save
nnoremap <C-c>`` :qa!<cr>

" alt command mode
nnoremap <C-c> :
nnoremap <c-o> :Files<CR>

