if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
" Tools
Plug 'LukeSmithxyz/vimling'
Plug 'vimwiki/vimwiki'
Plug 'bling/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'godlygeek/tabular'
Plug 'airblade/vim-gitgutter'
Plug 'vim-syntastic/syntastic'
" Languages
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'kovetskiy/sxhkd-vim'
Plug 'hjson/vim-hjson'
Plug 'neovimhaskell/haskell-vim'
Plug 'nbouscal/vim-stylish-haskell'
Plug 'rust-lang/rust.vim'
Plug 'unisonweb/unison', {'branch': 'trunk', 'rtp': 'editor-support/vim'}
Plug 'xavierd/clang_complete'
call plug#end()

" Settings =====================================================================
filetype plugin on
syntax on
set bg=light
set go=a
set mouse=a
set nohlsearch
set clipboard+=unnamedplus
set nocompatible
set encoding=utf-8
set number
set tabstop=4
set shiftwidth=4
set wildmode=longest,list,full
set updatetime=100
set colorcolumn=80
set ignorecase
set smartcase
highlight ColorColumn ctermbg=black
highlight clear SignColumn

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set splitbelow splitright

" Real autoread
set autoread | au CursorHold * checktime | call feedkeys("lh")

" Invisible chars
set list
set listchars=tab:→\ ,extends:»,precedes:«,trail:▒

" Space is leader
let mapleader = " "

" Default bindings =============================================================

" Moving around
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>

" Some nice things
cnoremap <C-d> <Esc>
inoremap <C-d> <Esc>
inoremap <C-s> <Esc>:w<CR>
inoremap <C-y> <Esc><C-r>i
inoremap <C-z> <Esc>ui
nnoremap <C-S-d> :q!<CR>
nnoremap <C-d> :q<CR>
nnoremap <C-e> :Explore<CR>
nnoremap <C-s> :w<CR>
vnoremap <C-s> :sort<CR>

" Tools for tabs
nnoremap <C-End> :tabnew<CR>:edit<Space>
inoremap <C-PageUp> <Esc>:tabprevious<CR>
inoremap <C-PageDown> <Esc>:tabnext<CR>

" Insert a link to current date
noremap <leader>l :$read !date -I<CR>V$ypi(<Esc>$a)<Esc>0i<BS>]<Esc>0i[<Esc>

" Spell-check set to <leader>o, 'o' for 'orthography':
map <leader>o :setlocal spell! spelllang=de_de<CR>
hi clear SpellBad
hi SpellBad cterm=underline

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Replace all is aliased to S.
nnoremap S :%s//g<Left><Left>

" Remove trailing whitespace
noremap <M-Space> :%s/\s\+$//e<CR>''

" Compile document, be it groff/LaTeX/markdown/etc.
map <leader>c :w! \| !compiler <c-r>%<CR>

" Open corresponding .pdf/.html or preview
map <leader>p :!opout <c-r>%<CR><CR>

" Save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Auto-completion of some things
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
inoremap ( ()<Esc>i
inoremap /* /*<space><space>*/<Esc>2hi
inoremap /** /**<space><space>*/<Esc>2hi
inoremap // //<space>
inoremap <> <><Esc>i
inoremap [ []<Esc>i
inoremap {<CR> {<CR><CR>}<Esc>ki<Tab>

" Exit terminal with Escape
tnoremap <Esc> <C-\><C-n>

" Plugin hotkeys ===============================================================

" Tabular
let g:haskell_tabular = 1
vmap a= :Tabularize /=<CR>
vmap a: :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>
vmap a" :Tabularize /"<CR>

" vimling:
nm <leader>d :call ToggleDeadKeys()<CR>
nm <leader>i :call ToggleIPA()<CR>

" Other settings and autocmds ==================================================

" Ensure files are read as what I want:
let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
autocmd BufRead,BufNewFile *.tex set filetype=tex

" Update binds when sxhkdrc is updated.
autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd

" Run xrdb whenever Xdefaults or Xresources are updated.
autocmd BufWritePost *Xresources,*Xdefaults !xrdb %

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Better colors in vimdiff
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

" haskell-vim
let g:haskell_enable_quantification   = 1 " to enable highlighting of `forall`
let g:haskell_enable_recursivedo      = 1 " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax      = 1 " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles        = 1 " to enable highlighting of type roles
let g:haskell_enable_static_pointers  = 1 " to enable highlighting of `static`
let g:haskell_backpack                = 1 " to enable highlighting of backpack keywords

" clang_complete
let g:clang_library_path='/usr/lib/libclang.so'

" Syntastic -> shellcheck -> follow sources
let g:syntastic_sh_shellcheck_args = "-x"

" vimwiki: default wiki uses markdown
let g:vimwiki_list = [{'path': '~/HOST/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_global_ext = 0

" Load other vim files =========================================================

" Load filemaps
source ~/.config/nvim/filemaps.vim
" Load coc
source ~/.config/nvim/coc.vim
