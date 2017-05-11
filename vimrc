" vim configuration file
" Tyler Levine
" Last updated: 5/10/17

"""""""""""""""""""
" General Options "
"""""""""""""""""""
"{{{

"dein Scripts-----------------------------
if &compatible
    " vi compatibility... yeah right
    set nocompatible
endif

" Required:
set runtimepath+=~/.vim/bundle/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.vim/bundle')
    call dein#begin('~/.vim/bundle')

    " Let dein manage dein
    " Required:
    call dein#add('~/.vim/bundle/repos/github.com/Shougo/dein.vim')

    " Add or remove your plugins here:
    call dein#add('Shougo/neosnippet.vim')
    call dein#add('Shougo/neosnippet-snippets')
    call dein#add('scrooloose/syntastic')
    call dein#add('tpope/vim-fugitive')
    call dein#add('Raimondi/delimitMate')
    call dein#add('bling/vim-airline')
    call dein#add('kien/ctrlp.vim')
"   call dein#add('Valloric/YouCompleteMe')
    call dein#add('Lokaltog/vim-easymotion')
    call dein#add('edkolev/tmuxline.vim')
    call dein#add('vim-scripts/a.vim')
"   call dein#add('SirVer/ultisnips')
    call dein#add('honza/vim-snippets')
"   call dein#add('oplatek/Conque-Shell')

    " Required:
    call dein#end()
    call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
    call dein#install()
endif

"End dein Scripts-------------------------

" vim-powerline also requires UTF-8 encoding, which is probably not a bad idea anyway
set encoding=utf-8

" a tab is 4 spaces by default please
" also some other formatting options here
" I think you are smart enough to figure it out
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab " I like my tabs :-(, but it is not the vim way
set autoindent
set smartindent " vital
" set cindent " don't think I need this right now

" set up the gui the right way
" this means remove menubar and toolbar as well as scroll bars and other crap
" keep the icon though, as unity looks better with it
set guioptions=acegi

" cursor options for the gui so it is pretty
set guicursor=n-v-c:block-Cursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor,r-cr:hor20-Cursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

" add a $ to the end of a range when doing changes
set cpoptions+=$

" allow the cursor to go into forbidden places, like that old vacant house up on the hill
set virtualedit=all

" line numbers are nice
set number " but i think I like relative numbering more
" set relativenumber " oh just do the simple addition you lazy mofo

" set textmate-style whitespace indicators when using :set list
set listchars=tab:▸°,eol:¬,precedes:·,extends:»,trail:¢,nbsp:¤

" also show whitespace characters by default
set list

" suppress the splash screen
set shortmess+=I

" syntax style folding seems nice actually nope, lets go with marker, but also expr seems good too.
" AHHHH. Going back to syntax now, I can't stand all the fold markers littering my code.
" I'll just enable marker folding with a modeline when necessary (as I've done in this file)
set foldmethod=syntax

" I like wild menus
set wildmenu

" but they should really work like this
set wildmode=list:full

" allow unsaved hidden buffers
set hidden

" Search wraps around to the beginning if we start a search in the middle of a file
set wrapscan

" don't wrap my text to the window size, just show a continuation char
set nowrap

" set sidescrolling to a single char at a time
" The default is to put the cursor in the middle and I find it can be quite jarring
set sidescroll=1

" set sidescrolling offset so we don't have to go all the way to the end when trying to scroll horizontally
set sidescrolloff=8

" forward slash is the only real slash
" backslash is a government conspiracy
set shellslash

" don't update the buffer when doing macros
set lazyredraw

" show what mode vim is in
set noshowmode
" don't need this anymore since I'm using vim-powerline
" besides I think I'm experienced enough now to know what mode I'm in

" command line is 2 rows tall
" not sure if I want this but I'll give it a shot
" set ch=2
" Nah.. I don't need 2 lines.

" visual bell instead of annoying beep
set vb " This is kind of annoying as well, but I'll keep it for now

" allow backspacing over indent, eol, and insertion starts
set backspace=2

