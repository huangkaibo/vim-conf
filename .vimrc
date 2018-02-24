"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 插件管理脚本 地址是https://github.com/VundleVim/Vundle.vim
" 以下是其配置文件

set nocompatible " be iMproved, required
filetype off " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required

"Vundle脚本
Plugin 'VundleVim/Vundle.vim'

"两个编辑区主题
Plugin 'tomasr/molokai'
Plugin 'altercation/vim-colors-solarized'
Plugin 'jnurmine/Zenburn'

"ultisnips的插件, 输入for<tab>等自动补全的
"Track the engine.
Plugin 'SirVer/ultisnips'
"Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

"下方状态栏
Plugin 'vim-airline/vim-airline'

"状态栏配套主题
Plugin 'vim-airline/vim-airline-themes'

"代码变量/函数等的一栏框
"F8激活
Plugin 'majutsushi/tagbar'

"文件列表栏
"ctrl+n激活
Plugin 'scrooloose/nerdtree'

"ctrl+P搜索项目文件夹内的其他文件
Plugin 'kien/ctrlp.vim'

"task list插件 #TODO这种
"ctrl+t调用
Plugin 'vim-scripts/TaskList.vim'

"移动跳转插件
",,w ,,b ,,s ,,hjkl进行快速跳转
Plugin 'easymotion/vim-easymotion'

"Plugin 'Valloric/YouCompleteMe'

"搜索buffer的插件
Plugin 'vim-scripts/L9'
Plugin 'vim-scripts/FuzzyFinder'

"自动补全
"无需配置
" Plugin 'vim-scripts/AutoComplPop'
" Plugin 'vim-scripts/OmniCppComplete'

"快速注释
"gcc注释当前行
"可视模式后gc批量注释
"gcu取消上次注释
Plugin 'tpope/vim-commentary'

"gdb插件
" Plugin 'vim-scripts/vimgdb'
Plugin 'vim-scripts/gdbmgr'

"缩进竖线条
Plugin 'Yggdroot/indentLine'

" 彩虹括号
Plugin 'kien/rainbow_parentheses.vim'

" ctrl+udbf 平滑滚动插件
Plugin 'terryma/vim-smooth-scroll'

" All of your Plugins must be added before the following line
call vundle#end() " required

filetype plugin indent on " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList - lists configured plugins
" :PluginInstall - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"设置行号number和nu都可以
set nu

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"突出显示该行,就是加下划线
set cursorline

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"新建文件自动添加文件头,还可以再修改

""新建.c,.h.cpp文件，自动插入文件头
autocmd BufNewFile *.cpp,*.[ch] exec ":call SetTitle()"

""定义函数SetTitle，自动插入文件头
func SetTitle()
	call setline(1, "/*************************************************************************")
	call append(line("."), " > File Name: ".expand("%"))
	call append(line(".")+1, " > Author: 黄凯博")
	call append(line(".")+2, " > Mail: huangkaibochn@gmail.com")
	call append(line(".")+3, " > Created Time: ".strftime("%c"))
	call append(line(".")+4, " ************************************************************************/")
	call append(line(".")+5, "")

	if &filetype == 'cpp'
		call append(line(".")+6, "#include<iostream>")
		call append(line(".")+7, "using namespace std;")
		call append(line(".")+8, "")
		call append(line(".")+9, "")
	endif

	if &filetype == 'c'
		call append(line(".")+6, "#include<stdio.h>")
		call append(line(".")+7, "")
		call append(line(".")+8, "")
	endif

	""新建文件后，自动定位到文件末尾,原来是autocmd BufNewFile * normal G,但是应该是在BufNewFile中又BufNewFile所以不行
	normal G
endfunc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"智能补全,自己设置的,没有下面的好
":inoremap ( ()<ESC>i
":inoremap [ []<ESC>i
":inoremap { {}<ESC>i
":inoremap " ""<ESC>i
":inoremap ' ''<ESC>i

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"智能补全,有些不好
":inoremap ( ()<ESC>i
":inoremap ) <c-r>=ClosePair(')')<CR>
":inoremap { {<CR>}<ESC>O
":inoremap } <c-r>=ClosePair('}')<CR>
":inoremap [ []<ESC>i
":inoremap ] <c-r>=ClosePair(']')<CR>
":inoremap " ""<ESC>i
":inoremap ' ''<ESC>i
"function! ClosePair(char)
"	if getline('.')[col('.') - 1] == a:char
"		return "\<Right>"
"	else
"		return a:char
"	endif
"endfunction
"filetype plugin indent on
"打开文件类型检测, 加了这句才可以用智能补全

