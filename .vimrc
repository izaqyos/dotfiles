set nocompatible
"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin

"pathogen - auto install from bundle dir
"execute pathogen#infect()
call pathogen#infect()
call pathogen#helptags()


filetype plugin indent on
let python_highlight_all=1
syntax on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" auto completion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"English words completion dictionary
set dictionary+=/usr/share/dict/words
"add dictionary as completion source
"set complete+=k
set complete=.,w,b,u,k,i,]
set complete+=kspell
set completeopt=menuone
"set completeopt=menuone, longest
"set shortmess=+c " shortens auto complete messages

" Complete options (disable preview scratch window)
set completeopt ="longest,menuone,menu"
"   " Limit popup menu height
set pumheight=15
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Navigate the complete menu items like CTRL+n / CTRL+p would.
"inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
"  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <Down> pumvisible() ? "<C-n>" :"<Down>"
inoremap <expr> <Up> pumvisible() ? "<C-p>" : "<Up>"

" Select the complete menu item like CTRL+y would.
inoremap <expr> <Right> pumvisible() ? "<C-y>" : "<Right>"
inoremap <expr> <CR> pumvisible() ? "<C-y>" :"<CR>"

" Enable plugins and load plugin for the detected file type.
filetype plugin on
" Enable Omnicomplete features
set omnifunc=syntaxcompleteComplete
:set omnifunc=htmlcomplete#CompleteTags
:set omnifunc=csscomplete#CompleteCSS
:set omnifunc=phpcomplete#CompletePHP
:set omnifunc=javascriptcompleteCompleteJS

" Cancel the complete menu item like CTRL+e would.
inoremap <expr> <Left> pumvisible() ? "<C-e>" : "<Left>"
"     Supertab
"      " SuperTab option for context aware completion. ex:
""          /usr/l<tab>     # will use filename completion
"    myvar.t<tab>    # will use user completion if completefunc set,
"                    # or omni completion if omnifunc set.
"    myvar-><tab>    # same as above
let g:SuperTabDefaultCompletionType = "context"
autocmd FileType *
  \ if &omnifunc != '' |
  \   call SuperTabChain(&omnifunc, "<c-p>") |
  \ endif
"
"      " SuperTab fallback in case context completion fails
let g:SuperTabContextDefaultCompletionType = "<c-x><c-u><c-k>"
"     Supertab

""         " Disable auto popup, use <Tab> to autocomplete
"let g:clang_complete_auto = 0
"         " Enable auto popup, use <Tab> to autocomplete
" let g:clang_complete_auto = 1
"           " Show clang errors in the quickfix window
" let g:clang_complete_copen = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible " get out of horrible vi-compatible mode
filetype on " detect the type of file
set history=1000 " How many lines of history to remember
set cf " enable error files and error jumping
set clipboard+=unnamed " turns out I do like is sharing windows clipboard
set ffs="mac,unix,dos" support all three, in this order
set ff=unix "I want unix files
filetype plugin on " load filetype plugins
set viminfo+="100,f1" " save local marks up to 100 files. f1 to also save global marks
set viminfo+=! " make sure it can save viminfo
set isk+=_,$,@,%,#,- " none of these should be word dividers, so make them not be

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
  if has("gui_gtk2")
    "set guifont=Inconsolata\ 12
    set guifont=Courier\ Bold\ 13
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    "set guifont=Consolas:h11:cANSI
    set guifont=Courier\ Bold\ 13
  endif
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme/Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"syntax on " syntax highlighting on
colorscheme eva01 " my theme
"colorscheme breeze " my theme
"colorscheme morning " my theme
"colorscheme elflord " my theme
"colorscheme black_angus 
"colorscheme desert256
"colorscheme solarized
" set background=dark
" colorscheme desert256
"set background=light

"dark solarized
set background=dark
"light solarized
"set background=light
"colorscheme solarized8_high
"colorscheme nightcoder "download from https://raw.githubusercontent.com/a5hk/night-coder/master/color-themes/vim/colors/nightcoder.vim
"colorscheme ChocolateLiquor
"colorscheme abstract




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files/Backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backup " make backup file
set backupdir=~/.vim/tmpBackup "backup dir
set directory=~/.vim/tmp " temp file
if empty(glob('~/.vim/tmp'))
    silent !mkdir -p ~/.vim/tmp
