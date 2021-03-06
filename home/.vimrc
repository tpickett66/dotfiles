" pull in pathogen and generate helptags
call pathogen#infect()
call pathogen#helptags()

set nocompatible
" allow unsaved background buffers and remember marks/undo for them
set hidden

" set our leader key
let mapleader=","

" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=

" turn on syntax highlighting
syntax on

" ensure backspace isn't fucked
set backspace=2

" turn on auto indent
set expandtab
set softtabstop=2
set shiftwidth=2
filetype plugin indent on

" set up the coloring for TrailingWhitespace highlighting
autocmd ColorScheme * highlight TrailingWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match TrailingWhitespace /\s\+$\| \+\ze\t/

" set our colorscheme to solarized since it was pulled in
" by pathogen
set background=dark
colorscheme solarized

" let us know where we are
set number
set ruler
set cursorline

" set our window sizes
set winwidth=84
" vim whines if winheight is less than winminheight but if we set it 
" to a large value before winminheight it will clobber the other splits
" so hacky hacky hacky, also thanks Gary Bernhardt
set winheight=5
set winminheight=5
set winheight=99

" set search options
set ignorecase " default to case insensitive search unless we mix case
set smartcase " this has to be set along with above for case insensitive search
set incsearch " jump to our search results as we type search
""set hlsearch  " highlight our search results

" don't polute our working dir w/ backups and swap files
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp//

" mark column 80
let &colorcolumn=join(range(80, 80), ",")

" set some custom key mappings
" open nerdtree on Ctrl-n
map <C-n> :NERDTree<CR> 

" let's try selecta for fuzzy search

" Run a given vim command on the results of fuzzy selecting from a given
" shell command. See usage below.
function! SelectaCommand(choice_command, selecta_args, vim_command)
  try
    silent let selection = system(a:choice_command . " | selecta " . a:selecta_args)
  catch /Vim:Interrupt/
    " Swallow the ^C so that the redraw below happens; otherwise there will be
    " leftovers from selecta on the screen
    redraw!
    return
  endtry
  redraw!
  exec a:vim_command . " " . selection
endfunction

" Find all files in all non-dot directories starting in the working directory.
" Fuzzy select one of those. Open the selected file with :e.
nnoremap <leader>f :call SelectaCommand("find * -type f -not -path \"tmp*\" -not -path \"*node_modules*\"", "", ":e")<cr>
nnoremap <leader>sf :call SelectaCommand("find * -type f -not -path \"tmp*\" -not -path \"*node_modules*\"", "", ":sp")<cr>
nnoremap <leader>vf :call SelectaCommand("find * -type f -not -path \"tmp*\" -not -path \"*node_modules*\"", "", ":vs")<cr>

function! BeautifyXMLFile()
  exec a:firstline.",".a:lastline.'s/></>\r</g'
  exec "normal gg"
  exec "normal =G"
endfunction

" Bind leader F to ack
nnoremap <leader>F :Ack<space>

" set split options
set splitright
set splitbelow

" bind some handy key combos for split nav
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" set filetype specific indention settings
au Filetype css setl sw=2 sts=2 et
au Filetype cpp setl sw=4 sts=4 et
au Filetype gitconfig setl sw=4 ts=4 sts=4 noexpandtab
au Filetype go setl sw=4 ts=4 sts=4 noet
au Filetype groovy setl sw=2 sts=2 et
au FileType javascript setl sw=2 sts=2 et
au FileType markdown setl sw=4 sts=4 et
au FileType python setl sw=4 sts=4 et ts=8
au Filetype qml setl sw=4 sts=4 et
au FileType ruby setl sw=2 sts=2 et
au Filetype scss setl sw=2 sts=2 et
au Filetype sh setl sw=4 sts=4 et

" custom filetype mappings
au BufNewFile,BufRead *.prawn set filetype=ruby

" enable modelines
set ml
set mls=2

" always show the current file path
set ls=2

" set spell check language
set spelllang=en_us

" turn on spell check for certain file types
au Filetype markdown setlocal spell
au Filetype gitcommit setlocal spell
au Filetype cucumber setlocal spell

"--- Copy to system register
map <leader>c "*y

"--- Paste from system register
map <leader>v "*p

" Fuck whitespace
autocmd FileType c,cpp,groovy,java,php,ruby,eruby,haml,sass,scss,python,html,css,javascript,cucumber,slim,coffee,yaml,sh,scala,rust,xml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))"

" Allow us to insert tabs even when expandtab is on
:inoremap <S-Tab> <C-V><Tab>

" Allow project specific vimrc files
set exrc
set secure
