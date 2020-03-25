"Indentation
set expandtab
set shiftround
set shiftwidth=4
set smarttab
set autoindent
set smartindent
set tabstop=4

"Search
set hlsearch
set ignorecase
set smartcase

"Test
set encoding=utf-8
set  linebreak
syntax enable
set wrap

"UI
set ruler
set cursorline
set number
set noerrorbells
set mouse=a
set title
set background=dark

"Fixing tmux issues in regards to ctrl->arrow inputs
if &term =~ '^screen'
	"tmux will send xterm-style keys when its xterm-keys option is on
	execute "set <xUp>=\e[;:*A"
	execute "set <xDown>=\e[1;*B"
	execute "set <xRight>=\e[1;*C"
	execute "set <xLeft>=\e[1;*D"
endif

"Better Movement
nnoremap <silent> <C-Left> 	^
nnoremap <silent> <C-Right> $
nnoremap <silent> <C-Up> 	H
nnoremap <silent> <C-Down> 	L

nnoremap <silent> <S-Left> 	B
nnoremap <silent> <S-Right> W
nnoremap <silent> <S-Up> 	{
nnoremap <silent> <S-Down> 	}

"Using buffers like tabs
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ":t"
let g:airline_theme = 'deus'

set hidden
nnoremap <C-a> 		:e 
nnoremap <C-j> 		:bprev<CR>
nnoremap <C-k> 		:bnext<CR>
nnoremap <C-x> 		:bp <BAR> bd #<CR>
nnoremap <C-s> 		:ls<CR>


"System Clipboard Shortcuts
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+y

"Folding
set foldmethod=indent
"fold with space
map <Space> za
nnoremap <S-f> zA

"MISC
autocmd FileType make setlocal noexpandtab

"CTAGS
set tags=tags;/

"autocomment python files
xnoremap # :norm 0i<C-r>='#'<CR><CR>
xnoremap $ :norm ^<C-r>=len('#')<CR>x<CR>

"Fix some syntax highlighting issues
nnoremap U :syntax sync fromstart<CR>:redraw!<CR>

"Backups
set backup
set backupdir=~/.vimbaks,/tmp,.
set backupskip=/tmp/*
set directory=~/.vimbaks,/tmp,.
set writebackup


"Supertab settings
let g:SuperTabDefaultCompletionType = "context"
setglobal complete+=d

"Set up pathogen and SuperTab when time permits
"execute pathogen#infect()
call pathogen#infect()
call pathogen#helptags()
