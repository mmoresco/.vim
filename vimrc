execute pathogen#infect()

" Visual options
set guioptions=egmt         " Remove toolbar, scrollbars
syntax on                   " Enables syntax highlighting
set nu                      " Enable Line Numbers
set nowrap                  " Disable word wrap
set vb                      " Visual bell instead of beeps
set ruler                   " Displays cursor position on bottom right of screen
set laststatus=2            " Always show the status line"
set cursorline 		    " Show current line
set fillchars=vert:\│
hi VertSplit ctermfg=green
hi Search cterm=NONE ctermfg=black ctermbg=Yellow
set hlsearch

" Colors
set background=dark
let g:hybrid_custom_term_colors = 1
colorscheme hybrid

" Move chunks of lines around
let g:move_key_modifier = 'C'

"Changes Leader key into a comma instead of a backslash
let mapleader=","

set encoding=utf-8

filetype plugin indent on

" Stops arrow keys from acting weird on some systems
set nocompatible

" Enable mouse
set mouse=a

" Highlights matching brackets in programming languages
set showmatch

" Make backspace behave normally
set backspace=2

" Indentation
set autoindent 		" Indent new lines if you're indented
set smartindent 	" Indent lines after open bracket in programming language
" C indentation style
autocmd FileType c,cpp,make,automake,conf setlocal cinoptions=+4,(4:0 cindent noexpandtab shiftwidth=8 tabstop=8 softtabstop=8

" Assists code formatting
set shiftwidth=4

" Make the navigation keys work like standard editors
imap <silent> <Down> <C-o>gj
imap <silent> <Up> <C-o>gk
nmap <silent> <Down> gj
nmap <silent> <Up> gk

"------  NERDTree Options  ------
let NERDTreeIgnore=['CVS','\.dSYM$']
let NERDTreeChDirMode=2     "setting root dir in NT also sets VIM's cd
noremap <silent> <Leader>n :NERDTreeToggle<CR>
" These prevent accidentally loading files while in the NERDTree panel
autocmd FileType nerdtree noremap <buffer> <c-left> <nop>
autocmd FileType nerdtree noremap <buffer> <c-h> <nop>
autocmd FileType nerdtree noremap <buffer> <c-right> <nop>
autocmd FileType nerdtree noremap <buffer> <c-l> <nop>

"------  Fugitive  ------
"https://github.com/tpope/vim-fugitive
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gr :Gremove<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gm :Gmove
nnoremap <Leader>gp :Ggrep
nnoremap <Leader>gR :Gread<CR>
nnoremap <Leader>gg :Git
nnoremap <Leader>gd :Gdiff<CR>

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0
set noshowmode
let g:airline_theme='hybridline'

" Custom file types
au BufRead,BufNewFile *.tmpl set syntax=jinja
au BufRead,BufNewFile *.conf set syntax=json

set tags=~/.vimtags;/

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" This allows buffers to be hidden if you've modified a buffer.
 set hidden

 " To open a new empty buffer
 nmap <leader>T :enew<cr>

 " Move to the next buffer
 nmap <leader>l :bnext<CR>

 " Move to the previous buffer
 nmap <leader>k :bprevious<CR>

 " Close the current buffer and move to the previous one
 nmap <leader>bq :bp <BAR> bd #<CR>

 " Show all open buffers and their status
 nmap <leader>bl :ls<CR>

 nmap <leader>t :TagbarToggle<CR>

 " ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:20'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.log,*.db,*.pdf
set wildignore+=*.cmo,*.cmi                 " ocaml"
set wildignore+=*.pyc                       " Python
set wildignore+=*.min.js,*/jsmin/*          " JS
set wildignore+=*.fls,*.aux,*.fdb_latexmk   " latex
set wildignore+=*.class,*.jar,*.sbt         " Java / Scala
set wildignore+=*.o                         " C
set wildignore+=*Godeps*                    " Go
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_working_path_mode = 'rc'
let g:ctrlp_custom_ignore = {
	\ 'dir': '\v[\/](git|build|rtp-messages)$',
	\ }

set runtimepath^=~/.vim/bundle/ag

" insert matching bracket
inoremap {<CR> {<CR>}<C-o>O

" vim sneak
set wildmode=full
set wildmenu
nmap s <Plug>Sneak_s
let g:sneak#s_next = 0
if (&tildeop)
  nmap gcw guw~l
  nmap gcW guW~l
  nmap gciw guiw~l
  nmap gciW guiW~l
  nmap gcis guis~l
  nmap gc$ gu$~l
  nmap gcgc guu~l
  nmap gcc guu~l
  vmap gc gu~l
else
  nmap gcw guw~h
  nmap gcW guW~h
  nmap gciw guiw~h
  nmap gciW guiW~h
  nmap gcis guis~h
  nmap gc$ gu$~h
  nmap gcgc guu~h
  nmap gcc guu~h
  vmap gc gu~h
endif

" Make inside vim
set makeprg=make\ -C\ build\ -j

nmap ln :lnext<CR>
nmap lp :lprevious<CR>

" YouCompleteMe
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
nmap <leader>y :YcmDiags<CR>

" block cursor
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
" let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" Make Vim to handle long lines nicely.
set wrap
set textwidth=79
set formatoptions=qrn1
