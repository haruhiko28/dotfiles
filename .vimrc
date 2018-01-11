" Neobundle settings
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'


" add bundles here
" カラースキーム
NeoBundle 'w0ng/vim-hybrid'
" NeoBundle 'tomasr/molokai'
" NeoBundle 'jpo/vim-railscasts-theme'

" NeoBundle 'Townk/vim-autoclose'
NeoBundle 'mattn/emmet-vim'
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'nathanaelkane/vim-indent-guides'
" NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
" NeoBundle 'davidoc/taskpaper.vim'
NeoBundle 'tyru/caw.vim.git'
NeoBundle 'mattn/jscomplete-vim'
NeoBundle 'bling/vim-airline'
NeoBundleLazy "hynek/vim-python-pep8-indent", {'autoload':{'insert':1,'filetypes':['python','python3']}}
" NeoBundle 'tpope/vim-surround'
" NeoBundle 'vim-scripts/Align'
" NeoBundle 'vim-scripts/YankRing.vim'
" vim 7.3 以上が必要だった…
NeoBundle 'Lokaltog/vim-easymotion'

" NeoBundle 'whatyouhide/vim-lengthmatters'
" ynpmで許可されない…
" NeoBundle 'marijnh/tern_for_vim', {
"   \ 'build': {
"   \   'others': 'ynpm install'
"   \}}

call neobundle#end()
 
" Required:
filetype plugin indent on

NeoBundleCheck

" kihon
let base16colorspace=256
set t_Co=256

set background=dark
colorscheme hybrid 

set nocompatible
set number                          " 行数表示
set backspace=indent,eol,start      " バックスペースで何でも消す
"set autoindent                      " 前の行のインデントを引き継ぐ
set smartindent                     " 開業時に次の行のインデントをうまいことやる
set cindent                         " pythonの#のインデントがクソになるの防止
set tabstop=4                       " タブのスペース数
set softtabstop=4                   " 
set shiftwidth=4                    " vimが挿入するインデントの幅
set expandtab                       " 
set cursorline                      " カーソルのある行をハイライト
set clipboard=unnamed,autoselect    " unnamed=ヤンクしたのをクリップボードに
                                    " autoselect=ハイライトして選択した文字をクリップボードに
" rubyとか用
augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead Rakefile setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

set laststatus=2

set wrap                            " 折り返し
set textwidth=0                     " 自動的に改行が入るのを無効化
set colorcolumn=80,120              " 80文字目にラインいれる
" highlight ColorColumn ctermbg=35    " ラインの色
" highlight ColorColumn guibg=35      " GUIのとき

" 80文字を示す
" highlight OverLength ctermbg=darkgray ctermfg=white
" match OverLength /\%81v.\+/

" python setting
" autocmd FileType python setl autoindent
" autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
" autocmd FileType python setl smartindent tabstop=8 expandtab shiftwidth=4 softtabstop=4


" 挿入モードでのカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" 軟弱モノが！矢印キー使ってんじゃねーよ！！！１１
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" backup 無効
set nowritebackup
set nobackup
set noswapfile

" search
set ignorecase   " 大文字小文字の区別しない
set smartcase     " 大文字がある場合は区別
set incsearch     " インクリメンタルサーチ
set hlsearch      " 検索強調
" ↓表示が重くなるからやめた
" nnoremap n nzz    " 検索先を画面中央に
" nnoremap N Nzz    " 同じ

" Ctrl-kで、コメントアウトをトグルできる
nmap <C-K> <Plug>(caw:i:toggle)
vmap <C-K> <Plug>(caw:i:toggle)

" 表示系
set list                                        " 特殊文字を表示
set listchars=tab:▸\ ,trail:_,eol:↲             " 特殊文字の内容
highlight SpecialKey        ctermfg=darkgray    " 特殊文字の色
highlight NonText           ctermfg=darkgray    " おなじ 

" 全角スペースを表示する
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction
if has('syntax')
        augroup ZenkakuSpace
                    autocmd!
                    autocmd ColorScheme       * call ZenkakuSpace()
                    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
        augroup END
        call ZenkakuSpace()
endif

" 無駄なスペースを表示する
highlight WhitespaceEOL cterm=underline ctermbg=red guibg=#FF0000
au BufWinEnter * let w:m1 = matchadd("WhitespaceEOL", ' +$')
au WinEnter * let w:m1 = matchadd("WhitespaceEOL", ' +$')

set title
set showmatch matchtime=1
syntax on

" init
" indent-guides
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi SpecialKey term=bold ctermfg=238
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd term=bold ctermfg=238 ctermbg=237
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven term=bold ctermfg=238 ctermbg=235
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1
" neocomplete
let g:jscomplete_user = ['dom', 'moz', 'xpcom']
autocmd FileType javascript :setl omnifunc=jscomplete#CompleteJS
" syntastic
let g:synstastic_enable_signs = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_mode_map = {
\ "mode":"active",
\ "active_filetypes":["javascript","json"],
\}
" vim airline
" let g:airline_theme = 'badwolf'
let g:airline#extensions#tabline#enabled = 1
let airline_detect_modified = 1
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:unite_force_overwrite_statusline = 0
" easymotion requires vim >7.3
let g:EasyMotion_do_mapping = 0 "Disable default mappings
nmap <Space> <Plug>(easymotion-s2)

" nerdtree設定
nnoremap <silent><C-e> :NERDTreeToggle<CR>
