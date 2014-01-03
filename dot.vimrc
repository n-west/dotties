" Nathan West
" .vimrc
" ideally this grows to something useful over time

" spacing
set tabstop=4
set expandtab
set shiftwidth=4
set smarttab
set scrolloff=5
"
" these are ok for tex stuff, but not useful for code
"set tw=80
"set wrap


" help with commands
set showmode

" coloring
syntax enable
" set hlsearch
" set cursorline

autocmd FileType make setlocal noexpandtab
