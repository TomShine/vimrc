" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <leader>y "+y

" 设置快捷键将系统剪贴板内容粘贴至vim
nmap <leader>p "+p

" Paste mode avoids auto-indent
" set pastetoggle=<leader>p

" folding
" nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR> " 用空格键来开关折叠

" Fast reloading of the init.vim (快速加载 init.vim 文件)
map  ;rc :source $HOME/.vimrc<cr>
imap ;rc :source $HOME/.vimrc<cr>
nmap ;rc :source $HOME/.vimrc<cr>

" Fast editing init.vim (快速编辑 init.vim 文件)
map ;ec :e $HOME/.vimrc<cr>
imap ;ec :e $HOME/.vimrc<cr>
nmap ;ec :e $HOME/.vimrc<cr>

" When .vimrc is edited, reload it
autocmd! bufwritepost .vimrc source $HOME/.vimrc

" 常规模式下输入 cS 清除行尾空格
nmap ;cS :%s/\s\+$//g<CR>:noh<CR>   
" 常规模式下输入 cM 清除行尾 ^M 符号
nmap ;cM :%s/\r$//g<CR>:noh<CR>

" Toggle paste mode on and off:
map ;lp :setlocal paste!<cr>

" 复制至公共剪贴板
vmap ;gc "+y

" 复制所有至公共剪贴板
nmap ;ga <ESC>ggVG"+y<ESC>

" 从公共剪贴板粘贴
imap ;gp <ESC>"+p
nmap ;gp "+p
vmap ;gp "+p

" 十六进制格式查看
nmap ;16 <ESC>:%!xxd<ESC>

" 返回普通格式
nmap ;r16 <ESC>:%!xxd -r<ESC>

" 一键去除所有尾部空白[全模式可用]
imap ;rb <ESC>:let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
nmap ;rb :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
vmap ;rb <ESC>:let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" 一键去除字符[全模式可用]
imap ;rm <ESC>:%s/<c-v><c-m>//g<CR>
nmap ;rm :%s/<c-v><c-m>//g<CR>
vmap ;rm <ESC>:%s/<c-v><c-m>//g<CR>

" 一键替换全部Tab为空格[全模式可用]
func! RemoveTabs()
    if &shiftwidth == 2
        exec "%s/	/  /g"
    elseif &shiftwidth == 4
        exec "%s/	/    /g"
    elseif &shiftwidth == 6
        exec "%s/	/      /g"
    elseif &shiftwidth == 8
        exec "%s/	/        /g"
    else
        exec "%s/	/ /g"
    end
endfunc

imap ;rt <ESC>:call RemoveTabs()<CR>
nmap ;rt :call RemoveTabs()<CR>
vmap ;rt <ESC>:call RemoveTabs()<CR>

" 一键生成与当前编辑文件同名的HTML文件 [不输出行号]
imap ;th <ESC>:set nonumber<CR>:set norelativenumber<CR><ESC>:TOhtml<CR><ESC>:w %:r.html<CR><ESC>:q<CR>:set number<CR>:set relativenumber<CR>
nmap ;th <ESC>:set nonumber<CR>:set norelativenumber<CR><ESC>:TOhtml<CR><ESC>:w %:r.html<CR><ESC>:q<CR>:set number<CR>:set relativenumber<CR>
vmap ;th <ESC>:set nonumber<CR>:set norelativenumber<CR><ESC>:TOhtml<CR><ESC>:w %:r.html<CR><ESC>:q<CR>:set number<CR>:set relativenumber<CR>

" Session {
    " 环境恢复
    " 设置环境保存项
    set sessionoptions="blank,globals,localoptions,tabpages,sesdir,flolds,help,options,resize,winpos,winsize"

    " 保存快捷键
    "map ;ss :mksession! my.vim<cr> :wviminfo! my.viminfo<cr>
    map ;ss :mksession! my.vim<cr>

    " 恢复快捷键
    map ;rs :source my.vim<cr> :rviminfo my.viminfo<cr>
    map ;rs :source my.vim<cr>
"}

" 替换函数。参数说明：
" confirm：是否替换前逐一确认
" wholeword：是否整词匹配
" replace：被替换字符串
function! Replace(confirm, wholeword, replace)
    wa
    let flag = ''
    if a:confirm
        let flag .= 'gec'
    else
        let flag .= 'ge'
    endif
    let search = ''
    if a:wholeword
        let search .= '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>'
    else
        let search .= expand('<cword>')
    endif
    let replace = escape(a:replace, '/\&~')
    execute 'argdo %s/' . search . '/' . replace . '/' . flag . '| update'
endfunction

" 不确认、非整词
nnoremap <leader>R :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 不确认、整词
nnoremap <leader>rw :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、非整词
nnoremap <leader>rc :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、整词
nnoremap <leader>rcw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
nnoremap <leader>rwc :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>

" <c-l>通常用来清除并重绘屏幕，这个映射增加了关闭查找高亮的功能
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" 使用 <spapce>fs 在插入和normal模式下保存文件，我经常在 insert 模式下代替 Esc
inoremap <space>fs <Esc>:w<cr>
noremap <space>fs :w<cr>

inoremap <space>fq <Esc>:q<cr>
noremap <space>fq :q<cr>
