set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" My custom markdown plugin
Plugin 'hawkins/Touchdown.vim'
Plugin 'hawkins/vim-markdown'

"
" C/C++
"
Plugin 'c.vim'
"Plugin 'rip-rip/clang_complete'
Plugin 'rhysd/vim-clang-format'
" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>
autocmd FileType c ClangFormatAutoEnable

" NERDTree is a file tree side bar
Plugin 'scrooloose/nerdtree'
" Open NERDTree when no files are specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" ... or a directory is opened
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" Toggle tree with \ \
map <leader><leader> :NERDTreeToggle<CR>
" Show hidden / dot files by default
let NERDTreeShowHidden=1

"Lost the old one... oops
filetype plugin indent on
" show existing tab with 2 spaces width
set tabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" On pressing tab, insert 2 spaces
set expandtab
" Open folds expanded by default
set foldlevelstart=999


"
" Git
"
Plugin 'airblade/vim-gitgutter'

if &diff
  set cursorline
  map ] ]c
  map [ [c
endif


"
" JavaScript
"

" Associate *.js with JSX
autocmd BufNewFile,BufRead *.js set filetype=javascript.jsx

"JavaScript syntax & indentation
Plugin 'pangloss/vim-javascript'
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1

" Syntax highlighting
syntax on

" vim-jsx
Plugin 'mxw/vim-jsx'
let g:jsx_ext_required = 0

" Line numbers
set number

" Prettier
Plugin 'prettier/vim-prettier'
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue Prettier


"
" Ruby / Rails
"
Plugin 'tpope/vim-rails'
Plugin 'KurtPreston/vim-autoformat-rails'
"autocmd BufWritePre *.rb, *.html.erb execute('call <SID>AutoFormatRails()')

" 
" Rust
"

Plugin 'rust-lang/rust.vim'

" Associate *.rs files with rust
autocmd BufNewFile,BufRead *.rs set syntax=rust

" Use RustFMT to auto format code
let g:rustfmt_autosave = 1
let g:rustfmt_command = "rustfmt"


"
" Go
"
Plugin 'fatih/vim-go'

" vim-go requires Vim 7.4.1689 or Neovim, but you're using an older version.
" Please update your Vim for the best vim-go experience.
" If you really want to continue you can set this to make the error go away:
let g:go_version_warning = 0
" Note that some features may error out or behave incorrectly.


"
" Vundle
"

call vundle#end()
filetype plugin indent on


" Language specific whitespace settings
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype json setlocal ts=2 sts=2 sw=2
autocmd Filetype rust setlocal ts=4 sts=4 sw=4