set completeopt=longest,menu
" set smartindent
" 不用这个smartindent 换行后也会对齐上一行, 甚至加缩进减缩进对齐应该对齐的位置
" 会自动缩进是因为set nopaste造成的, 这个也会造成粘贴自动缩进, 格式混乱, 粘贴时set paste就好

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"设置状态栏
" :set statusline=%F%m%r\[TYPE=%Y]\[%{&fenc!=''?&fenc:&enc}]\ [%l,%v][%p%%]\[LEN=%L]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"状态栏永久显示
set laststatus=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"搜索忽略大小写
set ignorecase

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"设置Tab
set tabstop=4 softtabstop=4 shiftwidth=4
set expandtab

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"禁用方向键
"nnoremap <up> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>
"nnoremap <down> <nop>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"配色
:syntax on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"解决中文乱码
set fileencodings=utf-8,gbk

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"C++的编译和运行
map <F5> :call CompileRunGpp()<CR>
func! CompileRunGpp()
exec "w"
exec "!g++ % -o %<"
exec "! ./%<"
endfunc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"C,C++的调试
" map <F8> :call Rungdb()<CR>
" func! Rungdb()
"     exec "w"
" 	exec "!g++ % -g -o %<"
" 	exec "!gdb ./%<"
" endfunc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"自动补全
" set completeopt=menuone,menu,longest

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"高亮搜索
set hlsearch

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"字典补全<C-x><C-k>
" set dictionary-=$VIM/dic.txt dictionary+=$VIM/dic.txt

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"直接<C-n>就调用字典补全
"set complete-=k complete+=k

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"使得vim能与系统剪贴板交互,即可用"*
set clipboard=unnamed

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"airline插件
let g:airline_powerline_fonts = 1

"设置air-line主题,和编辑区主题无关
let g:airline_theme='molokai'

"添加vim上访的栏,貌似叫buffer栏,就是打开多个vim时显示各个vim
let g:airline#extensions#tabline#enabled = 1

"让vim可以显示色彩
set t_Co=256

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"设置切换vim buffer的快捷键
nnoremap <C-tab> :bn<CR>
nnoremap <C-s-tab> :bp<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"tagbar插件
"打开tagbar的快捷键
" nmap <F8> :TagbarToggle<CR>

"自动打开tagbar
autocmd vimenter * TagbarToggle

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"nerdTree插件
"打开nerdTree的快捷键
map <C-n> :NERDTreeToggle<CR>

