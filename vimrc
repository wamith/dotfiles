"mac fix
let macvim_skip_cmd_opt_movement = 1 


" Wamith's vimrc file
  command! CDC cd /Volumes/wamith/

"my leaders
"map <Leader>cdv :cd /Volumes/wamith/voice/src/<CR>
map <Leader>ev :e /Volumes/wamith/voice/
map <Leader>eu :e /Volumes/wamith/voice-uk/
map <leader>cd :cd %:p:h<CR>:pwd<CR>
map <Leader>cn :e ~/Dropbox/notes/coding-notes.txt<cr>
map <Leader>mn :e ~/Dropbox/notes/misc-notes.txt<cr>



" Modeline and Notes {
"   vim: set foldmarker={,} foldlevel=0 spell:
"
"   This is my personal .vimrc, I don't recommend you copy it, just
"   use the "   pieces you want(and understand!).  When you copy a
"   .vimrc in its entirety, weird and unexpected things can happen.
"
"   If you find an obvious mistake hit me up at:
"   http://robertmelton.com/contact (many forms of communication)
" }

" Basics {
    set nocompatible " explicitly get out of vi-compatible mode
    "set noexrc " don't use local version of .(g)vimrc, .exrc
    set encoding=utf8 "to force it for an open file run :setlocal fileencoding=utf-8 
    set background=dark " we plan to use a dark background
    set cpoptions=aABceFsmq
    "             |||||||||
    "             ||||||||+-- When joining lines, leave the cursor
    "             |||||||      between joined lines
    "             |||||||+-- When a new match is created (showmatch)
    "             ||||||      pause for .5
    "             ||||||+-- Set buffer options when entering the
    "             |||||      buffer
    "             |||||+-- :write command updates current file name
    "             ||||+-- Automatically add <CR> to the last line
    "             |||      when using :@r
    "             |||+-- Searching continues at the end of the match
    "             ||      at the cursor position
    "             ||+-- A backslash has no special meaning in mappings
    "             |+-- :write updates alternative file name
    "             +-- :read updates alternative file name
    syntax on " syntax highlighting on
    nmap <c-s> :w<CR>
    imap <c-s> <Esc>:w<CR>a
" }

