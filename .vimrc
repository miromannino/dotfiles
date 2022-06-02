" These are to cancel the default behavior of d, D, c, C
" to put the text they delete in the default register.
" Note that this means e.g. "ad won't copy the text into
" register a anymore.  You have to explicitly yank it.
nnoremap p "+p
nnoremap P "+P
vnoremap p "+p
vnoremap P "+P
vnoremap x "+x
nnoremap x "+x
vnoremap y "+y
nnoremap y "+y

:set number
