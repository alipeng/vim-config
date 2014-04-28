"basic
syntax enable
set nocompatible
set backspace=2
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set cindent
set number
set showmatch
set mouse=a
set ruler
set showcmd
set incsearch
set sidescroll=1
set whichwrap=b,s,<,>,[,]
set foldmethod=marker
set smartindent
set tabstop=4
set ai!
set cindent shiftwidth=4
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin
set cursorline
set cursorcolumn
set cmdheight=2
set hlsearch
set ignorecase
set history=100
set wrap
set shortmess=atI
setlocal noswapfile
set bufhidden=hide
set laststatus=2 
set statusline=
set statusline+=%2*%-3.3n%0*\ " buffer number
set statusline+=%f\ " file name
set statusline+=%h%1*%m%r%w%0* " flag
set statusline+=[
if v:version >= 600
    set statusline+=%{strlen(&ft)?&ft:'none'}, " filetype
    set statusline+=%{&fileencoding}, " encoding
endif
set statusline+=%{&fileformat}] " file format
set statusline+=%= " right align
set statusline+=0x%-8B\ " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P " offset
if filereadable(expand("$VIM/vimfiles/plugin/vimbuddy.vim"))
    set statusline+=\ %{VimBuddy()} " vim buddy
endif
set wildmenu
set nobackup
set noswapfile
set nowritebackup
set showmatch
set formatoptions+=mM
set bsdir=buffer
set autochdir
hi link phpheredoc string
set hidden
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/nerdtree.git'
Bundle 'altercation/vim-colors-solarized'
Bundle 'plasticboy/vim-markdown'

Bundle 'taglist.vim'
Bundle 'L9'
Bundle 'ctrlp.vim'
Bundle 'Command-T'
Bundle 'snipMate'

Bundle 'Markdown'
Bundle 'Markdown-syntax'

Bundle 'Conque-Shell'
Bundle 'c.vim'

"JavaScript && jQuery
Bundle 'vim-coffee-script'
Bundle 'JavaScript-syntax'
Bundle 'jQuery'
Bundle 'jsbeautify'
Bundle "pangloss/vim-javascript"

"html
Bundle 'othree/html5.vim'

Bundle 'groenewege/vim-less'
Bundle 'skammer/vim-css-color'

"above the Vim UI
"""""""""""""""""""""""""""""""
Bundle 'winmanager'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'taglist.vim'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'bufexplorer.zip'
"Make gvim-only colorschemes work transparently in terminal vim
"Bundle 'CSApprox' 

"AutoComplete
""""""""""""""""""""""""""""""""
Bundle 'AutoComplPop'
Bundle 'Pydiction'
Bundle 'Shougo/neocomplcache'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/snipmate-snippets'
Bundle 'spf13/snipmate-snippets'
Bundle 'garbas/vim-snipmate'

Bundle 'ZenCoding.vim'
let g:user_zen_expandabbr_key='<C-u>'

"Bundle 'word_complete.vim'
Bundle 'closetag.vim'

"PHP 
"press K on a function for full PHP manual
Bundle 'spf13/PIV'
Bundle 'php.vim-html-enhanced'

"Tools
""""""""""""""""""""""""""""""
Bundle 'udonmai/Conque-Shell'
Bundle 'grep.vim'
Bundle 'vim-flake8'

filetype plugin indent on

"solarized
set t_Co=16
set background=dark
let g:solarized_termtrans = 1
colorscheme solarized

"powerline
set laststatus=2
let g:Powerline_symbols = 'unicode'
"let g:Powerline_symbols = 'fancy'

"taglist
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1
let Tlist_GainFocus_On_ToggleOpen = 1

"markdown-mode
let g:vim_markdown_folding_disabled=1

"keymap
let mapleader = ','
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>t :TlistToggle<CR>
nnoremap <leader>c :CtrlP<CR>
if has("multi_byte")
    " When 'fileencodings' starts with 'ucs-bom', don't do this manually
    "set bomb
    set fileencodings=ucs-bom,utf-8,chinese,taiwan,japan,korea,latin1
    " CJK environment detection and corresponding setting
    if v:lang =~ "^zh_CN"
        " Simplified Chinese, on Unix euc-cn, on MS-Windows cp936
        set encoding=chinese
        set termencoding=chinese
        if &fileencoding == ''
            set fileencoding=chinese
        endif
    elseif v:lang =~ "^zh_TW"
        " Traditional Chinese, on Unix euc-tw, on MS-Windows cp950
        set encoding=taiwan
        set termencoding=taiwan
        if &fileencoding == ''
            set fileencoding=taiwan
        endif
    elseif v:lang =~ "^ja_JP"
        " Japanese, on Unix euc-jp, on MS-Windows cp932
        set encoding=japan
        set termencoding=japan
        if &fileencoding == ''
            set fileencoding=japan
        endif
    elseif v:lang =~ "^ko"
        " Korean on Unix euc-kr, on MS-Windows cp949
        set encoding=korea
        set termencoding=korea
        if &fileencoding == ''
            set fileencoding=korea
        endif
    endif
    " Detect UTF-8 locale, and override CJK setting if needed
    if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
        set encoding=utf-8
    endif
else
    echoerr 'Sorry, this version of (g)Vim was not compiled with "multi_byte"'
endif

set diffexpr=MyDiff()
function! MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"PHP functions
au FileType php setlocal dict+=~/.vim/funclist
if !exists('g:AutoComplPop_Behavior')
    let g:AutoComplPop_Behavior = {}
    let g:AutoComplPop_Behavior['php'] = []
    call add(g:AutoComplPop_Behavior['php'], {
    \ 'command' : "\\",
    \ 'pattern' : printf('\(->\|::\|\$\)\k\{%d,}$', 0),
    \ 'repeat' : 0,
    \})
endif
