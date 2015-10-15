"======================================================================================
"General settings
"======================================================================================
syntax on
set expandtab
set guifont=Courier\ New\ 12
set guifontwide=STXihei:h14
"set guifont=Bitstream\ Vera\ Sans\ Mono:h14
"set nomacatsui
"set termencoding=macroman
set backspace=indent,eol,start
set whichwrap=b,s,<,>,[,]
colorscheme desert
set cmdheight=1
set laststatus=2
set shiftwidth=4
set tabstop=4
set number
set nolinebreak
set nocompatible
set nobackup
set nowb
set noswapfile
set mouse=c
set incsearch
set hlsearch
set history=400
set hidden
set expandtab
set confirm
set et
set wrap
set cindent
set ambiwidth=double
set foldlevel=999
set helplang=cn
set cmdheight=2
set encoding=utf-8
"set go=e
set backspace=indent,eol,start

if has("gui_macvim")
    let macvim_skip_cmd_opt_movement = 1
    let macvim_hig_shift_movement = 1

    set transparency = 2

    macm File.Save          key=<D-s>
    macm File.Undo          key=<D-z>
    macm File.Copy          key=<D-c>
    macm File.Paste         key=<D-v>
    macm File.Cut           key=<D-x>
    macm File.Select\ All   key=<D-a>

endif

"Tab configuration
map tn :tabnew<CR>
map te :tabedit
map tc :tabclose<CR>
map tm :tabmove
map tt :tabnext<CR>
map tp :tabprevious<CR>
map tl :tablast<CR>
map tf :tabfirst<CR>
try
    set switchbuf=usetab
    set stal=2
catch
endtry

"Record last edit position
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" Tags
set tags+=/tmp/tags

" 目录树
nnoremap <silent> <F5> :NERDTree<CR>

set rtp+=~/.fzf
