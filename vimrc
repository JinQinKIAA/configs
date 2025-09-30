filetype on 				    
filetype plugin on 			
filetype indent on 			

syntax on 					   
syntax enable 				  
                        
set backspace=indent,eol,start  
set mouse=a					    
set bg=dark					    

set encoding=utf-8			
set fileencoding=utf-8	
                        
set relativenumber number
set ts=2					      
set shiftwidth=2
set softtabstop=2
set expandtab          

set laststatus=2 			  

set statusline=
set statusline+=%#CursorColumn#
set statusline+=\ %f\ 
set statusline+=%m\ 
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %l:%c
set statusline+=\ %p%%
set statusline+=\ %y
set statusline+=\ %{&fileformat}
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}

set clipboard^=unnamed,unnamedplus
vnoremap <C-C> "+y

set textwidth=1000
set nocompatible        "不与vi兼容 关闭兼容模式
set cursorline        "高亮显示当前行
set hlsearch            "高亮显示搜索结果 
" 按alt+/取消高亮
noremap <silent> ␛/ :nohlsearch<CR>
set incsearch           "开启实时搜索功能
set backspace=2         "开启删除
set ignorecase          "搜索忽略大小写
set wildmenu            "vim命令自动补全
set autoread            "若文件发生变化 自动更新显示内容
set ruler               "在状态栏显示光标位置

" 将 vim 编辑的内容输出为 html 文件
map ␛o :%TOhtml<CR>:! google-chrome %<CR>

" 分屏 感觉没啥用
map <C-right> :set splitright<CR>:vsplit<CR>
map <C-left> :set nosplitright<CR>:vsplit<CR>
map <C-down> :set splitbelow<CR>:split<CR>
map <C-up> :set nosplitbelow<CR>:split<CR>
map <C-l> <C-w>l
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-j> <C-w>j

map ␛t :tabe<CR>
map ␛[1;3C] :+tabnext<CR>
map ␛[1;3D] :-tabnext<CR>
map ␛q :tabclose<CR>

"设置 leader 键为空格
"g:mapleader = "\<space>"

inoremap jj <esc>
cnoremap jj <esc>
vnoremap jn <esc>

"关闭文件再打开后跳转到关闭之前的位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif 

" 改变vim光标形式，插入模式下和命令模式下做区分
if has("autocmd")
    au VimEnter,InsertLeave * silent execute '!echo -ne "\e[1 q"' | redraw!
      au InsertEnter,InsertChange *
              \ if v:insertmode == 'i' |
              \   silent execute '!echo -ne "\e[5 q"' | redraw! |
              \ elseif v:insertmode == 'r' |
              \   silent execute '!echo -ne "\e[3 q"' | redraw! |
              \ endif
        au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
      endif