endif
set directory=$HOME/.vim/tmp
set directory=~/.vim/vim-swap " directory is the directory for temp file
set makeef=error.err " When using make, where should it dump the file

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim UI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set lsp=0 " space it out a little more (easier to read)
set wildmenu " turn on wild menu
set ruler " Always show current positions along the bottom 
set cmdheight=2 " the command bar is 2 high
set number " turn on line numbers
set lz " do not redraw while running macros (much faster) (LazyRedraw)
set hid " you can change buffer without saving
set backspace=2 " make backspace work normal
set whichwrap+=<,>,h,l  " backspace and cursor keys wrap to
"set mouse=a " use mouse everywhere
set shortmess=atI " shortens messages to avoid 'press a key' prompt 
set report=0 " tell us when anything is changed via :...
set noerrorbells " don't make noise
" make the splitters between windows be blank
set fillchars=vert:\ ,stl:\ ,stlnc:\ 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual Cues
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showmatch " show matching brackets
set mat=5 " how many tenths of a second to blink matching brackets for
"set nohlsearch " do not highlight searched for phrases
set incsearch " BUT do highlight as you type you search phrase
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$ " what to show when I hit :set list
"set lines=80 " 80 lines tall
"set columns=160 " 160 cols wide
set so=10 " Keep 10 lines (top/bottom) for scope
set novisualbell " don't blink
set noerrorbells " no noises
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2 " always show the status line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text Formatting/Layout
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set fo=tcrqn " See Help (complex)
set ai " autoindent
set si " smartindent 
"set cindent " do c-style indenting
"set expandtab
"set shiftwidth=8 " unify 
"set noexpandtab " real tabs please!
"set nowrap " do not wrap lines  
"set smarttab " use tabs at the start of a line, spaces elsewhere
set fileformat=unix

"python indenting
au BufNewFile,BufRead *.py
 set tabstop=4 |
 set softtabstop=4 |
 set shiftwidth=4 |
 set textwidth=79 |
 set expandtab |
 set autoindent |
 set fileformat=unix

"Javascript/html/css indenting
au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4

"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

""python venv support
""python with virtualenv support
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
"EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
"    Enable folding, but by default make it act like folding is off, because folding is annoying in anything but a few rare cases
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldenable " Turn on folding
set foldmethod=indent " Make folding indent sensitive
set foldlevel=100 " Don't autofold anything (but I can still fold manually)
set foldopen-=search " don't open folds when you search into them
set foldopen-=undo " don't open folds when you undo stuff
nnoremap <C-F><C-a> za

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File Explorer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:explVertical=1 " should I split verticially
let g:explWinSize=35 " width of 35 pixels

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Win Manager
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:winManagerWidth=35 " How wide should it be( pixels)
let g:winManagerWindowLayout = 'FileExplorer,TagsExplorer|BufExplorer' " What windows should it

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let Tlist_Ctags_Cmd = "D:\Program Files\Vim\ctags554\ctags.exe" " Location of ctags
"let Tlist_Sort_Type = "name" " order by 
"let Tlist_Use_Right_Window = 1 " split to the right side of the screen
"let Tlist_Compart_Format = 1 " show small meny
"let Tlist_Exist_OnlyWindow = 1 " if you are the last, kill yourself
"let Tlist_File_Fold_Auto_Close = 0 " Do not close tags for other files
"let Tlist_Enable_Fold_Column = 0 " Do not show folding tree

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Minibuf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:miniBufExplTabWrap = 1 " make tabs show complete (no broken on two lines)
let g:miniBufExplModSelTarget = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Matchit
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let b:match_ignorecase = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Perl
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let perl_extended_vars=1 " highlight advanced perl vars inside strings

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Select range, then hit :SuperRetab($width) - by p0g and FallingCow
function! SuperRetab(width) range
	silent! exe a:firstline . ',' . a:lastline . 's/\v%(^ *)@<= {'. a:width .'}/\t/g'
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"map <right> <ESC>:MBEbn<RETURN> " right arrow (normal mode) switches buffers  (excluding minibuf)
"map <left> <ESC>:MBEbp<RETURN> " left arrow (normal mode) switches buffers (excluding minibuf) 
"map <up> <ESC>:Sex<RETURN><ESC><C-W><C-W> " up arrow (normal mode) brings up a file list
"map <down> <ESC>:Tlist<RETURN> " down arrow  (normal mode) brings up the tag list
"map <A-i> i <ESC>r " alt-i (normal mode) inserts a single char, and then switches back to normal
"map <F2> <ESC>ggVG:call SuperRetab()<left>
"map <F12> ggVGg? " encypt the file (toggle)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocommands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufEnter * :syntax sync fromstart " ensure every file does syntax highlighting (full)
au BufNewFile,BufRead *.asp :set ft=aspjscript " all my .asp files ARE jscript
au BufNewFile,BufRead *.tpl :set ft=html " all my .tpl files ARE html
au BufNewFile,BufRead *.hta :set ft=html " all my .tpl files ARE html


