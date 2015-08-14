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


