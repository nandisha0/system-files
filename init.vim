"----------- vim-plug -----------"
call plug#begin('~/vim/plugged')
" Initialize plugin system

Plug 'lervag/vimtex'
    let g:vimtex_view_method='skim'
    let g:vimtex_view_skim_activate=1
    let g:vimtex_view_skim_reading_bar=1

Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'

Plug 'pangloss/vim-javascript'
Plug 'evanleck/vim-svelte'

call plug#end()
"----------- vim-plug -----------"

" fugitive plug: make Gdiff split vertical
set diffopt+=vertical

nmap <leader>gs :G<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gj :diffget //3<CR>

" set t_Co=256
set cursorline


" colorscheme
colorscheme gruvbox
set background=dark


let g:airline_theme='onedark'


augroup vimtex_common
    autocmd!
    autocmd FileType tex call writefile(
        \ [v:servername],
        \ (has('win32') ? $TEMP : "/tmp") . "/curnvimserver.txt")
augroup END

" Spaces & Tabs {{{
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set expandtab       " tabs are space
set autoindent
set copyindent      " copy indent from the previous line
" }}} Spaces & Tabs
"
" to show commnd during typing in the right bottom corner
set showcmd
" right line chars boundary
set colorcolumn=100
" add numbers on left
set number
" beautiful numbering of the lines at the left
set relativenumber


" tell vim to keep a backup file
set backup
set swapfile

" tell vim where to put its backup files
set backupdir=/private/tmp/nvim

if has("vms")
  set nobackup          " do not keep a backup file, use versions instead
else
  set backup            " keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile        " keep an undo file (undo changes after closing)
  endif
endif


" ----- allow mouse to resize splits and other stuff -------
set mouse=a             " a == all


" By pressing ctrl+r in visual mode, you will be prompted to enter text to replace with. Press enter and then confirm each change you agree with y or decline with n.
" This command will override your register h so you can choose other one (by changing h in the command above to another lower case letter) that you don't use.
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y



:command W w
:command Q q

" TAG JUMPING
" Create the 'tag' file
command! MakeTags !ctags -R .
" use ^] to jump to tag under coursore
" g^] for amiguous tags
" ^t to jump back up the tag stack


" to display \r simpol in DOS-formated files
set fileformats=unix

" to display hidden characters
set list
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
