"Vundle basic configs"
"{
    set nocompatible " be iMproved
    filetype off     " required!

    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()

    " let Vundle manage Vundle
    " required! 
    Bundle 'gmarik/vundle'
    filetype plugin indent on     " required!
     "
     " Brief help
     " :BundleList          - list configured bundles
     " :BundleInstall(!)    - install(update) bundles
     " :BundleSearch(!) foo - search(or refresh cache first) for foo
     " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
     "
     " see :h vundle for more details or wiki for FAQ
     " NOTE: comments after Bundle command are not allowed.
"}


"Plugins

" Snippets
Bundle "https://github.com/msanders/snipmate.vim.git"


"code Refactoring
"Bundle "https://github.com/klen/rope-vim.git"
    "let ropevim_enable_shortcuts = 0
    "let ropevim_global_prefix = 'Rp'
    "let ropevim_local_prefix = 'Rr'


" A better grep.
Bundle "ack.vim"


"shell in Vim
Bundle "https://github.com/rosenfeld/conque-term"
    " Insert mode when entering buffer
    let g:ConqueTerm_InsertOnEnter = 0
    map <F11> ConqueTermTab bash
    "Keep updating terminal buffer
    let g:ConqueTerm_ReadUnfocused = 1

"taglist"
Bundle 'taglist.vim'
    
    let Tlist_Close_On_Select = 1
    "一直更新tags
    let Tlist_Process_File_Always=1 
    "解决提示：Tlist_Refresh_Folds错误
    function! s:Tlist_Refresh_Folds()

    " Not needed when one file is displayed.
    if g:Tlist_Show_One_File
    return
    endif

    let winnum = bufwinnr(g:TagList_title)
    if winnum == -1
    return
    endfunction

"rich text support"
Bundle 'Txtfmt-The-Vim-Highlighter'
    "let g:txtfmt-'conceal' = 'n'
    let g:concealcursor = 'i'
    " Set up detection for Txtfmt files 
    au! filetypedetect BufRead,BufNewFile *.dat    setfiletype txtfmt

" General Settings -------------------------------------------------------
    " Share the clipboard.
    "set clipboard+=unnamed

    "leaders
    " Comma is easier to access than backslash.
    let mapleader = ','

    " Semicolon is second-easier to type than backslash.
    let maplocalleader = ';'

    " Page on extended output.
    set more
    
    "whatch for external changes
    au CursorHold * checktime
    set complete-=i
    set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1 
    set encoding=utf-8 
    "set termencoding=cp936 
    set termencoding=utf-8
    language messages zh_CN.UTF-8 

    set nocompatible
    source $VIMRUNTIME/vimrc_example.vim
    "using windows fashion, C-c,C-v, etc
    source $VIMRUNTIME/mswin.vim
    behave mswin

    set diffexpr=MyDiff()
    function MyDiff()
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



"MY own lzh-----------------------------------------------------------------------------

"apperence----------------------------------------------------------
    "设置文件编码
    "命令行高度
    set foldmethod=indent
    " Do not nest more than 4 folds.
    set foldnestmax=4
    set cmdheight=1
    filetype plugin on 

    " 启用鼠标  
    set mouse=a 
    " 侦测文件类型
    "filetype on  this need closed because of vundle
    " 为特定文件类型载入相关缩进文件
    filetype indent on
    "为win32用户所用，调用所用
    set shellslash
    " 不要备份文件（根据自己需要取舍）
    set nobackup

    "关闭工具栏
    set guioptions-=T
    "关闭menu bar
    "set guioptions-=m 
    colo desert 
    "搜索时忽略大小写
    set ignorecase

    "set guifont=Consolas:h11.8

    if has("gui_running")
      if has("gui_gtk2")
        set guifont=Monospace\ 14
      elseif has("gui_win32")
        set guifont=Consolas:h12:cANSI
      elseif has("gui_win64")
        set guifont=Consolas:h14:cANSI
      endif
    endif

    set guifont=Monospace\ 14
"config
    set wildignorecase


"data, dat file set up"
au! BufRead,BufNewFile *.dat set wrap

