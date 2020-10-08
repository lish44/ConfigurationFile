"
"================================基础配置=============================
" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC
"关闭兼容模式
set nocompatible
"文件被外部改动后, 自动加载
set autoread
"不生成备份文件
set nobackup
"不生成临时文件
set noswapfile
"不生成 undo 文件
set noundofile
set number
set relativenumber
set mouse=a
set encoding=utf-8
let &t_ut=''
"记录光标当前位置下次打开保持
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
filetype on
filetype indent on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on
filetype plugin indent on
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1
" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
" set ignorecase
" 关闭兼容模式
set nocompatible
" vim 自身命令行模式智能补全
"set wildmenu
"永远保持10行
set scrolloff=12
set cursorline
"超框换行
set wrap
"tab menu设置
set wildmenu
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
"=================================================================



"=============================更改按键映射=========================
"
"===
"=== 普通模式
"===
"<leader> 映射成 空格
let mapleader=" "
" 保存文件
nnoremap <leader>w :w<cr>
" 保存并退出文件
nnoremap <leader>wq :wq<cr>
" 退出文件
nnoremap <leader>q :q<cr>
" 不做任何保存直接退出
nnoremap <Leader>Q :qa!<CR>
" 单词的复制
nnoremap <Leader>/ yiw
nnoremap <Leader>" yi"
nnoremap <Leader>{ yi{
nnoremap <Leader>( yi(
"分屏
nnoremap tl :set splitright<CR> :vsplit<CR>
nnoremap th :set nosplitright<CR>:vsplit<CR>
nnoremap ti :set nosplitbelow<CR>:split<CR>
nnoremap tj :set splitbelow<CR>:split<CR>
nnoremap to :only<CR>
"分屏后光标切换
nnoremap <LEADER>i <C-w>k
nnoremap <LEADER>j <C-w>j
nnoremap <LEADER>h <C-w>h
nnoremap <LEADER>l <C-w>l
"======

"===
"=== 普通模式，视图模式
"===
" 对调ik
noremap i k
noremap k i
noremap K I
" 行尾
noremap L $
vnoremap L $h
" 行首
noremap H ^
noremap I 4k
noremap J 4j
noremap <C-i> 4<C-y>
noremap <C-j> 4<C-e>
"======
"
"===
"===视图模式
"===

" 复制到系统剪切板
noremap <LEADER>y "+y
noremap <LEADER>p "+p
"======

"===
"===插入模式
"===
"
inoremap jj <Esc>
"inoremap <c-j> <down>
"inoremap <c-i> <up>
inoremap <c-f> <right>
inoremap <c-q> <Home>
inoremap <c-e> <End>
inoremap <c-b> <left>
inoremap <c-d> <c-o>s

"======


"===
"=== 全局映射
"===
"标签左右切换
map tn :tabe<CR>
map <LEADER>n :-tabnext<CR>
map <LEADER>m :+tabnext<CR>
"控制分屏大小
"map <up> :res +5<CR> 
"map <down> :res -5<CR>
"map <left> :vertical resize-5<CR>
"map <right> :vertical resize+5<CR>
"分屏交换
"map tv <C-w>t<C-w>H
"map tv <C-w>t<C-w>K
"======


"------------------------------插件-------------
call plug#begin('~/.vim/plugged')
"==
"==状态栏
"==
Plug'vim-airline/vim-airline'
Plug'vim-airline/vim-airline-themes'
"==
"==主题
"==
Plug'dracula/vim',{ 'as': 'dracula' }
Plug'flazz/vim-colorschemes'
"==
"==开始界面
"==
Plug'mhinz/vim-startify'
"==
"==NERDtree
"==
Plug'scrooloose/nerdtree'
"==
"==mark显示
"==
Plug'kshenoy/vim-signature'
"==
"==格式化插件noremap <F3> :Autoformat<CR>
"==
"Plug'Chiel92/vim-autoformat' 
"==
"==Markdownpreview
"==
Plug'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
"==
"==vimwili
"==
Plug'vimwiki/vimwiki'

"==
"==
"==

call plug#end()
"===========================插件配置=====================
"==
"==主题设置
"==
colorscheme sialoquent
"colorscheme dracula


"==
"==NEDRTree开启关闭窗口
"==
map tt :NERDTreeMirror<CR>
map tt :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapOpenSplit = "w"
let NERDTreeMapOpenVSplit = "l"
"==
"==MarkDownPrivew
"==

let g:mkdp_auto_start = 0
"let g:mkdp_command_for_global = 0
"let g:mkdp_open_to_the_world = 0
"let g:mkdp_browser="chrome"
"let g:mkdp_path_to_chrome="chrome"
let g:mkdp_auto_close=0
"let g:mkdp_open_to_the_world = 0
"let g:mkdp_markdown_css=''
map <LEADER>r <Plug>MarkdownPreview
"==
"==

"==
"==airline-theme
"==
let g:airline_theme="bubblegum"
"==
"==

"=
"=vimwiki
"=
let g:vimwiki_list = [{'path': '~/Library/Mobile\ Documents/iCloud\~com\~coderforart\~iOS\~MWeb/Documents/note/Note/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
"==
"==


"==
"==markdown快捷键
"==
autocmd Filetype markdown inoremap ,m <Esc>/<++><CR>:nohlsearch<CR>c4l
autocmd Filetype markdown inoremap ,n ---<Enter><Enter>
autocmd Filetype markdown inoremap ,b **** <++><Esc>F*hi
"字画横杠
autocmd Filetype markdown inoremap ,s ~~~~ <++><Esc>F~hi
"强调字体
autocmd Filetype markdown inoremap ,i ** <++><Esc>F*i
"强调背景
autocmd Filetype markdown inoremap ,d `` <++><Esc>F`i
autocmd Filetype markdown inoremap ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap ,h ====<Space><++><Esc>F=hi
autocmd Filetype markdown inoremap ,p ![](../pic/<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap ,a [](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap ,l --------<Enter>
autocmd Filetype markdown inoremap ,z []()[<++>](<++>)<Esc>F(;a
"子标题
autocmd Filetype markdown inoremap ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,5 #####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,6 ######<Space><Enter><++><Esc>kA
"带颜色强调
autocmd Filetype markdown inoremap ,R <font color=#f4433c></font><Esc>6hi
autocmd Filetype markdown inoremap ,G <font color=#0aa858></font><Esc>6hi
autocmd Filetype markdown inoremap ,B <font color=#4285f4></font><Esc>6hi
autocmd Filetype markdown inoremap ,Y <font color=#ffbc32></font><Esc>6hi
" kbd
autocmd Filetype markdown inoremap ,k <kbd></kbd><++><Esc>F<;i

autocmd Filetype markdown inoremap ,r [return][./index.md]

"===

