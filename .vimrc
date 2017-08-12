set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
" Command auto complete
Bundle 'Valloric/YouCompleteMe'
" Syntastic checking and hightling
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
" Color schemes
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
" File Browsing
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
" Super searching
Plugin 'kien/ctrlp.vim'
" Git Integration
Plugin 'tpope/vim-fugitive'
" Powerline status bar
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" Ansible support
Bundle 'chase/vim-ansible-yaml'
" HTML/CSS fast develop with emmet
Plugin 'mattn/emmet-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

" docstring show in fold
let g:SimpylFold_docstring_preview=1

" PEP8, HTML
au BufNewFile,BufRead *.py,*.html set tabstop=4 
au BufNewFile,BufRead *.py,*.html set softtabstop=4
au BufNewFile,BufRead *.py,*.html set shiftwidth=4
au BufNewFile,BufRead *.py set textwidth=79
au BufNewFile,BufRead *.py,*.html set expandtab
au BufNewFile,BufRead *.py,*.html set autoindent
au BufNewFile,BufRead *.py set fileformat=unix
" Flagging Unnecessary Whitespace, This will mark extra whitespace as bad, and
" probably color it red.
highlight BadWhitespace ctermbg=red guibg=red
" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" UTF-8 support
set encoding=utf-8
set termencoding=utf-8

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_python_binary_path = 'python'
let g:ycm_semantic_triggers = {
    \   'css': [ 're!^\s{4}', 're!:\s+'],
    \   'html': [ '</' ],
    \ }
"python with virtualenv support
"py << EOF
"import os.path
"import sys
"import vim
"if 'VIRTUA_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  sys.path.insert(0, project_base_dir)
"  activate_this = os.path.join(project_base_dir,'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
"EOF

" Syntax Checking/Highlighting
let python_highlight_all=1
syntax on

" Choose color scheme
if has('gui_running')
	set background=dark
	colorscheme solarized
else
	colorscheme zenburn
endif
call togglebg#map("<F5>")
" Start NERDTree when vim start
autocmd vimenter * NERDTree
" Ctrl+n to start NERDTree in vim
map <C-n> :NERDTreeToggle<CR>
" change NERDTree arrows
let g:NERDTreeDirArrowExpandable = '.'
let g:NERDTreeDirArrowCollapsible = '.'
" setting on emmet
let g:user_emmet_settings = {'indentation' : '    '}
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

set nu
set clipboard=unnamed