"mappings ------------------------------------------------------
    " Faster ESC.
    inoremap jk <ESC>:update<cr>
    inoremap kj <ESC>:update<cr>
    inoremap <C-i> <Esc>:update
    inoremap <C-space> <Esc>:update

    imap <C-e> <Esc>:update<cr>
    map <C-e> <Esc>:update<cr>
    map <F5> :update<bar>!/usr/bin/python % 
    imap <C-space> <Esc>
    map <C-w> ZZ 
    map <C-s> :update<ESc>h 
    map <C-minus> :split
    "map i a
    map p <Esc>   "禁用p
    map u <Esc>  "禁用undo
    map o <Esc> "禁用o
    map W b
    map <C-t>  :tabnew<cr>
    "map <F6> :tabnext<CR>
    imap <C-s>  <Esc><C-s>
    imap <C-c>  <Esc><C-c><Esc>
    "map <c-c> <c-c>:w<CR>a
    map j gj
    map k gk

    map <Up> gk
    map <Down> g<Down>
    map <Home> g<Home>
    map <End> g<End>
    set nowrap


    map <C-space> <Plug>IMAP_JumpForward
    let g:Imap_UsePlaceHolders=0
    map <C-k> 6k
    let g:C_Ctrl_j = 'off'
    map <C-j> 6j
    map <C-l> 8l
    map <C-h> 8h
    "在插入模式下移动光标
    "set winaltkeys=no
    "map <m-h> <Left>
    "map <m-j> <Down>
    "map <m-k> <Up>
    "map <m-l> <Right>
    ""''

    "括号自动补全
        :inoremap ( ()<ESC>i
        :inoremap ) <c-r>=ClosePair(')')<CR>
        :inoremap { {}<ESC>i
        :inoremap } <c-r>=ClosePair('}')<CR>
        :inoremap [ []<ESC>i
        :inoremap ] <c-r>=ClosePair(']')<CR>
        ":inoremap < <><ESC>i
        ":inoremap > <c-r>=ClosePair('>')<CR>
        :inoremap " ""<ESC>i
        :inoremap ' ''<ESC>i

        function ClosePair(char)
        if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
        else
        return a:char
        endif
        endf

"abbrivations
iab pirnt print 
iab teh the 



"split window jumt
    nmap <silent> <C-Up> :wincmd k<CR>
    nmap <silent> <C-Down> :wincmd j<CR>
    nmap <silent> <C-Left> :wincmd h<CR>
    nmap <silent> <C-Right> :wincmd l<CR>

"在等号两边加空格
    let g:equ=1
    "设置= + - * 前后自动空格
    "蛇者 ,后面自动添加空格
    if exists("g:equ")
    :inoremap = <c-r>=EqualSign('=')<CR>
    :inoremap + <c-r>=EqualSign('+')<CR>
    ":inoremap - <c-r>=EqualSign('-')<CR>
    ":inoremap * <c-r>=EqualSign('*')<CR>
    ":inoremap / <c-r>=EqualSign('/')<CR>
    ":inoremap > <c-r>=EqualSign('>')<CR>
    ":inoremap < <c-r>=EqualSign('<')<CR>
    :inoremap , ,<space>
    endif
     
    function! EqualSign(char)
    if a:char  =~ '='  && getline('.') =~ ".*("
    return a:char
    endif 
    let ex1 = getline('.')[col('.') - 3]
    let ex2 = getline('.')[col('.') - 2]

    if ex1 =~ "[-=+><>\/\*]"
    if ex2 !~ "\s"
    return "\<ESC>i".a:char."\<SPACE>"
    else
    return "\<ESC>xa".a:char."\<SPACE>"
    endif 
    else
    if ex2 !~ "\s"
    return "\<SPACE>".a:char."\<SPACE>\<ESC>a"
    else
    return a:char."\<SPACE>\<ESC>a"
    endif 
    endif
    endf


" commands
" Sudo write
comm! W exec 'w !sudo tee % > /dev/null' | e!


