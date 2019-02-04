syntax on

set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'gnattishness/cscope_maps'
Plugin 'tpope/vim-commentary'
Plugin 'haya14busa/incsearch.vim'

Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'morhetz/gruvbox'
" Plugin 'ludovicchabant/vim-gutentags'
Plugin 'valloric/listtoggle'

" Plugin 'dhruvasagar/vim-table-mode'
" Plugin 'terryma/vim-multiple-cursors'
" Plugin 'mg979/vim-visual-multi'

Plugin 'christoomey/vim-tmux-navigator'
" Plugin 'tmux-plugins/vim-tmux-focus-events'
" Plugin 'roxma/vim-tmux-clipboard'

call vundle#end()            " required
filetype plugin indent on    " required

set number  " Show line numbers
set linebreak   " Break lines at word (requires Wrap lines)
set showbreak=+++   " Wrap-broken line prefix
"set textwidth=80   " Line wrap (number of cols)
set showmatch   " Highlight matching brace
set errorbells
"set visualbell  " Use visual bell (no beeping)
 
set hlsearch    " Highlight all search results
set smartcase   " Enable smart-case search
set ignorecase  " Always case-insensitive
set incsearch   " Searches for strings incrementally

set lazyredraw
 
set autoindent  " Auto-indent new lines
set cindent " Use 'C' style program indenting
set expandtab   " Use spaces instead of tabs
set shiftwidth=4    " Number of auto-indent spaces
set smartindent " Enable smart-indent
set smarttab    " Enable smart-tabs
set softtabstop=4   " Number of spaces per Tab
 
set laststatus=2
set ruler   " Show row and column ruler information
set wildmenu
set number
" set relativenumber
" set cursorline
set title
" set listchars=space:·
 
set undolevels=1000 " Number of undo levels
set backspace=indent,eol,start  " Backspace behaviour

"function HVX()
"        set et
"        set sw=4 ts=4 sts=4 tabstop=4 softtabstop=4
"endfunction
"nnoremap <leader>h :call HVX()<cr>

" Navigate buffers
":noremap <S-Left> <C-w>h
":noremap <S-Right> <C-w>l
":noremap <S-Down> <C-w>j
":noremap <S-Up> <C-w>k

"noremap <silent> <leader>t :CommandT<CR>
"noremap <silent> <leader>ts :CommandTTag<CR>
":nnoremap <C-p>j :cn<CR>
":nnoremap <C-p>k :cp<CR>
":nnoremap <C-p>o :copen<CR>
":nnoremap <C-p>c :cclose<CR>

" Quickfix toggle
let g:lt_quickfix_list_toggle_map = '`'
let g:lt_location_list_toggle_map = '<leader>`'
:nnoremap <leader>n :cn<CR>
:nnoremap <leader>p :cp<CR>

:nnoremap <C-g> :cs find g<Space><C-r><C-W>
:nnoremap <leader>g :Gg<Space><C-r><C-W>

" let g:rg_command = '
"   \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
"   \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
"   \ -g "!{.git,node_modules,vendor}/*" '

command! -bang -nargs=* R call fzf#vim#grep(g:rg_command .shellescape(<q-args>), <bang>0)
:nnoremap <leader>r :R<CR>

command! -bang -nargs=* F call fzf#vim#grep('git grep --line-number '.shellescape(<q-args>), <bang>0)
:nnoremap <leader>f :F<CR>
:nnoremap <leader>F :F<Space><C-r><C-W>

:noremap <leader>l :GFiles<CR>

" Fuzzy search tags in project
:nnoremap <leader>t :Tags<CR>
:nnoremap <leader>T :Tags<Space><C-R><C-W><CR>
" Fuzzy search tags in current buffer
:nnoremap <leader>b :BTags<CR>
:nnoremap <leader>B :BTags<Space><C-R><C-W><CR>

" :Commits, :BCommits, :Lines, :BLines
:noremap <leader>v :Commits<CR>
:noremap <leader>c :BCommits<CR>
:noremap <C-l> :BLines<CR>

" Highlight word under current curosr apperances
nnoremap <silent> * :let @/ = "\\<".expand("<cword>")."\\>"<cr>:set hlsearch! hlsearch?<CR>

" Save shortcuts
" :noremap <C-s> :w<CR>

" Search with highlighting
" map /  <Plug>(incsearch-forward)
" map ?  <Plug>(incsearch-backward)
" map g/ <Plug>(incsearch-stay)

" hi Search cterm=NONE ctermfg=white ctermbg=darkblue

set noswapfile

" Color scheme
set t_Co=256
set background=dark
" colorscheme molokai
" colorscheme apprentice
" colorscheme peachpuff
colorscheme gruvbox

" Do not try connecting to the X server
" set clipboard=exclude:.*
set clipboard=unnamedplus

" Show characters exceeding column 80
" :au BufWinEnter *.c,*.h let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)

" GitGutter
set updatetime=300

" nnoremap <Tab> >>_
" nnoremap <S-Tab> <<_
" inoremap <S-Tab> <C-d>
" vnoremap <Tab> >gv
" vnoremap <S-Tab> <gv
" nnoremap <C-I> <Tab>

" vnoremap <silent> ,y y:new<CR>:call setline(0,getregtype())<CR>o<Esc>P:wq!~/reg.txt<CR>
" nnoremap <silent> ,y :new<CR>:call setline(1,getregtype())<CR>o<Esc>P:wq!~/reg.txt<CR>
" noremap <silent> ,p :sview ~/reg.txt<CR>"zdddG:q!<CR>:call setreg('"', @",@z)<CR>p
" noremap <silent> ,P :sview ~/reg.txt<CR>"zdddG:q!<CR>:call setreg('"', @",@z)<CR>P

" let g:multi_cursor_exit_from_insert_mode = 0
" :autocmd ColorScheme * runtime autoload/multiple_cursors.vim
" :autocmd ColorScheme * hi multiple_cursors_cursor term=reverse cterm=reverse gui=reverse


" nnoremap <C-@> :NERDTreeToggle<CR>

" let g:autotagTagsFile="tags"

"function! DeleteInactiveBufs()
"    "From tabpagebuflist() help, get a list of all buffers in all tabs
"    let tablist = []
"    for i in range(tabpagenr('$'))
"        call extend(tablist, tabpagebuflist(i + 1))
"    endfor

"    "Below originally inspired by Hara Krishna Dara and Keith Roberts
"    "http://tech.groups.yahoo.com/group/vim/message/56425
"    let nWipeouts = 0
"    for i in range(1, bufnr('$'))
"        if bufexists(i) && !getbufvar(i,"&mod") && index(tablist, i) == -1
"        "bufno exists AND isn't modified AND isn't in the list of buffers open in windows and tabs
"            silent exec 'bwipeout' i
"            let nWipeouts = nWipeouts + 1
"        endif
"    endfor
"    echomsg nWipeouts . ' buffer(s) wiped out'
"endfunction
"command! Bdi :call DeleteInactiveBufs()

" Git long lines
au FileType gitcommit set tw=72

" vnoremap <C-c> :w !xclip -i -sel c<CR><CR> 