""csuppot plugin.
"let g:C_AuthorName      = 'Yosi Izaq'    
"let g:C_AuthorRef       = 'Y.I.'                         
"let g:C_Email           = 'yytzhak@cisco.com, izaqyos@gmail.com'                    
"let g:C_Company         = 'Cisco, NMTG'     
"
""Python support
""au FileType python /cygdrive/d/Documents\ and\ Settings/yytzhak/.vim/plugin/python.vim 
"au FileType python /cygdrive/d/temp/python.vim 
"
""perl support plugin
"let g:Perl_AuthorName      = 'Yosi Izaq'     
"let g:Perl_AuthorRef       = 'YI'                         
"let g:Perl_Email           = 'yytzhak@cisco.com'            
"let g:Perl_Company         = 'Cisco, NMTG'    
"
""Latex suite plugin
"" REQUIRED. This makes vim invoke latex-suite when you open a tex file.
"filetype plugin on
"
"" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
"" can be called correctly.
"set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse latex-suite. Set your grep
" program to alway generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on


"I also like to bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>: 
":unmap <C-J>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual Cues
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showmatch " show matching brackets
set mat=5 " how many tenths of a second to blink matching brackets for
set nohlsearch " do not highlight searched for phrases
set incsearch " BUT do highlight as you type you search phrase
set ignorecase "set ic, ignore case in searches
"set hlsearch "highlight searched patterns
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$ " what to show when I hit :set list
"set lines=80 " 80 lines tall
"set columns=160 " 160 cols wide
set so=10 " Keep 10 lines (top/bottom) for scope
set novisualbell " don't blink
set noerrorbells " no noises
"Conventional status line:
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

"Map ctrl+s,e to add new entry to TOC based on following logic, take the previous entry and add 1 to the last digit
map <C-s><C-e> ?^\s*\(\d\+\.\)\+\d*<CR>0y/\d\+\.\?\zs\s<CR>``o<ESC>p0E<C-A>a<ESC>
"Map ctrl+s,i to add new entry to TOC based on following logic, take the previous entry and add .1 after the last digit
map <C-s><C-i> <ESC>ms?^\s*\(\d\+\.\)\+\d*<CR>Y<CR>`so<ESC>PI<TAB><ESC>Ea.1<ESC>WDo<ESC>
"add a tags: suffix to a section
nnoremap <C-s><C-t> :normal!  A, tags: <ESC>02Wy/,<ESC>$p<CR>

"Map ctrl-s+d to add [done] to end of line, this usefull for filling done status for
" p -> pending, o -> open, w - work in progress
map <C-s><C-d> A [Done]<esc>
map <C-s><C-p> A [Pending]<esc>
map <C-s><C-o> A [Open]<esc>
map <C-s><C-w> A [Work In Progress]<esc>
map <C-s><C-b> B [Blocked]<esc>

" "Maps for quoting a visuall selected text with ',", (), [] and {} 
" vnoremap qq <Esc>`>a'<Esc>`<i'<Esc>
" vnoremap q" <Esc>`>a"<Esc>`<i"<Esc>
" vnoremap q( <Esc>`>a)<Esc>`<i(<Esc>
" vnoremap q[ <Esc>`>a]<Esc>`<i[<Esc>
" vnoremap q{ <Esc>`>a}<Esc>`<i{<Esc>

