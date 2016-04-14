execute pathogen#infect()
syntax on
filetype plugin indent on
set nocompatible              " be iMproved, required
filetype off                  " required

let mapleader = "," "Used as a prefix to let you namespace arbitrary commands
syntax enable "Syntax highlighting
set number    "Line numbering
set vb        "Flashes screen on errors
set hlsearch  "Highlights search terms
set incsearch
set ignorecase

"A bunch of indentation stuff.
set smartindent    "Be smart about indenting (esp. C-like languages)
set autoindent     "Open lines at same indentation level
set expandtab      "Automatically turn TABs into 'tabstop' spaces
set tabstop=4      "1 tab = 4 spaces
set shiftwidth=4   "Shift operators move 4 spaces at a time
set softtabstop=4  "Among other things, this causes <BS> to go back 4 spaces
" set listchars+=tab:>-
" set list

set textwidth=76   "Exactly what it sounds like
set wildmenu       "For helpful tab completion on say, :vsp <PATH_PREFIX>
set mouse=a        "Allows the use of the mouse in all modes. Not useful in Mac Terminal
set cursorline     "Highlights/underlines the current line
set ruler          "Shows the cursor position in bottom right
"set cc=0         "Draw a bar at 80 characters
set backspace=indent,eol,start "Fixes super weird backspace problem
set nospell

set bg=dark
set t_Co=256
" colorscheme molokai
colorscheme pride


filetype on "Enable filetype detection
filetype plugin on "Enables filetype-specific plugins
filetype plugin indent on "Tries to fix indenting of # comments
au! FileType python setl nosmartindent

"Remembers where the cursor left off for each file
autocmd BufReadPost *.*
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

"Some sort of hack to get the above to work
au BufWinLeave *.* mkview
au BufWinEnter *.* silent loadview

map <C-N>  <esc>:NERDTreeToggle<CR>
nmap <space> zz
nmap <C-H> <C-W>h
nmap <C-L> <C-W>l
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-P> <C-W>k
"Note that <CR> is used for ENTER
imap <leader>wq <esc>:wq<CR>

" Quit all windows. Helpful esp. in Git Diff
map <F2> <esc>:qall<CR>

" Toggle line wrapping.
map <leader>w <esc>:set wrap!<CR>
map <leader>e <esc>:set expandtab!<CR>

" Toggle cursorline
map <leader>cl <esc>:set cursorline!<CR>
":inoremap # X#  "Note that ^H is entered with Ctrl-V Ctrl-H

"Open .pde files as C-type files
au BufNewFile,BufRead *.pde set filetype=cpp
au BufNewFile,BufRead *.ftl set filetype=ftl
au BufNewFile,BufRead *.md  set filetype=markdown
au BufNewFile,BufRead *.tag  set filetype=javascript
au BufNewFile,BufRead *.hbs  set filetype=html

"Some custom colors
" hi Visual ctermfg=Black
" hi Visual ctermbg=Yellow
" hi clear CursorLine
" hi CursorLine ctermbg=8
" hi Pmenu cterm=bold,reverse ctermfg=0 ctermbg=15
" hi PmenuSel term=reverse ctermfg=15 ctermbg=9
" hi LineNr ctermfg=8
"hi Normal ctermfg=White

" hi Pmenu cterm=bold,reverse ctermfg=7 ctermbg=15
hi clear Pmenu
hi clear PmenuSel
hi link Pmenu TabLineFill
hi link PmenuSel ColorColumn
hi clear Folded
hi link Folded Conceal
" term=standout cterm=bold ctermfg=8 ctermbg=1 guifg=White guibg=Red
hi Search    cterm=bold ctermfg=236 ctermbg=227
hi IncSearch cterm=bold ctermbg=236 ctermfg=227
hi MatchParen ctermbg=202
hi PanelHighlight ctermfg=11

" Some customizations to the vim-signature plugin to make the colors look
" better with the solarized color scheme.
hi clear SignColumn
let g:SignatureMarkerTextHL = "Special"
" let g:SignatureMarkTextHL = "helpNote"

