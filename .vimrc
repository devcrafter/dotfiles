set nocompatible
filetype off

set exrc
set secure
set encoding=utf-8
" set clipboard=unnamedplus

let mapleader=" "

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
set cmdheight=2
" move window border with mouse
if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end

"Coding
set autoindent
set smartindent
set tabstop=4 shiftwidth=4 expandtab
set completeopt=longest,menu,preview
set hidden
set list
set list lcs=tab:\|\ 
set list eol
set backspace=start,eol,indent
set autoread

"Statusline
set laststatus=2

" Disable Ex mode
nnoremap Q <Nop>

"File system browser
nnoremap ` :NERDTreeToggle<CR>
nmap <leader>r :NERDTreeFind<cr>

" close current buffer
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

" tab navigation
nnoremap <leader>m :bp<CR>
nnoremap <leader>n :bn<CR>

" Coc plugin(LSP)
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gf <Plug>(coc-fix-current)
" find symbol of current document.
nmap <silent> go :<C-u>CocList outline<cr>
nmap <silent> gh :CocCommand clangd.switchSourceHeader<cr>
" symbol renaming
nmap <leader>rn <Plug>(coc-rename)
" Use <Tab> and <S-Tab> to navigate the completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" tagbar
nmap <leader>t :TagbarToggle<CR>

" airline
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

let g:tmuxline_powerline_separators = 1
let g:tmuxline_preset = 'full'

" CtrlP - fuzzy search
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_extensions = ['funky','switcher']
:nnoremap <leader>s :CtrlPSwitchBasic<CR>
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

" Clang format
let g:clang_format#style_options = {
            \ "ColumnLimit" : 160,
            \ "Standard" : "C++17"}
autocmd FileType cpp noremap <leader>f :ClangFormat<CR>

" doxygen comment
let g:DoxygenToolkit_commentType = "C++"
noremap <leader>d :Dox<CR>

" ctags
let g:vim_tags_auto_generate = 1

"fzf
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fl :BLines<CR>
nnoremap <leader>fm :Marks<CR>
nnoremap <leader>fw :Windows<CR>

call plug#begin('~/.vim/plugged')
"Plug 'codota/tabnine-vim'
"Plug 'edkolev/tmuxline.vim'
"Plug 'fatih/vim-go'
"Plug 'vim-scripts/DoxygenToolkit.vim'
"Plug 'vim-scripts/DrawIt'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'majutsushi/tagbar'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rhysd/vim-clang-format'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
" All of your Plugins must be added before the following line
call plug#end()

" comments style
autocmd FileType cpp,cs,java setlocal commentstring=//\ %s
autocmd FileType sql setlocal commentstring=--\ %s
autocmd FileType cmake setlocal commentstring=#\ %s

filetype plugin on
filetype plugin indent on
syntax on