"Maps for getting current time. t? in normal mode and ctrl+t in insert mode
map t? :echo 'Current time is ' . strftime('%c')<CR>
map! <C-t><C-t>	<C-R>=strftime('%c')<CR><Esc>
" The following command maps ctrl+d to insert the directory name of the current buffer:
inoremap <C-d> <C-R>=expand('%:p:h')<CR>

" Move up and down in autocomplete with <c-j> and <c-k> instead of default
" ctrl+n ctrl+p
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Useful abbrevs, abbreviations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"iab xasp <%@language=jscript%><CR><%<CR><TAB><CR><BS>%><ESC><<O<TAB>
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr> 
iab xasp <%@language=jscript%><CR><%<CR><TAB><CR><BS>%><ESC><<O<TAB>

" Java abbreviations
iab sop System.out.println()
"
" general abbreviations
iab cup can you please
iab lmk let me know
iab idk I don't know
iab ttl talk to you later
iab wip work in progress
iab gm good morning
iab thxy Thanks!<CR>Yosi
iab ty thank you
iab tyo thx!<CR>Yosi
iab izq izaqyos@gmail.com
iab izs yosi.izaq@sap.com
iab chy can't hear you
iab duk do you know
iab fml five minutes late

iab TY Thank You

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Useful abbrevs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" For recording
:nnoremap <space> @q

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Creating lists
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! ArrowList()
        let lineno = line(".")
        call setline(lineno, "    -> " . getline(lineno))
endfunction

function! NumberList() range
        "Set line numbers in front of lines
        let begining=line("'<")
        let ending=line("'>")
        let difsize = ending -begining +1
        let pre = ' ' 
        while (begining <= ending)
                if match(difsize, '^9*$') == 0
                        let pre = pre . ' ' 
                endif
                call setline(ending, pre . difsize . "\t" . getline(ending))
                let ending = ending-1
                let difsize = difsize-1
        endwhile
endfunction

" My personal menu
amenu &MyMenu.&HighlighCtxt       :match ToDo /^\s\+-\+>.*$/<cr>
amenu &MyMenu.&KBEntries          :match StatusLine /^\s*\d\+\..*$/<cr>
amenu &MyMenu.-SEP-      :   
amenu &MyMenu.&ArchiveBuffers     :silent bufdo !tar -rvf ~/temp/vim_archive.tar %:p<cr>
amenu &MyMenu.ArchiveModified&Buffers            :call Archive_all_modified_buffers()<cr>
amenu &MyMenu.-SEP1-      :   
amenu &MyMenu.&highlight          :set cursorline<cr>
amenu &MyMenu.highlight&V         :set cursorcolumn<cr>
amenu &MyMenu.-SEP2-      :   
vmenu &MyMenu.make&ArrowList              :call ArrowList()<cr>
vmenu &MyMenu.make&NumberList             :call NumberList()<cr>
amenu &MyMenu.-SEP3-      :   
amenu &MyMenu.Insert&FileLink             :s/^.*$/&\r<URL:[File Path]><cr>
amenu &MyMenu.InsertLocalLinkPattern     :s/^.*$/&\r<URL:#tn=[pattern in file]><cr>
amenu &MyMenu.InsertLocalLink             :s/^.*$/&\r<URL:#r=[put __id__ link to id=__id__]><cr>
amenu &MyMenu.-SEP4-      :   
amenu &MyMenu.&SetManualFold            :set foldmethod=manual<cr>
amenu &MyMenu.Set&SyntaxFold            :set foldmethod=syntax<cr>

" sap menu
amenu &SAP.&NewBLI       :   r/Users/i500695/.vim/snippets/SAP/KB_CF_BLI <cr>

amenu &MyMenu.&KBEntries          :match StatusLine /^\s*\d\+\..*$/<cr>
amenu &MyMenu.-SEP-      :   

