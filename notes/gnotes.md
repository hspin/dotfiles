# vim new plugins notes

## tcomment

    gc{motion} 
    gcc          :: Toggle comment for the current line
    gC{motion}   :: Comment region
In visual mode:
    gc           :: Toggle comments
    gC           :: Comment selected text

    <c-_><c-_>   :: :TComment

    <Leader>__       :: :TComment

## Scratch

gs in normal mode

or

leader-8

## Rainbow

    :RainbowParenthesesToggle

## guides

    The default mapping to toggle the plugin is <Leader>ig>

## expand regions

    Press + to expand the visual selection and _ to shrink it.

## easy align

try these commands:

    vip<Enter>=
        visual-select inner paragraph
        Start EasyAlign command (<Enter>)
        Align around =
    gaip=
        Start EasyAlign command (ga) for inner paragraph
        Align around =

or
    ga2j only two below

## Multiple Cursors 

Out of the box, all you need to know is a single key Ctrl-n in visual mode

## vim togglelist

    <leader>l :call ToggleLocationList()<CR>
    <leader>q :call ToggleQuickfixList()<CR>

## Unite

:Unite outline

## vim sneak
    s{char}{char}
    Press ; to go to the next match
    Press ctrl-o to go back to the starting point
    Press s<Enter> at any time to repeat the last Sneak-search
    Press S to search backwards