" Set the status line the way I like it
" which happens to be the way Derek Wyatt likes it too
" Note: will get overridden by vim-statusline when available
set stl=%f\ %m\ %r\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n\ [%b][0x%B]

" show the status line even if there is only one window
set laststatus=2

" timeout length for multi-key commands (in milliseconds)
set timeoutlen=500

" Keep a good memory
set history=250

" Keep the cursor 4 rows away from the top and bottom edges when scrolling
set scrolloff=4

" Use incremental search
set incsearch

" automatically update files that have been changed on the disk while we were working
set autoread

" Don't bog me down with too much syntax coloring, man
set synmaxcol=2048

" Don't leave swap file or backup file clutter in every working directory
set directory=~/.vim/swap//,.,/var/tmp//,/tmp//
set backupdir=~/.vim/backup/,.

" set guifont=Monaco\ for\ Powerline:h16
set guifont=Meslo\ LG\ L\ Regular\ for\ Powerline:h14

" Ignore object files when doing autocompletion. Ctrl-P also respects this.
set wildignore=*.o

" Ignore case sensitivity when searching with /, ?, and Ctrl-P
set ignorecase

" complete longest common text of matches when doing completions
set completeopt=menu,preview,longest

" larger vim when running in gui mode, otherwise
" use default of 80 cols by 20 lines when in command line
if has("gui_running")
    set lines=32 columns=110
else
    " configure for 256 color mode in terminal
    set t_Co=256

"    if exists("+lines")
"        set lines=20
"    endif
"    if exists("+columns")
"        set columns=80
"    endif
endif

" this is a nice colorscheme
colorscheme koehler

" de-uglify folds
highlight Folded guibg=Black

"}}}

""""""""""""""""""""""""
" Variable Definitions "
""""""""""""""""""""""""
"{{{
" KNEEL BEFORE THE COMMA
let mapleader = ","
"}}}

""""""""""""""""""""""""
" Plugin Configuration "
""""""""""""""""""""""""
"{{{
" Disable insertion of placeholders when using lh-brackets
" let b:usemarks=0

" let airline use powerline fonts
let g:airline_powerline_fonts = 1

" use airline syntastic integration
let g:airline#extensions#syntastic#enabled = 1

" use airline fugitive integration
let g:airline#extensions#branch#enabled = 1

" change the ctrlp map to ,fa
let g:ctrlp_map = "<leader>fa"

let g:ctrlp_extensions = ['dir']

let g:ctrlp_custom_ignore = '.*\.class$'

