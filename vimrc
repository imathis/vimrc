" ---------------------------------------------------------------------------
"  Pathogen initialization
" ---------------------------------------------------------------------------
filetype off
call pathogen#runtime_append_all_bundles()    " using pathogen for a bunch of plugins
filetype plugin indent on                     " load filetype plugin
call pathogen#helptags()

" ---------------------------------------------------------------------------
"  General
" ---------------------------------------------------------------------------
set nocompatible
let mapleader = ","
set history=1000                              " lots of command line history
set viminfo='10,\"100,:20,%,n~/.viminfo       " remember certain things when we exit
set autoread                                  " reload files changed outside of Vim
set nrformats=                                " improves incrementing when there are leading 0's.
set cpo+=J                                    " sentences are followed by 2 spaces.
cmap w!! w !sudo tee % >/dev/null             " sudo & write, if you forget to sudo first

" ----------------------------------------------------------------------------
"  UI
" ----------------------------------------------------------------------------
set ruler                             " show the cursor position all the time
set backspace=start,indent,eol        " allow backspacing over anything in insert mode
set wm=2                              " wrap margin on the right
set scrolloff=2                       " keep some context when scrolling
set nowrap                            " do not wrap lines
set antialias                         " of course
set guifont=source\ code\ pro:h14
" Theme
set background=dark
colorscheme solarized

" ----------------------------------------------------------------------------
"  Visual cues
" ----------------------------------------------------------------------------
set incsearch                   " do incremental searching
set laststatus=2                " always show the status line
set nohlsearch                  " don't highlight searches
set visualbell                  " quiet
set noerrorbells                " quiet
set number                      " show line numbers
set showcmd                     " show size of visual selection
set wildmenu                    " show possible matches for command completions using tab
set wildmode=list:longest,full  " full list using common string. Then full complete.
syntax enable

" ----------------------------------------------------------------------------
"  Tabs
" ----------------------------------------------------------------------------
set tabstop=4
set softtabstop=2          " yep, two
set shiftwidth=2
set nosmarttab             " no tabs, thanks.
set autoindent             " automatically indent new lines
set expandtab              " expand tabs to spaces

" ----------------------------------------------------------------------------
"  Wrapping
" ----------------------------------------------------------------------------
set linebreak              " wrapping preserves words.
" toggle word wrap
nnoremap <leader>w :set wrap! wrap?<cr>
" Set default wrapping based on file type
autocmd FileType md,markdown,html setlocal wrap linebreak nolist

" ----------------------------------------------------------------------------
"  Backups
" ----------------------------------------------------------------------------
set nobackup                           " do not keep backups after close
set nowritebackup                      " do not keep a backup while working
set noswapfile                         " don't keep swp files either
set backupdir=~/.vim/backups           " store backups under ~/.vim/backup
set backupcopy=yes                     " keep attributes of original file
set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
set directory=~/.vim/tmp               " where to keep swp files

" ----------------------------------------------------------------------------
"  Searching
" ----------------------------------------------------------------------------
set ignorecase              " make searches case insensitive
set smartcase               " care about case sensitivity if there's a capital letter
set incsearch               " do incremental searching
set nohlsearch              " don't highlight searches

" Ack mappings
nmap <leader>a :Ack<space>
nmap <leader>A :Ack<space><cword><CR>
vmap <leader>A "ry:Ack<space>"<C-r>r"<CR>

" ---------------------------------------------------------------------------
"  Navigation
" ---------------------------------------------------------------------------
" Navigate wrapped lines with cmd+[jk460]
vmap <D-j> gj
vmap <D-k> gk
vmap <D-4> g$
vmap <D-6> g^
vmap <D-0> g^
nmap <D-j> gj
nmap <D-k> gk
nmap <D-4> g$
nmap <D-6> g^

" Navigate between windows
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l

" move window split position
nnoremap <C-W>H <C-A-H>
nnoremap <C-W>J <C-A-J>
nnoremap <C-W>K <C-A-K>
nnoremap <C-W>L <C-A-L>