"" My personal menu
"amenu &MyMenu.&HighlighCtxt       :match ToDo /^\s\+-\+>.*$/<cr>
"amenu &MyMenu.&KBEntries          :match StatusLine /^\s*\d\+\..*$/<cr>
"amenu &MyMenu.-SEP-      :   
"amenu &MyMenu.&ArchiveBuffers     :silent bufdo !tar -rvf ~/temp/vim_archive.tar %:p<cr>
"amenu &MyMenu.ArchiveModified&Buffers            :call Archive_all_modified_buffers()<cr>
"amenu &MyMenu.-SEP1-      :   
"amenu &MyMenu.&highlight          :set cursorline<cr>
"amenu &MyMenu.highlight&V         :set cursorcolumn<cr>
"amenu &MyMenu.-SEP2-      :   
"vmenu &MyMenu.make&ArrowList              :call ArrowList()<cr>
"vmenu &MyMenu.make&NumberList             :call NumberList()<cr>
"amenu &MyMenu.-SEP3-      :   
"amenu &MyMenu.Insert&FileLink             :s/^.*$/&\r<URL:[File Path]><cr>
"amenu &MyMenu.InsertLocalLinkPattern     :s/^.*$/&\r<URL:#tn=[pattern in file]><cr>
"amenu &MyMenu.InsertLocalLink             :s/^.*$/&\r<URL:#r=[put __id__ link to id=__id__]><cr>
"amenu &MyMenu.-SEP4-      :   
"amenu &MyMenu.&SetManualFold            :set foldmethod=manual<cr>
"amenu &MyMenu.Set&SyntaxFold            :set foldmethod=syntax<cr>
"amenu &MyMenu.-SEP5-      :   
"amenu &MyMenu.SetAcsMake            :set makeprg=makec\ %< <cr>
"amenu &MyMenu.SetSingleFileMake            :set makeprg=g++\ -g\ -O2\ -fPIC\ -o\ %.o\ -c\ % <cr>
"amenu &MyMenu.SetPBISmake            :set makeprg=make <cr>
"amenu &MyMenu.CDPBISmakePath           :cd /vob/nm_acs/pbis/cisco/build <cr>
"amenu &MyMenu.PBISmake            :make package <cr>
"amenu &MyMenu.SetDefaultMakeCurrDirFromRoot            :cd %:p:h <CR> :set makeprg=makec  <cr> : cd - <cr>

"" My ACS 5, linux develoment environment clearcase menu ; plus ISE svn
"amenu M&ySCMenu.CC_checkout       :! co % <cr>
"amenu M&ySCMenu.CC_checkin       :! ci % <cr>
"amenu M&ySCMenu.-SEP-      :   
"amenu M&ySCMenu.CC_version_tree       :! ct lsvtree -g % <cr>
"amenu M&ySCMenu.CC_diff_pred       :! ct diff -pred -graph % <cr>
"amenu M&ySCMenu.CC_diff_pred_txt       :! ct diff -pred -diff % <cr>
"amenu M&ySCMenu.-SEP1-      :   
"amenu M&ySCMenu.CC_checkin_all       :call CheckIn_all__buffers()<cr>
"amenu M&ySCMenu.CC_manually_set_tags_for_auto_complete       :set tags+=~/.vim/tags/acs_5/tags<cr>:set tags+=~/.vim/tags/cpp/tags<cr>
"amenu M&ySCMenu.-SEP2-      :   
"amenu M&ySCMenu.SVN_diff_pred       :! svn_diff % <cr>
"amenu M&ySCMenu.SVN_tkdiff_pred       :! svn_tkdiff % <cr>
"amenu M&ySCMenu.SVN_diff_act       :! svn_diff_M % <cr>
"amenu M&ySCMenu.SVN_change_set       :! svn_act % <cr>
"amenu M&ySCMenu.-SEP3-      :   
"
"" My ACS 5, c, c++ menu
"amenu My&Acs5Menu.list&Objects       :! cd %:h && find .. -name *.o <cr> 
"amenu My&Acs5Menu.list&SOsymbols       :! cd %:h && nm `find .. -name *.so ` \| less <cr>
"amenu My&Acs5Menu.-SEP-      :   
"amenu My&Acs5Menu.&compile       :make <cr>
"amenu My&Acs5Menu.c&lean       :make clean <cr>
"amenu My&Acs5Menu.cleanAndCompile       :make clean; make <cr>
"amenu My&Acs5Menu.cleanAndCompile&Project       :! mc; mist <cr>
"amenu My&Acs5Menu.&test       :make test <cr>
"amenu My&Acs5Menu.open&quickfix       :copen <cr>
"amenu My&Acs5Menu.clos&equickfix       :close <cr>

