" Nathan West
" .vimrc
" ideally this grows to something useful over time

execute pathogen#infect()

" spacing
set tabstop=4
set expandtab
set shiftwidth=4
set smarttab
set scrolloff=5
set tags=/home/nathan/ctags
"
" these are ok for tex stuff, but not useful for code
"set tw=80
"set wrap

" help with commands
set showmode

" coloring
syntax enable

" base16 colors
let base16colorspace=256
let g:base16_shell_path="/home/nathan/.config/base16-shell"
colorscheme base16-railscasts

" filetype specific settings
filetype plugin indent on
autocmd FileType make setlocal noexpandtab
autocmd FileType tex setlocal textwidth=80

" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" NERDTress File highlighting
" courtesty of:
" https://github.com/scrooloose/nerdtree/issues/433#issuecomment-92590696
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 " the .'f'. is a nw addition to make this work with single letter extentions
 exec 'autocmd FileType nerdtree highlight ' . a:extension . 'f' .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd FileType nerdtree syn match ' . a:extension . 'f' .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('txt',  'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('yml',  'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('xml',  'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md',   'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('in',   'lightyellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('cpp',  'green', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('cc',   'green', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('hpp',  'darkcyan', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('c',    'green', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('h',    'darkcyan', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('py',   'green', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('cmake','lightmagenta', 'none', 'yellow', '#151515')
autocmd FileType nerdtree highlight cmakefile ctermfg=lightmagenta ctermbg=none
autocmd FileType nerdtree syn match cmakefile #^\s\+CMake.*.txt$#

set cursorline
augroup project
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END

" for gnuradio:
autocmd BufWritePre * :%s/\s\+$//e