" ---------------------------------------------------------------------------
"  Netrw
" ---------------------------------------------------------------------------
let g:netrw_list_hide='\(^\|\s\s\)\zs\.\S\+'      " hide dot files
nnoremap <leader>e :execute 'e .'<CR>
nnoremap <leader>E :execute 'E'<CR>
nnoremap <leader><leader>e :vsp .<CR>
nnoremap <leader><leader>E :Ve<CR>

" ---------------------------------------------------------------------------
"  Command-T
" ---------------------------------------------------------------------------
let g:CommandTMaxHeight=30

nnoremap <leader>f :CommandT<CR>
nnoremap <leader>F :CommandTFlush<CR>:CommandT<CR>

" Command-T of the directory of the current file
nmap <leader>gf :CommandT %%<cr>
set wildignore+=vendor/plugins/**,vendor/linked_gems/**,vendor/gems/**,vendor/ruby/**,vendor/cache/**,coverage/**,tmp/sass-cache/**,_assets/**,_cache/**,_deploy/**,public/**,sass.old/**,source.old/**

" ---------------------------------------------------------------------------
" Misc Mappings
" ---------------------------------------------------------------------------

" Shortcut to make splits
nnoremap <leader>s :sp<cr><C-w>j
nnoremap <leader>v :vsp<cr><C-w>l
nnoremap <leader>t :tabnew<CR>

" Move line up or down
nnoremap <D-J> ddp==
nnoremap <D-K> ddkkp==

" Allow multiple pastes of the same content when pasting in visual mode.
vnoremap p pgvy

" Yank to end of line
nnoremap Y y$

" Emacs bindings in command line mode
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Delete the line below/above the current cursor position
nnoremap do jddk^
nnoremap dO kdd^

" Easier to get to the end of the line
noremap gl g_

" Easier to get to the first non-blank character of the line
noremap gh ^

" Switch between the last 2 files
nnoremap go <c-^>

" Toggle spell check
nnoremap <leader>p :set spell! spell?<cr>
set spelllang=en_us

" Strip trailing whitespace
nnoremap <leader><space> :%s/\s\+$//e<CR>

" Edit vimrc
nmap <leader><leader>v :sp ~/.vimrc<CR><C-W>_
nmap <leader><leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
" Edit Gemfile
nnoremap <leader><leader>g :e Gemfile<cr>

" Visually select the text that was last edited/pasted
nmap gV `[v`]

" Resize windows
nmap <C-Left> <C-W><<C-W><
nmap <C-Right> <C-W>><C-W>>
nmap <C-Up> <C-W>+<C-W>+
nmap <C-Down> <C-W>-<C-W>-

" Substitution
nmap <leader>r :%s/<C-r><C-w>/
vmap <leader>r "ry:%s/<C-r>r/

" Show trailing whitespace with ,4
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>4 :set nolist!<CR>

" Scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Set options if a gui is running
if has("gui_running")
  set guioptions+=TlRLrb
  set guioptions-=TlRLrb
endif

" ---------------------------------------------------------------------------
"  Status line customization
" ---------------------------------------------------------------------------
set statusline=
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " filename
set statusline+=%h%m%r%w                     " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
set statusline+=%=                           " right align remainder
set statusline+=%-14(%l,%c%V%)               " line, character
set statusline+=%<%P                         " file position
set statusline=

" ---------------------------------------------------------------------------
"  Persistent undo
" ---------------------------------------------------------------------------
if v:version >= 703    " Only available in Vim 7.3 or greater
  set undofile
  set undodir=~/.vim/.undo
endif

" ---------------------------------------------------------------------------
"  custom commands - use these at the : command prompt
" ---------------------------------------------------------------------------

" Forgot to `sudo vim`.  This saves the file anyway.
command! SudoWrite w !sudo tee %

" ---------------------------------------------------------------------------
"  Buffers
" ---------------------------------------------------------------------------

" Restore cursor position
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

set hidden                                    " Let me leave buffers even when they're changed.

" ---------------------------------------------------------------------------
"  Recognize files with no extensions
" ---------------------------------------------------------------------------
autocmd BufRead,BufNewFile Gemfile set filetype=ruby
autocmd BufRead,BufNewFile Guardfile set filetype=ruby
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.jst set filetype=html
autocmd BufRead,BufNewFile *.handlebars set filetype=html
