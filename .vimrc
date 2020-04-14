set nocompatible
filetype off

set exrc
set secure
set encoding=utf-8

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle
call vundle#begin()

let mapleader=","

set visualbell

"Look & Feel
set t_Co=256
set cursorline
let g:load_doxygen_syntax=1
set showcmd
set nu sm hlsearch
set incsearch
set mouse=a
let g:vim_json_syntax_conceal = 0
colors molokai

"Coding
set autoindent
set smartindent
set tabstop=2 shiftwidth=2 expandtab
"set tags=tags;/
set completeopt=longest,menu,preview
set hidden
set list
set list lcs=tab:\|\ 
set list eol
set backspace=start,eol,indent

" Let clangd fully control code completion
let g:ycm_clangd_uses_ycmd_caching = 0
" " Use installed clangd, not YCM-bundled clangd which doesn't get updates.
let g:ycm_clangd_binary_path = exepath("clangd")

set autoread

"Statusline
"set statusline=%<%f\ %m%r%=0x%B\ \ %l,%c%V\ %P
set laststatus=2

"Completion
let g:ycm_autoclose_preview_window_after_insertion = 1

" Disable Ex mode
nnoremap Q <Nop>

"File system browser
nnoremap ~ :NERDTreeToggle<CR>
nmap <leader>t :TagbarToggle<CR>
nmap <leader>r :NERDTreeFind<cr>

" close current buffer
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

" tab navigation
nnoremap <leader>m :bp<CR>
nnoremap <leader>n :bn<CR>

" go to defenition
nmap gd :YcmCompleter GoTo<CR>
nmap yd :YcmCompleter GoTo<CR>
nmap gt :YcmCompleter GetType<CR>
nmap gp :YcmCompleter GetParent<CR>

let g:ctrlp_cmd = 'CtrlPMixed'
let g:syntastic_go_checkers=['go','golint','govet']
let g:syntastic_aggregate_errors=1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1

let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
"
" " Show just the filename
"let g:airline#extensions#tabline#fnamemod = ':t'

let g:tmuxline_powerline_separators = 1
let g:tmuxline_preset = 'full'

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
nnoremap \ :Ag<SPACE>

let g:ctrlp_extensions = ['funky','switcher']
:nnoremap <leader>s :CtrlPSwitchBasic<CR>

noremap <leader>f :YcmCompleter Format<CR>

" doxygen comment
let g:DoxygenToolkit_commentType = "C++"
noremap <leader>d :Dox<CR>

" ctags
let g:vim_tags_auto_generate = 1

Plugin 'gmarik/vundle'
Plugin 'fatih/vim-go'
" Plugin 'codota/tabnine-vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
"Plugin 'majutsushi/tagbar'
"Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'edkolev/tmuxline.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'rking/ag.vim'
" Plugin 'rhysd/vim-clang-format'
"Plugin 'elzr/vim-json'
Plugin 'kien/ctrlp.vim'
"Plugin 'vim-scripts/DeleteTrailingWhitespace'
"Plugin 'szw/vim-tags'
"Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'devcrafter/vim-ctrlp-switcher'
"Plugin 'vim-scripts/DoxygenToolkit.vim'
"Plugin 'vim-scripts/DrawIt'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-commentary'
" All of your Plugins must be added before the following line
call vundle#end()            " required

" comments style for cpp
autocmd FileType cpp,cs,java setlocal commentstring=//\ %s
autocmd FileType sql setlocal commentstring=--\ %s
autocmd FileType cmake setlocal commentstring=#\ %s

filetype plugin indent on
syntax on
