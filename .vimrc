"----------- vim-plug -----------"
call plug#begin('~/.vim/plugged')
" Initialize plugin system

Plug 'lervag/vimtex'
    let g:vimtex_view_method='skim'

Plug 'ayu-theme/ayu-vim'

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}

call plug#end()
"----------- vim-plug -----------"

syntax enable
" enter current millenium
set nocompatible


set number
" beautiful numbering of the lines at the left
set relativenumber

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
" to show command during typing in the right bottom corner
set showcmd

" right line chars boundary
set colorcolumn=80

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

set termguicolors     " enable true colors support
let ayucolor="light"  " for light version of theme
let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme
" colo ayu
colo default

" tell vim to keep a backup file
set backup
set swapfile

" tell vim where to put its backup files
set backupdir=/private/tmp

if has("vms")
  set nobackup          " do not keep a backup file, use versions instead
else
  set backup            " keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile        " keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

filetype plugin indent on