"Custom functions
function! Archive_all_modified_buffers()
    set hidden
    let archive=[]
    bufdo if &modified |  call add(archive, shellescape(expand("%"),1))| endif
    
    if len(archive) > 0
       exe "!tar -cvjf archive.tar.bz2 " . join(archive, " ")
    endif
endfunction

function! Perform_Shell_Test_all__buffers()
bufdo exe "!test -f " . expand("%") ."  > /dev/null"
    \ | if !v:shell_error
    \ | echo "passed"
    \ | endif
endfunction

function! CheckIn_all__buffers()
bufdo exe "!ct ls  " . expand("%") ." | grep -i checkedout > /dev/null"
    \ | if !v:shell_error
    \ | echo "file is checked out"
    \ | exe "!ci " . expand("%")
    \ | endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Frequently when I go to save with :w I am flying to fast and I type :W
" which gives me an obvious error.
"
" How can I map :W to :w ???
" How can I map :Q to :q ???
"
" I know there is :ZZ but I like the :w more.
"
:command! -bang W w<bang>
:command! -bang Q q<bang>
:command! -bang Wa wa<bang>
:command! -bang Qa qa<bang>


" Fast saving
nmap <leader>w :w!<cr>
" Fast save and quit current file
nmap <leader>q :wq!<cr>
" Fast save and quit all
nmap <leader><leader>q :wqa!<cr>
" Fast saving as utf8 to avoid conversion error
nmap <leader><leader>w :w! ++enc=utf8<cr>
" Fast increase/decrease window
nmap <leader>r :res+20<cr>
nmap <leader>f :res-20<cr>

"print date
nmap <leader>d :!date<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For UTL 3.x 
"--- Suggested mappings for most frequent commands  [id=suggested_mappings] [
"
nmap <unique> <Leader>ge :Utl openLink underCursor edit<CR>
nmap <unique> <Leader>gu :Utl openLink underCursor edit<CR>
nmap <unique> <Leader>gE :Utl openLink underCursor split<CR>
nmap <unique> <Leader>gS :Utl openLink underCursor vsplit<CR>
nmap <unique> <Leader>gt :Utl openLink underCursor tabedit<CR>
nmap <unique> <Leader>gv :Utl openLink underCursor view<CR>
nmap <unique> <Leader>gr :Utl openLink underCursor read<CR>

vmap <unique> <Leader>ge "*y:Utl openLink visual edit<CR>
vmap <unique> <Leader>gu "*y:Utl openLink visual edit<CR>
vmap <unique> <Leader>gE "*y:Utl openLink visual split<CR>
vmap <unique> <Leader>gS "*y:Utl openLink visual vsplit<CR>
vmap <unique> <Leader>gt "*y:Utl openLink visual tabedit<CR>
vmap <unique> <Leader>gv "*y:Utl openLink visual view<CR>
vmap <unique> <Leader>gr "*y:Utl openLink visual read<CR>


nmap <unique> <Leader>cfn :Utl copyFileName underCursor native<CR>
nmap <unique> <Leader>cfs :Utl copyFileName underCursor slash<CR>
nmap <unique> <Leader>cfb :Utl copyFileName underCursor backSlash<CR>

vmap <unique> <Leader>cfn "*y:Utl copyFileName visual native<CR>
vmap <unique> <Leader>cfs "*y:Utl copyFileName visual slash<CR>
vmap <unique> <Leader>cfb "*y:Utl copyFileName visual backSlash<CR>


nmap <unique> <Leader>cl :Utl copyLink underCursor<CR>

vmap <unique> <Leader>cl "*y:Utl copyLink visual<CR>

