" Use Vim settings, rather then Vi settings. This setting must be as early as possible, as it has side effects.
set nocompatible

" Highlight current line
set cursorline cursorcolumn

" Leader
let mapleader=";"

" " 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" " 设置快捷键将系统剪贴板内容粘贴至 vim
nmap <Leader>p "+p
" " 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" " 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
" " 定义快捷键保存所有窗口内容并退出 vim
nmap <Leader>WQ :wa<CR>:q<CR>
" " 不做任何保存，直接退出 vim
nmap <Leader>Q :qa!<CR>
" " 定义快捷键在结对符之间跳转
nmap <Leader>M %

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autoread      " 当前文件被改动时候自动载入
set autowrite     " Automatically :write before running commands
set confirm       " Need confrimation while exit
set ignorecase    " 搜索忽略大小写
" 可以在buffer的任何地方使用鼠标
set mouse=a
set selectmode=mouse,key
" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
set fileencodings=utf-8,gb18030,gbk,big5
set guifont=h18  "字体和大小

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

filetype plugin indent on

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Cucumber navigation commands
  autocmd User Rails Rnavcommand step features/step_definitions -glob=**/* -suffix=_steps.rb
  autocmd User Rails Rnavcommand config config -glob=**/* -suffix=.rb -default=routes

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80
augroup END

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Color scheme
colorscheme molokai
highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Numbers
set number
set numberwidth=5

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Index ctags from any project, including those outside Rails
map <Leader>ct :!ctags -R .<CR>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" vim-rspec mappings
nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>l :call RunLastSpec()<CR>

" Run commands that require an interactive shell
nnoremap <Leader>r :RunInInteractiveShell<space>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]

autocmd Syntax javascript set syntax=jquery " JQuery syntax support

set matchpairs+=<:>
set statusline+=%{fugitive#statusline()} "  Git Hotness

" Nerd Tree
let NERDChristmasTree=0
let NERDTreeWinSize=35
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"
autocmd vimenter * if !argc() | NERDTree | endif " Automatically open a NERDTree if no files where specified
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif " Close vim if the only window left open is a NERDTree
nmap <F5> :NERDTreeToggle<cr>

" Emmet
let g:user_emmet_mode='i' " enable for insert mode

" Search results high light
set hlsearch

" nohlsearch shortcut
nmap -hl :nohlsearch<cr>
nmap +hl :set hlsearch<cr>

" Javascript syntax hightlight
syntax enable

" ctrap
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux"
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" nnoremap <leader>w :w<CR>
" nnoremap <leader>q :q<CR>

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Vim-instant-markdown doesn't work in zsh
set shell=bash\ -i

" Snippets author
let g:snips_author = 'Yuez'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""新文件标题""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
      "如果文件类型为.sh文件 
      if &filetype == 'sh' 
          call setline(1,"\#########################################################################") 
          call append(line("."), "\# File Name: ".expand("%")) 
          call append(line(".")+1, "\# Author: wangyanan") 
          call append(line(".")+2, "\# mail: xxx@163.com") 
          call append(line(".")+3, "\# Created Time:.strftime("%c")) 
          call append(line(".")+4, "\#########################################################################") 
          call append(line(".")+5, "\#!/bin/bash") 
          call append(line(".")+6, "") 
      else 
          call setline(1, "/*************************************************************************") 
          call append(line("."), "    > File Name: ".expand("%")) 
          call append(line(".")+1, "    > Author: wangyanan") 
          call append(line(".")+2, "    > Mail: wangyanan@pajk.cn ") 
          call append(line(".")+3, "    > Created Time: ".strftime("%c")) 
          call append(line(".")+4, " ************************************************************************/") 
          call append(line(".")+5, "")
      endif
      if &filetype == 'cpp'
          call append(line(".")+6, "#include<iostream>")
          call append(line(".")+7, "using namespace std;")
          call append(line(".")+8, "")
      endif
      if &filetype == 'c'
          call append(line(".")+6, "#include<stdio.h>")
          call append(line(".")+7, "")
      endif
      "新建文件后，自动定位到文件末尾
      autocmd BufNewFile * normal G
  endfunc 

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
