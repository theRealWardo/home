set nocompatible
set nobackup          " do not keep a backup file, use versions instead
set backspace=indent,eol,start
set history=50
set ruler
set showcmd
set incsearch
set hlsearch
set cindent
set expandtab
set shiftwidth=2
set number
" filepath [modified][buffer][filetype,ro] line,col-virtualcol,byteoffset
set ls=2
set statusline=%<%f%=\ %3.3m[%n][%Y%R]\ %{fugitive#statusline()}\ \ %-35(%3l,%c%V\ \ %P\ (%L)%)%10(%b\ 0x%B\ %)
"syntax enable
"set background=dark
"colorscheme solarized
"set mouse=a ttymouse=xterm2

map Q gq
if &t_Co > 2 || has("gui_running")
  syntax on
endif
if has("autocmd")
  filetype plugin indent on
  augroup vimrcEx
  au!
  autocmd FileType text setlocal textwidth=78
  autocmd FileType actionscript setlocal textwidth=78
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
   \   exe "normal g`\"" |
  \ endif
  augroup END
else
  set autoindent
endif " has("autocmd")
if filereadable("/home/build/public/eng/vim/google.vim")
  source /home/build/public/eng/vim/google.vim
  let g:g4_autoedit_noprompt = 1
  Glug g4
endif
set encoding=utf-8
let tlist_actionscript_settings='actionscript;f:function'
" copied from Ran.  His Kung Fu is Strong.
set expandtab
"match ErrorMsg '\%>80v.\+'

" Some tab key binding thingys
inoremap <C-t> <Esc>:tabnew<CR>
noremap <C-t> :tabnew<CR>
inoremap <C-g> <Esc>:tabclose<CR>
noremap <C-g> :tabclose<CR>
inoremap <C-j> <Esc>:tabprevious<CR>
noremap <C-j> :tabprevious<CR>
inoremap <C-k> <Esc>:tabnext<CR>
noremap <C-k> :tabnext<CR>
inoremap <C-y> <C-w>
noremap <C-y> <C-w>

" Plugin key bindings
inoremap <F12> <Esc>:NERDTreeToggle<CR>
noremap <F12> :NERDTreeToggle<CR>

au FileChangedRO * nested :call <SID>CheckOutFile()
au BufRead,BufNewFile *.hbs set ft=html syntax=handlebars

" Damn it text width autowrapping crap.
set textwidth=10000000

colorscheme torte