"latex-suit ---------------------------------------------------------------------------------------
    let g:Tex_UseMakefile=0
    filetype plugin on

    " IMPORTANT: win32 users will need to have 'shellslash' set so that latex
    " can be called correctly.
    set shellslash

    " IMPORTANT: grep will sometimes skip displaying the file name if you
    " search in a singe file. This will confuse Latex-Suite. Set your grep
    " program to always generate a file-name.
    set grepprg=grep\ -nH\ $*

    " OPTIONAL: This enables automatic indentation as you type.


    " OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
    " 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
    " The following changes the default filetype back to 'tex':
    let g:tex_flavor='latex'

    let g:Tex_CompileRule_dvi="latex -src-specials -interaction=nonstopmode $*"
    let g:Tex_UseMakefile = 0

    let g:Imap_UsePlaceHolders=0
    " This option when set to 1 makes <C-J> in insert mode delete
    " non-descriptive (empty) placeholders and enters insert mode.


    let g:Tex_PromptedEnvironments='eqnarray*,eqnarray,equation,equation*,align,align*,itemize,frame,comment'


"------------Tlist---------------------------------------------------------------------------
    " 把方法列表放在屏幕的右侧
    let Tlist_Use_Right_Window=1
    "前不被编辑的文件的方法列表自动折叠起来， 这样可以节约一些屏幕空间
    let Tlist_File_Fold_Auto_Close=1

    let Tlist_Show_One_File=1
    let Tlist_Exit_OnlyWindow=1
    "tags我们需要制定tags目录给Vim,在Vim中执行命令:set tags=你的代码所在的路径\tags，如果你一直使用同一个代码路径可以把他写死在_vimrc中，例如我的代码在
    "D:\VimTest配置如下
    "set tags="D:\Program Files\Vim\vimfiles\mytags"




"--------------------------for python-------------------------------------------------------------
    "Pydiction
    "自动补全 
    filetype plugin indent on
    "自动补全命令时候使用菜单式匹配列表 
    filetype plugin on 
    set wildmenu
    autocmd BufRead,BufNewFile *.pyx set filetype=python 
    autocmd FileType python set omnifunc=pythoncomplete#Complete
    autocmd FileType python set foldmethod=indent
    autocmd FileType python set number
    let g:pydiction_location = 'D:\Program Files\Vim\vimfiles\ftplugin\pydiction\complete-dict'

    "set smartindent 
    set cindent

    set tabstop=4
    set shiftwidth=4
    set expandtab
    "sts	方便在开启了et后使用退格（backspace）键，每次退格将删除X个空格
    set softtabstop=4	




"----------------------------------------------------------------------------------------------
"” autoload _vimrc

autocmd! bufwritepost _vimrc source %


"----------------------gvimfullscreen_win32 : Put gvim in full screen on Windows ------------------
"map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR> 


"-------------------保持上次标签页---------------------------------
map <F2> :mksession! ~/vim_session.vim <cr> " Quick write session with F2
map <F3> :source ~/vim_session.vim <cr>     " And load session with F3

"-----------------------for .sage files---------------------------
" Sage settings (from Franco Saliola via wiki.sagemath.org/Tips) 
autocmd BufRead,BufNewFile *.sage,*.spyx set filetype=python 



"------------------for Fortran files--------------------------------
:let fortran_fold=1
"Additionally you can force folding on conditionals and multiline comments trhough
:let fortran_fold_conditionals=1
:let fortran_fold_multilinecomments=1
autocmd FileType fortran set number


