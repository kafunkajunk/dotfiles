set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'godlygeek/tabular' 
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'OmniSharp/omnisharp-vim'
Plugin 'SirVer/ultisnips'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-dispatch'
Plugin 'wincent/command-t'
Plugin 'Yggdroot/indentLine'
Plugin 'scrooloose/syntastic'
Plugin 'plasticboy/vim-markdown'
Plugin 'fsharp/vim-fsharp'
Plugin 'elixir-lang/vim-elixir'
Plugin 'Shougo/vimproc.vim'
Plugin 'AndrewRadev/linediff.vim'
Plugin 'ctrlpvim/ctrlp.vim' 
call vundle#end()

map <silent><C-n><C-e> :NERDTreeToggle<CR>
map <silent><C-t><C-t> :TableFormat<CR>

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<C-a>"


:syntax on

au BufRead,BufNewFile *.md set filetype=markdown

" allows cursor type to change depending on normal/insert mode. only works for iterm2

:set number
:set expandtab "To insert space characters whenever the tab key is pressed, set the 'expandtab' option. With this option set, if you want to enter a real tab character use Ctrl-V<Tab> key sequence.
:set sw=2
:set tabstop=2
:runtime macros/matchit.vim
:filetype indent on
:filetype plugin on

:set incsearch "highlights as you type an expression

:set ignorecase "make searches case-insensitive except 
:set smartcase "when you include upper-case characters

:set hlsearch

"instead use :<C-f> for command history
:map q: <nop>

:nnoremap Q <nop>

:nmap \q :nohlsearch<CR>

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif

:nmap k gk
:nmap j gj
:nmap 0 g0
:nmap $ g$

:map <F2> :.w !pbcopy <CR><CR>  
:map <F3> :r !pbpaste <CR>

:map <c-p> :CtrlP<CR>

"removes help window
map <F1> <Esc> 
imap <F1> <Esc>

"pretty print json using python
:map <c-j><c-p><c-p> :%! python -m json.tool<CR>

:let g:fsharp_xbuild_path = "/usr/local/bin/xbuild" " used for vim-fsharp

:let g:syntastic_fsharp_checkers = ['syntax', 'semantic', 'issues']
:let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']

:set mouse=a
:set backspace=2 
:set ssop+="globals"

set runtimepath^=~/.vim/bundle/ctrlp.vim 

autocmd FileType markdown set runtimepath-=~/.vim/bundle/indentLine

if $ITERM_PROFILE == "Solarized light"
  :colorscheme solarized
  :set background=light	
endif

let g:ragtag_global_maps = 1

if has("gui_running")

	:colorscheme deep-space
	":set background=light	
	:set guifont=Source_Code_Pro:h17
	:set guioptions-=T
	
endif

" changes cursor when in insert mode

if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul
