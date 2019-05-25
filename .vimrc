"set term=xterm-255color
" URL: http://vim.wikia.com/wiki/Example_vimrc
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: A minimal, but feature rich, example .vimrc. If you are a
"              newbie, basing your first .vimrc on this file is a good choice.
"              If you're a more advanced user, building your own .vimrc based
"              on this file is still a good idea.

"------------------------------------------------------------
" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting
syntax on


"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.

" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden

" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline


"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>


"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
"set shiftwidth=4
"set tabstop=4


"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-/> :nohl<CR><C-L>

"------------------------------------------------------------
" netrw config
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 15
" augroup ProjectDrawer
"       autocmd!
"         autocmd VimEnter * :Vexplore
"     augroup END

let g:netrw_list_hide= '.*\.swp$'

autocmd BufWritePre * :%s/\s\+$//e

"
if bufwinnr(1)
    map = <C-W>+
    map - <C-W>-
    map _ <C-W><
    map + <C-W>>
    endif

autocmd VimEnter * wincmd l
" autocmd VimEnter * :sp

" ctrl + setas para trocar de janelas
map <silent> <C-Up> :wincmd k<Return>
map <silent> <C-Down> :wincmd j<Return>
map <silent> <C-Left> :wincmd h<Return>
map <silent> <C-Right> :wincmd l<Return>

" Atalhos de navegação entre arquivos abertos
map <silent> <C-PageUp> :bprevious<Return>
map! <silent> <C-PageUp> <Esc>:bprevious<Return>
map <silent> <C-PageDown> :bnext<Return>
map! <silent> <C-PageDown> <Esc>:bnext<Return>

colorscheme desert

" augroup tslint
"     function! s:typescript_after(ch, msg)
"         let cnt = len(getqflist())
"         if cnt > 0
"             echomsg printf('[Tslint] %s errors', cnt)
"         endif
"     endfunction
"     let g:tslint_callbacks = {
"         \ 'after_run': function('s:typescript_after')
"         \ }

"     let g:tsuquyomi_disable_quickfix = 1

"     function! s:ts_quickfix()
"         let winid = win_getid()
"         execute ':TsuquyomiGeterr'
"         call tslint#run('a', winid)
"     endfunction

"     autocmd BufWritePost *.ts,*.tsx,*.vue silent! call s:ts_quickfix()
"     autocmd InsertLeave *.ts,*.tsx,*.vue silent! call s:ts_quickfix()
" augroup END

"NERDTree config
let g:NERDTreeNodeDelimiter = "\u00a0"
" autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-o> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$', '\.swp']

"Pesquisa em todos os arquivos
map <C-P> :Files<CR>

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

"Searching with vimgrep

nmap <C-F>v :vimgrep // **/*.*<left><left><left><left><left><left><left><left>
nmap <C-F>V :vimgrep /<C-R><C-W>/ **/*.*<CR>
nmap <C-F>c :cwindow<CR>

set wildignore=*.o,*.a,*.so,*.pyc,*.swp,.git/**,*.class,*/target/*,.idea/**,.gitlab/**,.gradlew/**,*.log,logs/**,mapas/**,build/**,**/dist/**,**/node_modules/**

"Searching with ack

nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>
