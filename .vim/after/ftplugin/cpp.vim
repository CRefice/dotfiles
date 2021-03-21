" Since vim's default c ftplugin sets omnifunc to ctag-based completion,
" restore it to ALE completion
let b:ale_linters = ['cc', 'clangd', 'clangtidy']

set omnifunc=ale#completion#OmniFunc