vnoremap <silent> <leader>a :LiveEasyAlign<CR>
nmap <leader>gw :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
inoremap jk <esc>
inoremap kj <esc>
let b:dispatch = 'brazil-build -Dminify=false -Daan=advertising-dev-na-6019.iad6.amazon.com/aan'
nmap gn :bn<cr>
nmap gp :bp<cr>
nmap gd :bd<cr>

" autocmd FileType markdown inoremap ---- <esc>yypVr-o
" autocmd FileType markdown inoremap ==== <esc>yypVr=o

autocmd FileType javascript noremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call RangeCSSBeautify()<cr>
set fileencodings=ucs-bom,utf-8,sjis,default

let g:vim_pbcopy_host = "mac-laptop"

command! -nargs=1 Ss let @/ = <q-args>

" autocmd VimEnter * echom "hi this is vim enter from .vimrc"

" inoremap ( ()<esc>:let leavechar=")"<CR>i
" inoremap [ []<esc>:let leavechar="]"<CR>i
" inoremap { {}<esc>:let leavechar="}"<CR>i

" inoremap ) <esc>/)<cr>:let @/=""<cr>a
" inoremap ] <esc>/]<cr>:let @/=""<cr>a
" inoremap } <esc>/}<cr>:let @/=""<cr>a

let g:ctrlp_custom_ignore = 'DS_Store\|git\|server.crt\|server.key\|dist\|bower_components\|less.css\|coffee.js\|js.map\|hbs.js'
if len(matchstr(getcwd(), "cms-ui-article"))
    " Ignore node_modules, unless this is the ShazamTemplates workspace, in
    " which case I want to be able to search node_modules
    " let g:ctrlp_custom_ignore = g:ctrlp_custom_ignore . '\|node_modules'

    " Do not expand tabs with spaces :(
    set noexpandtab
endif


" vim-multiple-cursor customization
" let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_start_key = '<F9>'
set laststatus=2
nnoremap <leader>t :TagbarToggle<cr>

" set shell=/bin/zsh\ -i " the -i apparently lets you use shell aliases with :! commands

" Open the Gstatus window, move to it, move it to the far left full height,
" go back to original calling window
" [N]gs is normally sleep for N seconds. Who needs that?
nnoremap gs :Gstatus<cr>:wincmd P<cr>:wincmd H<cr>
nnoremap gco :Gcommit<cr>
" ge is normally backwards to end of word
nnoremap ge :!screen -r<cr>

" Copy the whole document. Don't use noremap in order to preserve cy mapping
" from vim-pbcopy
nmap cd mzggcyG'z
nnoremap gh :StartExecutingHooks<cr>:ExecuteHookFiles BufWritePost<cr>:StopExecutingHooks<cr>
nnoremap ghl :StartExecutingHooks<cr>:ExecuteHookFiles VimLeave<cr>:StopExecutingHooks<cr>
nnoremap gd <esc>/<<<<<<<.HEAD\\|=======\\|>>>>>>><cr>
let g:vim_code_browser_url_handler_command = "ssh mac-laptop xargs open"

" Tell :Ag to ignore node_modules and to mimick vimgrep's output
" For some reason :Ag isn't ignore node_modules even though it's in
" .gitignore. Alias it this way to force this behavior.
" let g:ag_prg="ag --coffee --js --css --html --ignore node_modules --path-to-agignore ~/.agignore --vimgrep"

" vim-coffee-script configuration
" https://github.com/kchmck/vim-coffee-script#coffee_compile_vert
let coffee_compile_vert = 1 " open in vertical split

" Speed up CtrlP
" http://stackoverflow.com/questions/21346068/slow-performance-on-ctrlp-it-doesnt-work-to-ignore-some-folders
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_user_command = 'find %s -type f | egrep -v "\.kitchen|node_modules/|\.idea/|\.git/|\.cache/|.coffee.js$|js.map$|hbs.js$"'
