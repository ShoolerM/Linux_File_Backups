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


""""""""""PRETTIFICATION""""""""""""""""
set ruler
set cursorline
set number
set noerrorbells
set mouse=a
set title
set background=dark
set encoding=utf-8
set  linebreak
syntax enable
set wrap

" # autocomments python files on visually selected lines
xnoremap # :norm 0i<C-r>='#'<CR><CR>
xnoremap $ :norm ^<C-r>=len('#')<CR>x<CR>

"c-style block commenter, in normal mode type \c on a visually
"selected block to encase in a formated c-style block comment rectangle
if has('python3')
    xnorempa <silent> <Leader>c :'<,'>!python3 ~/.vim/scripts/cpp_comment_formatter.py<CR>
endif

"Code folding with space
map <Space> za
"Shift-f opens selected fold recursively
nnoremap <S-f> zA
"Ctrl-c opens all folds
nnoremap <C-c> zR
"Shift-c closes all folds
nnoremap <S-c> zM


"Fix some syntax highlighting issues
nnoremap U :syntax sync fromstart<CR>:redraw!<CR>



"""""""""""""""MOVEMENT""""""""""""""""""""""""""""""
"Fixing tmux issues in regards to ctrl->arrow inputs
if &term =~ '^screen'
	"tmux will send xterm-style keys when its xterm-keys option is on
	execute "set <xUp>=\e[;:*A"
	execute "set <xDown>=\e[1;*B"
	execute "set <xRight>=\e[1;*C"
	execute "set <xLeft>=\e[1;*D"
endif


"Don't immediately jump when searching
nnoremap # :keepjumps normal! mi*`i<CR>

"Better Movement
nnoremap <silent> <C-Left> 	^
nnoremap <silent> <C-Right> $
nnoremap <silent> <C-Up> 	H
nnoremap <silent> <C-Down> 	L

nnoremap <silent> <S-Left> 	B
nnoremap <silent> <S-Right> W
nnoremap <silent> <S-Up> 	{
nnoremap <silent> <S-Down> 	}


""""""""""""""""""""FILE MANAGEMENT""""""""""""""""""""
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


"MISC
autocmd FileType make setlocal noexpandtab



""""""""""""""""""""EXTERNAL IDE FEATURES"""""""""""""""""""""""""""

"CTAGS integration
set tags=~/.tags;/
"Update ctags
autocmd BufWritePost , *.c, *.cpp, *.h silent! !ctags . &


"Clang format on visually selected lines with C-k
if has('python')
    map <C-K> :pyf /usr/share/clang/clang-format-10/clang-format.py<cr>
    imap <C-K> <c-o>:pyf /usr/share/clang/clang-format-10/clang-format.py<cr>
elseif has('python3')
    map <C-K> :py3f /usr/share/clang/clang-format-10/clang-format.py<cr>
    imap <C-K> <c-o>:py3f /usr/share/clang/clang-format-10/clang-format.py<cr>
endif




"""""""""""""""""""""""""""""""ETC""""""""""""""""""""""""""""""


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