""" CtrlP remaps
" search within current directory
nnoremap <silent> <leader>fd :CtrlP .<cr>

" search within buffer list
nnoremap <silent> <leader>fs :CtrlPBuffer<cr>

" search for and change to new directory
nnoremap <silent> <leader>fg :CtrlPDir<cr>

" make syntastic always update location list when running a checker
let g:syntastic_always_populate_loc_list = 1

" automatically open the location list when an error is detected
" and also automatically close it when they are fixed
let g:syntastic_auto_loc_list = 1

" use javac config file to maintain custom classpath across restarts
let g:syntastic_java_javac_config_file_enabled = 1

" hide some annoying warnings I'm getting while working on stuff for CSE 131
" let g:syntastic_quiet_messages = {
"           \ "file": '.*src/.*/parser.java$',
"           \ }

" easymotion remaps
map  <Leader> <Plug>(easymotion-prefix)
map  /        <Plug>(easymotion-sn)
omap /        <Plug>(easymotion-tn)
map  n        <Plug>(easymotion-next)
map  N        <Plug>(easymotion-prev)
nmap s        <Plug>(easymotion-s)

" easymotion config
let g:EasyMotion_smartcase = 1

" ycm config
" let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_extra_conf_globlist = ['~/src/*', '!~/*']

" make ultisnips and YCM play well together
" from http://stackoverflow.com/questions/14896327/ultisnips-and-youcompleteme
" function! g:UltiSnips_Complete()
"     call UltiSnips#ExpandSnippet()
"     if g:ulti_expand_res == 0
"         if pumvisible()
"             return "\<C-n>"
"         else
"             call UltiSnips#JumpForwards()
"             if g:ulti_jump_forwards_res == 0
"                return "\<TAB>"
"             endif
"         endif
"     endif
"     return ""
" endfunction
" 
" au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
" 
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsListSnippets="<c-e>"
" this mapping Enter key to <C-y> to chose the current highlight item 
" and close the selection list, same as other IDEs.
" CONFLICT with some plugins like tpope/Endwise
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"}}}

""""""""""""""""""""""""
" Miscellaneous remaps "
""""""""""""""""""""""""
"{{{
" Toggle the fold currently under the cursor with space
nnoremap <SPACE> za

" F1 and ESC are too close!
" use :h for help instead
inoremap <F1> <Esc>

" Allow saving of read-only files with sudo when I forget to start vim as root
cmap w!! %!sudo tee > /dev/null %

" quick access to buffer list
noremap <silent> <leader>b :buffers<cr>

" jk to exit insert mode and leave the cursor where it was
" it's faster than jj, I guarantee it
inoremap jk <Esc>l

" quick switch to previous buffer
nnoremap <silent> <leader><SPACE> :b#<cr>

" file write shortcut
nnoremap <silent> <leader>w :w<cr>

" check current file for errors and open error location list if necessary
nnoremap <silent> <leader>e :echo "Running checker..."
            \<cr>:SyntasticCheck<cr>:echo ""<cr>

" close error location list
nnoremap <silent> <leader>E :lcl<cr>

" go to next error
nnoremap <silent> <leader>n :lne<cr>

" go to previous error
nnoremap <silent> <leader>N :lp<cr>

" trim white space
nnoremap <silent> <leader>t :%s/\s\+$<cr><C-O>

"}}}

""""""""""""""""
" Autocommands "
""""""""""""""""
"{{{
if has("autocmd")
    " map F2 to a.vim source/header swap functionality on VimEnter
    autocmd VimEnter * if exists(":A") |
                \ noremap <silent> <leader>a :A<CR>|
    \ endif

    " automatically set b:usemarks=0 for all new buffers in order to
    " disable lh-brackets placeholder insertion when completing brackets
    " autocmd BufWinEnter * let b:usemarks=0

    " prevent carpal tunnel from doing zR every damn time I open a file
    autocmd BufWinEnter * normal zR

    " close omni-completion tip window automatically when no longer needed
    autocmd InsertLeave  * if pumvisible() == 0 && bufname("%") != "[Command Line]"|pclose|endif

endif
"}}}

"""""""""""""""""""""""""
" Window control remaps "
"""""""""""""""""""""""""
"{{{

" hide all other windows
noremap <silent> <leader>o :only<cr>

" new vertical split
noremap <silent> <leader>v :vsp<cr>

" new horizontal split
" use capital S, lowercase s is used by easymotion
noremap <silent> <leader>S :sp<cr>

" Move the cursor to the window left of the current one
noremap <silent> <leader>h :wincmd h<cr>

" below current window
noremap <silent> <leader>j :wincmd j<cr>

" right of current window
noremap <silent> <leader>l :wincmd l<cr>

" above current window
noremap <silent> <leader>k :wincmd k<cr>

" Close the window to the left of the current one
noremap <silent> <leader>ch :wincmd h<cr>:close<cr>

" below current window
noremap <silent> <leader>cj :wincmd j<cr>:close<cr>

" above current window
noremap <silent> <leader>ck :wincmd k<cr>:close<cr>

" right of current window
noremap <silent> <leader>cl :wincmd l<cr>:close<cr>

" close current window
noremap <silent> <leader>cc :close<cr>

" Move current window to the left of the main vim window
noremap <silent> <leader>mh <C-W>H

" top of main vim window
noremap <silent> <leader>mk <C-W>K

" bottom of main vim window
noremap <silent> <leader>mj <C-W>J

" right of the main vim window
noremap <silent> <leader>ml <C-W>L
"}}}

" source local vimrc if it exists to allow local overrides
try
    source ~/.vimrc.local
catch
    " No file? Don't worry about it
endtry

" vim: fdm=marker