"只剩nerdTree窗口时关闭vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"自动打开NERD Tree
"后一句是开启vim自动打开NERD Tree后自动定位到文本编辑区
"autocmd vimenter * NERDTree
"autocmd VimEnter * wincmd w

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"task list插件
"输入快捷键就能搜索所有task list
map <C-t> :TaskList<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"设置全局leader
" let g:mapleader = ","
let g:mapleader = " "

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"设置字体
"set guifont=Courier_new:h12:iosevka-slab-regular

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"设置编辑区域主题
"主题在vundle中直接Plugin即可
"这里放在最后是怕被一些其他设置覆盖了
colorscheme zenburn

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"alt+数字切换tab页
":nn <M-1> 1gt
":nn <M-2> 2gt
":nn <M-3> 3gt
":nn <M-4> 4gt
":nn <M-5> 5gt
":nn <M-6> 6gt
":nn <M-7> 7gt
":nn <M-8> 8gt
":nn <M-9> 9gt
":nn <M-0> :tablast<CR>
"失败了, 无法使用, 原因不明

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"ultsnips插件的配置
"Trigger configuration. Do not use <tab> if you use
"https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"FuzzyFinder插件 ,ff查找文件 ,fb查找buffer
nnoremap <leader>ff :FufFile<CR>
nnoremap <leader>fb :FufBuffer<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"easymotion
"上下跳转 ,,w ,,b
map <Leader>j <Leader><Leader>w
map <Leader>k <Leader><Leader>b
"搜索跳转 ,,s
map <Leader>s <Leader><Leader>s
"行级跳转 ,j ,k
" map <Leader>j <Plug>(easymotion-j)
" map <Leader>k <Plug>(easymotion-k)
"行内跳转 ,h ,l
" map <Leader>h <Plug>(easymotion-linebackward)
" map <Leader>l <Plug>(easymotion-lineforward)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"窗口分隔后的切换窗口键改简单点
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"将H映射为行首, L映射为行尾, J映射为文首, K映射为文尾
nnoremap H ^
nnoremap L $
" nnoremap J <C-f>
" nnoremap K <C-b>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"使退格能删除缩进,该行,此前的插入
set backspace=indent,eol,start

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"如果上一行是注释, 换行后会自动加上注释符, 这里取消这个
"-r: 按回车不会添加注释 -o 按o不会添加注释 -c:重新格式化长注释行不会添加注释
"http://vim.wikia.com/wiki/Disable_automatic_comment_insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" F10 粘贴模式 F11 取消粘贴模式
:map <F10> :set paste<CR>
:map <F11> :set nopaste<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ,y查询单词
" 需要先pip install ici
nmap <Leader>y :!echo --==<C-R><C-w>==-- ;ici <C-R><C-W><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 缩进竖线条的配置
" 设置缩进线颜色 7为白色 下面有颜色对照表
" http://blog.csdn.net/cp3alai/article/details/45509459
let g:indentLine_color_term = 7
" 设置缩进线字符
" let g:indentLine_char = 'c'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 彩虹括号配置
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

" 设置常开
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" nnoremap j jzz
" nnoremap k kzz

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 普通模式下按两下esc消除高亮
nnoremap <esc><esc> :nohl<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" terryma/vim-smooth-scroll 平滑滚动插件
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
" noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
" noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
noremap <silent> K :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> J :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" YCM配置

" 编译时使用的python位置
let g:ycm_server_python_interpreter='/usr/bin/python2.7'
" .ycm_extra_conf.py的位置
let g:ycm_global_ycm_extra_conf='/root/.ycm_extra_conf.py'
" 设置YCM安装在哪里了
set runtimepath+=/root/.vim/bundle/YouCompleteMe

" 跳转到定义Definition
" nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
" 跳转到声明
" nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
" 跳转到定义或声明处
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" 在注释输入中也能补全
let g:ycm_complete_in_comments = 1
" 在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
" 从第2个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=2
" 关闭加载.ycm_extra_conf.py提示
let g:ycm_confirm_extra_conf = 0

" 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_tags_files=1
" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1

" YCM会自动检测错误, error用>>标识, warning用>*标识
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
" 打开location-list来显示警告和错误的信息
nmap <F4> :YcmDiags<CR>
" open locationlist
" nnoremap <leader>lo :lopen<CR>
" close locationlist
" nnoremap <leader>lc :lclose<CR>

" airline的ycm集成
let g:airline#extensions#ycm#enabled = 1

" Vim的补全菜单配置(:help completeopt)
set completeopt=menu,longest
" 离开插入模式后自动关闭预览窗口, 实测不设置也会自动关闭
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" 回车即选中当前项
" 没有这个的话, 回车会先选择再换行
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
" 上下左右键的行为 会显示其他信息
" 没看出啥用
" inoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
" inoremap <expr> <Up> pumvisible() ? "\<C-p>" : "\<Up>"
" inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
" inoremap <expr> <PageUp> pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

" youcompleteme  默认tab  s-tab 和自动补全冲突
" 没有这两个会拦截掉tab, tab被用于选择
" 导致其他插件的tab不能用
" 以及tab缩进也不可用
let g:ycm_key_list_select_completion=['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<c-p>', '<Up>']

" 强制重新语法解析
" nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>

" inoremap <leader><leader> <C-x><C-o>

let g:clang_user_options='|| exit 0'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