"temperary func for transfer fortran to py
map <F9> :call Rep()<CR>
function Rep()
	silent! normal mg
    "预处理
    " !--> #
    silent! execute "%s/!\\{1,2}$\\{0,1}/#/g"    
    "首先统一把圆括号改成方括号
    silent! execute "%s/(/[/g"
    silent! execute "%s/)/]/g"
    "去掉line continuation &
    silent! execute "%s/&\\n\\s*//g"
    silent! execute "g/^\\s*use .*/d"
    silent! execute "g/.* type .*/d"
    silent! execute "g/^contains.*/d"
    silent! execute "g/^module/d"
    silent! execute "g/end module/d"

    "arrays  [/1.0,-1.0/] --> [1.0,-1.0]
    silent! execute "%s/\\[\\/\\(.*\\)\\/\\]/[\\1]/g"


    "delete type declareations 
    silent! execute "g/integer .*/d"
    silent! execute "g/integer,.*/d"
    silent! execute "g/integer::.*/d"
    silent! execute "g/implicit none.*/d"
    silent! execute "g/character\\*.*/d"
    silent! execute "g/logical,.*/d"
    silent! execute "g/logical .*/d"    
    silent! execute "g/\\s*type\\[.*\\].*/d"
    silent! execute "g/\\DATATYPE::.*/d"
    silent! execute "g/\\DATATYPE,.*/d"
    
    silent! execute "g/real\\*.*/d"
    
    "subroutions and functions
    silent! execute "%s/subroutine \\(.*\\)\\[\\(.*\\)\\]/def \\1(\\2):"
    silent! execute "g/end subroutine.*/d"
    silent! execute "%s/call\\s*\\([_a-zA-Z0-9]*\\)\\[\\(.*\\)\\]\\s*$/\\1(\\2)/g"
    silent! execute "%s/function \\(.*\\)\\[\\(.*\\)\\]/def \\1(\\2):"    
    silent! execute "g/end function.*/d"    
    

    "for loops
    "   do i= 1,n -> for i in range(n):
    silent! execute "%s/do\\s*\\([a-zA-Z]*\\s*\\)=\\s*1\\s*,\\s*\\(.*\\)/for \\1 in range(\\2):/g"
    "   do i= 0,n -> for i in range(n):
    silent! execute "%s/do\\s*\\([a-zA-Z]*\\s*\\)=\\s*0\\s*,\\s*\\(.*\\)/for \\1 in range(\\2):/g"
    silent!  execute "%s/do\\\\s*\\\\([a-zA-Z]*\\\\s*\\\\)=\\\\s*1\\\\s*,\\\\s*\\\\(.*\\\\)/for \\\\1 in  range(\\\\2):/g"  

    silent! execute "%s/do\\s*\\([a-zA-Z]*\\s*\\)=\\s*\\(.*\\)\\s*,\\s*\\(.*\\),\\s*-1/for \\1 in range(\\2, \\3-1, -1):/g"
    silent! execute "%s/do\\s*\\([a-zA-Z]*\\s*\\)=\\s*\\([a-zA-Z]*\\)\\s*,\\s*\\(.*\\)/for \\1 in range(\\2, \\3):/g"

    silent! execute "%s/range\\[\\(.*\\)\\]/range(\\1)"

    silent! execute "%s/   /    /g"
    silent! execute "%s/%/./g"

    silent! execute "%s/ \\:/:/g"
    silent! execute "%s/do while \\[\\(.*\\)\\]/while \\1: /g"
    

    silent! execute "g/end do$/d"

    "" if else
    silent! execute "%s/then//g"
    silent! execute "%s/if \\[\\(.*\\)\\]/if \\1: /g"
    silent! execute "%s/else$/else:"    
    silent! execute "g/end if$/d"    

    silent! execute "%s/\\.d0/.0/g"

    "slicing start from 0
    silent! execute "%s/1\\:/0:/g"

    "modify logical operators
    silent! execute "%s/\\.eq\\./ == /g"
    silent! execute "%s/\\.ne\\./ != /g"
    silent! execute "%s/\\.le\\./ <= /g"
    silent! execute "%s/\\.not\\./ not /g"
    silent! execute "%s/\\.lt\\./ == /g"
    silent! execute "%s/\\.gt\\./ == /g"
    silent! execute "%s/\\.and\\./ and /g"
    silent! execute "%s/\\\\.or\\\\./ or /g"    
    silent! execute "%s/\\.TRUE\\./ True /g"
    silent! execute "%s/\\.FALSE\\./ False /g"    
    silent! execute "%s/present\\[\\(.*\\)\\]/\\1!=none"

    "miscs


    silent! execute "%s/print \\*,/print/g"


    silent! normal 'g
	execute "noh"
endfunction








