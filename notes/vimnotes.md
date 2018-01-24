# vim notes

## Close all the buffers
    nnoremap <leader>ba :bufdo bd<cr>

## Let 'tl' toggle between this and the last accessed tab
    nnoremap <Leader>tp :exe ##tabn ##.g:lasttab<CR>

## Opens a new tab with the current buffer's path
## for editing files in the same directory
    nnoremap <leader>te :tabedit <c-r>=expand(##%:p:h##)<cr>/

## Switch CWD to the directory of the open buffer
    nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>

## Tab: Go to matching element
    nnoremap <leader><tab> %

## Delete trailing white space on save
    nnoremap <leader>ws :call CleanExtraSpaces()<CR>

## Ctrl-sr: Easier (s)earch and (r)eplace
    nnoremap <leader>r :%s/<c-r><c-w>//g<left><left><left>

## => Spell checking
## Pressing ,ss will toggle and untoggle spell checking
    nnoremap <leader>ss :setlocal spell!<cr>

## Shortcuts using <leader>
    nnoremap <leader>sn ]s
    nnoremap <leader>sp [s
    nnoremap <leader>sa zg
    nnoremap <leader>s? z=

## Remove the Windows ^M - when the encodings gets messed up
    noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

## Toggle paste mode on and off
    nnoremap <leader>pp :setlocal paste!<cr>

    nnoremap <leader>- :<C-U>RangerChooser<CR>

## fast whole file alignment
    nnoremap <leader>= gg=G``

## Ctrl-r: Easier search and replace
    vnoremap <c-r> ##hy:%s/<c-r>h//g<left><left><left>

## Ctrl-s: Easier substitue
    vnoremap <c-s> :s/\%V//g<left><left><left>

## global search
    nnoremap <leader>a :Gack
    nnoremap <leader>A :Ack!

## site-wide search and replace
    :Ag foo
    :cdo %s/bar/baz/g | update 
    :cddo :bd

## mattn/emmet-vim
    <Tab>,

## xolox/vim-session
    :SaveSession command
    :OpenSession command
    :CloseSession command
    :DeleteSession command
    :ViewSession

## tommcdo/vim-lion
    glip=

## misc
    nnoremap <leader>i :IndentLinesToggle<CR>
    nnoremap <leader>2 :RainbowParenthesesToggle<CR>
    nnoremap <leader>1 :TagbarToggle<CR>

    nnoremap <script> <silent> <leader>7 :call ToggleQuickfixList()<CR>
    nnoremap <script> <silent> <leader>8 :call ToggleLocationList()<CR>

    nmap <silent><leader>\ :call <SID>appendSemiColon()<cr>

## Visual mode pressing * or # searches for the current selection

## tcomment

    gc{motion}
    gcc          :: Toggle comment for the current line
    gC{motion}   :: Comment region
In visual mode:
    gc           :: Toggle comments
    gC           :: Comment selected text

    <c-_><c-_>   :: :TComment

## expand regions

    Press + to expand the visual selection and _ to shrink it.

