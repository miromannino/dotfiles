" These are to cancel the default behavior of d, D, c, C
" to put the text they delete in the default register.
" Note that this means e.g. "ad won't copy the text into
" register a anymore.  You have to explicitly yank it.
nnoremap p "0p
nnoremap P "0P
vnoremap p "0p
vnoremap P "0P
vnoremap x "0x
nnoremap x "0x