"]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" bye bye message
 au VimLeave * :call PrintAtExit()
   function! PrintAtExit()
       echo "Bye Yosi. Hope you had a good VIM session :) "
   endfun

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim_use,  enhanced #,*
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <special> \* yiW/<C-r>=escape(@", '^$*~[]\</>')<CR>
noremap <special> \# yiW?<C-r>=escape(@", '^$*~[]\</>')<CR>

"minibufexpl, \mbe \mc \mbt  ; open/close/toggle
map <Leader>mbe :MBEOpen<cr>
map <Leader>mbc :MBEClose<cr>
map <Leader>mbt :MBEToggle<cr>

"matchit 
:let b:match_words = '<:>,<tag>:</tag>,if:else'

"windows Tagbar ctags path
"let g:tagbar_ctags_bin = '/cygdrive/c/Users/212680136/Desktop/Yosi/Work/tools/ctags58/ctags.exe'
:let g:tagbar_ctags_bin = 'ctags'

" maximize current window by typing - in command mode. to restore previos
" windows layout press ctrl+w+=
nmap - :res<CR>:vertical res<CR>$
nmap + : <C-W><C-=>




"for large files
:let g:LargeFile = 1024

"
set rtp+=/usr/local/opt/fzf
set rtp+=/""
nmap <C-z> :FZF<CR>  

nmap <Leader>s = :setlocal spell spelllang=en_us<CR>$
set spell
set spell spelllang=en_us


"ag
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nmap <Leader>a :Ag<Space>

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec = 'python3'
let g:syntastic_python_checkers = ['python']
"syntastic

set encoding=utf-8

nmap <Leader>m :map<CR>

"color whitespaces
:highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match ExtraWhitespace /\s\+$\| \+\ze\t/

let g:UltiSnipsSnippetsDir        = $HOME.'/.vim/bundle/ultisnips/'
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsListSnippets="<c-h>"
"YCM:

let g:ycm_complete_in_comments = 1 
let g:ycm_seed_identifiers_with_syntax = 1 
let g:ycm_collect_identifiers_from_comments_and_strings = 1 
let g:ycm_clangd_binary_path='/opt/homebrew/opt/llvm/bin/clangd'
let g:ycm_server_python_interpreter='/opt/homebrew/bin/python3'
let g:ycm_log_level = 'debug'
"temporary, for mac arm silicon
let g:ycm_clangd_binary_path='/opt/homebrew/opt/llvm/bin/clangd'
"no confirmation popup
let g:ycm_confirm_extra_conf = 0


""ycm section, YouCompleteMe
""let g:clang_library_path='/Applications/Xcode.app/Contents/Frameworks/libclang.dylib/Applications/Xcode.app/Contents/Frameworks/libclang.dylib'
"let g:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'
"nnoremap <leader>y :let g:ycm_auto_trigger=0<CR>                " turn off YCM
"nnoremap <leader>Y :let g:ycm_auto_trigger=1<CR>                "turn on YCM 
"let g:ycm_autoclose_preview_window_after_completion=1 "close auto-complete window after completion
"map <leader>e  :YcmCompleter GoToDeclaration<CR> "\b goto declaration
""ycm section, YouCompleteMe
"
""snipmate
""" YouCompleteMe and UltiSnips compatibility, with the helper of supertab
"" (via http://stackoverflow.com/a/22253548/1626737)
"let g:SuperTabDefaultCompletionType    = '<C-n>'
"let g:SuperTabCrMapping                = 0
"let g:UltiSnipsExpandTrigger           = '<tab>'
"let g:UltiSnipsJumpForwardTrigger      = '<tab>'
"let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
"let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']
"let g:UltiSnipsSnippetsDir="~/.vim/bundle/vim-snippets/snippets"
"let g:UltiSnipsSnippetDirectories=["snippets", "UltiSnips"]
""imap <C-a> <Plug>snipMateNextOrTrigger
""smap <C-z> <Plug>snipMateNextOrTrigger
"
"no auto split lines
set formatoptions-=tc

" let g:vimspector_enable_mappings = 'HUMAN'
" let <leader>dd :call vimspector#Launch()<CR>
" let <leader>dx :call VimspectorReset<CR>
" let <leader>de :call VimspectorEval
" let <leader>dw :call VimspectorWatch
" let <leader>do :call VimspectorShowOutput
"

" auto close the completion window
let g:ycm_autoclose_preview_window_after_completion = 1
" only use the `Down` key to select the first item
let g:ycm_key_list_select_completion = ['<Down>']

" poppy (highlight parentheses - great for deep nested parentheses code blocks)
au! cursormoved * call PoppyInit()

"utilsnips
" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
set tags=tags

"disable codeium for work computer, to enable run :CodeiumEnable
augroup codeium_disable
  autocmd!
  autocmd VimEnter * CodeiumDisable
augroup END