" General {
    set tags=./tags;
    filetype plugin indent on " load filetype plugins/indent settings
    set smartindent "Auto indent
    "set autochdir " always switch to the current file directory
    autocmd BufEnter * lcd %:p:h   "set this in place of autochdir as it sometimes messes up some plugins
    set backspace=indent,eol,start " make backspace a more flexible
    "set backup " make backup files
    set backupdir=~/.vim/backup " where to put backup files
    "set backupdir=$VIMRUNTIME/backup " where to put backup files
    set directory=~/.vim/tmp " directory to place swap files in
    set clipboard+=unnamed " share windows clipboard
    set nobackup
    set nowb
    set noswapfile
    set fileformats=unix,dos,mac " support all three, in this order
    set hidden " you can change buffers without saving
    " (XXX: #VIM/tpope warns the line below could break things)
    "set iskeyword+=_,$,@,%,# " none of these are word dividers
    set iskeyword+=_,@,%,# " none of these are word dividers
    set mouse=a " use mouse everywhere
    set noerrorbells " don't make noise
    set whichwrap=b,s,h,l,<,>,~,[,] " everything wraps
    "             | | | | | | | | |
    "             | | | | | | | | +-- "]" Insert and Replace
    "             | | | | | | | +-- "[" Insert and Replace
    "             | | | | | | +-- "~" Normal
    "             | | | | | +-- <Right> Normal and Visual
    "             | | | | +-- <Left> Normal and Visual
    "             | | | +-- "l" Normal and Visual (not recommended)
    "             | | +-- "h" Normal and Visual (not recommended)
    "             | +-- <Space> Normal and Visual
    "             +-- <BS> Normal and Visual
    set wildmenu " turn on command line completion wild style
    " ignore these list file extensions
    set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,
                    \*.jpg,*.gif,*.png
    set wildmode=list:longest " turn on wild mode huge list
    set inc=^\\s*#\\s*include " pattern for an include file
	 set printoptions=paper:A4,syntax:n,number:y,wrap:y,portrait:n
	 " Optimize for fast terminal connections
	 set ttyfast
" }

" Vim UI {
   " set cursorcolumn " highlight the current column
    set cursorline " highlight current line
    set incsearch " BUT do highlight as you type you
                   " search phrase
    set laststatus=2 " always show the status line
    set lazyredraw " do not redraw while running macros
    set linespace=0 " don't insert any extra pixel lines
                     " betweens rows
    set list " we do what to show tabs, to ensure we get them
              " out of my files
    set listchars=tab:>-,trail:- " show tabs and trailing
    set matchtime=7 " how many tenths of a second to blink
                     " matching brackets for
    set hlsearch " highlight searched for phrases
    set nostartofline " leave my cursor where it was
    set visualbell " don't make a sound, blink instead
    set number " turn on line numbers
"	set relativenumber	"turn on relative line numbers
    set numberwidth=4 " We are good up to 9999 lines
    "set report=0 " tell us when anything is changed via :...
    set ruler " Always show current positions along the bottom
    set scrolloff=7 " Keep 10 lines (top/bottom) for scope
    set shortmess=aOstT " shortens messages to avoid
                         " 'press a key' prompt
    set showcmd " show the command being typed
    set showmatch " show matching brackets
    set sidescrolloff=10 " Keep 5 lines at the size
    "set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]%=CWD:\ %{getcwd()}\ 
    set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
    "              | | | | |  |   |      |  |     |    |
    "              | | | | |  |   |      |  |     |    + current
    "              | | | | |  |   |      |  |     |       column
    "              | | | | |  |   |      |  |     +-- current line
    "              | | | | |  |   |      |  +-- current % into file
    "              | | | | |  |   |      +-- current syntax in
    "              | | | | |  |   |          square brackets
    "              | | | | |  |   +-- current fileformat
    "              | | | | |  +-- number of lines
    "              | | | | +-- preview flag in square brackets
    "              | | | +-- help flag in square brackets
    "              | | +-- readonly flag in square brackets
    "              | +-- rodified flag in square brackets
    "              +-- full path to file in the buffer
" }

" Text Formatting/Layout {
"    set completeopt= " don't use a pop up menu for completions
"   set expandtab " no real tabs please!
    set smarttab 
    set formatoptions=rq " Automatically insert comment leader on return,
                          " and let gq format comments
    set ignorecase " case insensitive by default
    set infercase " case inferred by default
    set nowrap " do not wrap line
    set shiftround " when at 3 spaces, and I hit > ... go to 4, not 5
    set smartcase " if there are caps, go case-sensitive
    set shiftwidth=4 " auto-indent amount when using cindent,
                      " >>, << and stuff like that
"    set softtabstop=4 " when hitting tab or backspace, how many spaces
                       "should a tab be (see expandtab)
    set tabstop=4 " real tabs should be 4, and they will show with
                   " set list on
" }

" Folding {
    set foldenable " Turn on folding
    set fdc=2   "folder margin size
    set foldmarker={,} " Fold C style code (only use this as default
                        " if you use a high foldlevel)
    set foldmethod=marker " Fold on the marker
    set foldlevel=100 " Don't autofold anything (but I can still
                      " fold manually)
    set foldopen=block,hor,mark,percent,quickfix,tag " what movements
                                                      " open folds
    function SimpleFoldText() " {
        return getline(v:foldstart).' '
    endfunction " }
    set foldtext=SimpleFoldText() " Custom fold text function
                                   " (cleaner than default)
   "   toggle fold
   map <F5> za
   imap <F5> <C-O>za
   map <S-F5> zA
   imap <S-F5> <C-O>zA
   "   open/restore foldings
   map <F6> zn
   imap <F6> <C-O>zn
   map <S-F6> zN
   imap <S-F6> <C-O>zN
" }

" Plugin Settings {

	map <Leader>mbe :MBEOpen<cr>
	map <Leader>mbc :MBEClose<cr>
	map <Leader>mbt :MBEToggle<cr>
	let g:miniBufExplAutoStart = 1
	let g:miniBufExplUseSingleClick = 1
	"setlocal bufhidden=wipe

	let g:miniBufExplStatusLineText="-MiniBufExplorer-%=CWD:%{getcwd()}  "

    let b:match_ignorecase = 1 " case is stupid
    let perl_extended_vars=1 " highlight advanced perl vars
                              " inside strings

    " TagList Settings {
        nnoremap <silent> <F8> :TlistToggle<CR>
        let Tlist_Exit_OnlyWindow = 1     " exit if taglist is last window open
        let Tlist_Show_One_File = 1       " Only show tags for current buffer

    	set tr " file names in tag are relative to tags file
        let Tlist_Auto_Open=0 " let the tag list open automagically
        let Tlist_Compact_Format = 1 " show small menu
        let Tlist_Ctags_Cmd = 'ctags' " location of ctags
        let Tlist_Enable_Fold_Column = 0 " do show folding tree
        let Tlist_Exist_OnlyWindow = 1 " if you are the last, kill
                                        " yourself
        let Tlist_File_Fold_Auto_Close = 0 " fold closed other trees
        let Tlist_Sort_Type = "name" " order by
        let Tlist_Use_Right_Window = 1 " split to the right side
                                        " of the screen
        let Tlist_WinWidth = 40 " 40 cols wide, so i can (almost always)
                                 " read my functions
        " Language Specifics {
            " just functions and classes please
            let tlist_aspjscript_settings = 'asp;f:function;c:class' 
            " just functions and subs please
            let tlist_aspvbs_settings = 'asp;f:function;s:sub' 
            " don't show variables in freaking php
            let tlist_php_settings = 'php;c:class;d:constant;f:function' 
            " just functions and classes please
            let tlist_vb_settings = 'asp;f:function;c:class' 
        " }
        "autocmd InsertLeave * if pumvisible() == 0|pclose|endif "autocloses the preview window for omni-completion
        

    " }
" }

" Mappings {

   " ROT13 - fun
   map <F12> ggVGg?
   map <leader>rot ggVGg?
   nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
   
   

    " space / shift-space scroll in normal mode
    noremap <S-space> <C-b>
    noremap <space> <C-f>
    set scr=7 "number of lines to scroll when using ctrl-U or ctrl-D

    " this settings are basically for gvim in gtk and windows
    "map <silent><A-Right> :tabnext<CR>
    "map <silent><A-Left> :tabprevious<CR>

    " Make Arrow Keys Useful Again {
	map <A-left> <ESC>:bp<CR>
	map <A-right> <ESC>:bn<CR>
	map <A-up> <ESC>:b#<CR>
	map <A-down> <ESC>:b#<CR>
	map <A-'> <ESC>:b#<CR>
    " }
" }

" Autocommands {

    "autocmd QuickFixCmdPre make w

    "php {
		let g:snips_author='Wamith Mockbill'
		let g:author='Wamith Mockbill'
		let g:snips_email='wamith@users.noreply.github.com'

        au FileType php set makeprg=php\ -l\ %
        au FileType php set errorformat=%m\ in\ %f\ on\ line\ %l
		au FileType php set inc=^\\s*require " pattern for an include file

        " run file with PHP CLI (CTRL-M)
        "au FileType php noremap <C-M> :w!<CR>:!$HOME/bin/php %<CR>

        " PHP parser check (CTRL-L)
        "au FileType php noremap <C-L> :!$HOME/bin/php -l %<CR>
        au FileType php noremap <C-L> :make %<CR>

        au BufRead,BufNewFile *.php set filetype=php   "multiple files for snipMate
        au BufRead,BufNewFile *.tpl set filetype=html   "multiple files for snipMate
        "au BufRead,BufNewFile *.php set filetype=html.php   "multiple files for snipMate
    "}
    " Notes {
        " I consider .notes files special, and handle them differently, I
        " should probably put this in another file
        au BufRead,BufNewFile *.notes set foldlevel=2
        au BufRead,BufNewFile *.notes set foldmethod=indent
        au BufRead,BufNewFile *.notes set foldtext=foldtext()
        au BufRead,BufNewFile *.notes set listchars=tab:\ \
        au BufRead,BufNewFile *.notes set noexpandtab
        au BufRead,BufNewFile *.notes set shiftwidth=8
        au BufRead,BufNewFile *.notes set softtabstop=8
        au BufRead,BufNewFile *.notes set tabstop=8
        au BufRead,BufNewFile *.notes set syntax=notes
        au BufRead,BufNewFile *.notes set nocursorcolumn
        au BufRead,BufNewFile *.notes set nocursorline
        au BufRead,BufNewFile *.notes set guifont=Consolas:h12
        au BufRead,BufNewFile *.notes set spell
    " }
    au BufNewFile,BufRead *.ahk setf ahk 
" }
" GUI Settings {
        colorscheme default
if has("gui_running")
    " Basics {
        colorscheme oceandeep " my color scheme (only works in GUI)
        set columns=150 " perfect size for me
        "set guifont=Consolas\ 12\ Pitch " My favorite font
        set guifont=Monaco:h11 " My favorite font
        "set guifont=Consolas:h12 " My favorite font
        "set guioptions=ce 
        "              ||
        "              |+-- use simple dialogs rather than pop-ups
        "              +  use GUI tabs, not console style tabs
        set lines=75 " perfect size for me
        set mousehide " hide the mouse cursor when typing
    " }

    " Font Switching Binds {
        "map <F8> <ESC>:set guifont=Consolas:h8<CR>
        "map <F9> <ESC>:set guifont=Consolas:h10<CR>
        "map <F10> <ESC>:set guifont=Consolas:h12<CR>
       " map <F11> <ESC>:set guifont=Consolas:h16<CR>
       " map <F12> <ESC>:set guifont=Consolas:h20<CR>
    " }
endif
" }
