
"# 配置先のディレクトリを作成
"$ mkdir -p ~/.vim/bundle
"# NeoBundleをリポジトリから取得
"$ git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

if has('vim_starting')
   " 初回起動時のみruntimepathにneobundleのパスを指定する"
   set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" NeoBundleを初期化"
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'gko/vim-coloresque'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'rhysd/accelerated-jk'
NeoBundle 'KabbAmine/vCoolor.vim'
NeoBundle 'vim-scripts/VIM-Color-Picker'
NeoBundle 'cocopon/iceberg.vim'
NeoBundle 'romainl/Apprentice'
NeoBundle 'itchyny/vim-parenmatch' "対応する括弧の表示
NeoBundle 'zah/nim.vim'
NeoBundle 'posva/vim-vue'
NeoBundle 'honza/vim-snippets'

NeoBundle 'neoclide/coc.nvim', 'release', { 'build': { 'others': 'git checkout release'} }
NeoBundle 'peitalin/vim-jsx-typescript'

call neobundle#end()

" ファイルタイプ別のプラグイン/インデントを有効にする"
filetype plugin indent on

colorscheme apprentice

" TypeScriptのsyntaxをJavaScriptと統一するため(TypeScriptのsyntaxに良いデザインがない), filetypeをjavascriptに変更する
" autocmd BufNewFile,BufRead *.ts :set filetype=javascript
" autocmd BufNewFile,BufRead *.tsx :set filetype=typescript

" 新しいファイルを開くときは常にタブで開く
function OpenFilesToTabs()
    :bfirst
    :tab ba
endfunction
autocmd BufNewFile,BufRead * :call OpenFilesToTabs()

runtime! archlinux.vim

"カーソルを括弧に重ねない"
let loaded_matchparen = 1

" do not load defaults if ~/.vimrc is missing"
let skip_defaults_vim=1

" 矢印キーでABCDを入力しない
set nocompatible
" ファイルを上書きする前にバックアップを作ることを無効化"
set nowritebackup
" ファイルを上書きする前にバックアップを作ることを無効化"
set nobackup
" vim の矩形選択で文字が無くても右へ進める"
set virtualedit=block
" 挿入モードでバックスペースで削除できるようにする"
set backspace=indent,eol,start
" 全角文字専用の設定"
set ambiwidth=double
" wildmenuオプションを有効(vimバーからファイルを選択できる)"
set wildmenu

" 検索"
" 検索するときに大文字小文字を区別しない"
set ignorecase
" 小文字で検索すると大文字と小文字を無視して検索"
set smartcase
" 検索がファイル末尾まで進んだら、ファイル先頭から再び検索"
set wrapscan
" インクリメンタル検索 (検索ワードの最初の文字を入力した時点で検索が開始)"
set incsearch
" 検索結果をハイライト表示"
set hlsearch

" 表示設定"
" エラーメッセージの表示時にビープを鳴らさない"
set noerrorbells
" Windowsでパスの区切り文字をスラッシュで扱う"
set shellslash
" 対応する括弧やブレースを表示"
set showmatch matchtime=1
" インデント方法の変更"
set cinoptions+=:0

" メッセージ表示欄を2行確保 status lineの下部余白の高さ
set cmdheight=1

" ステータス行を常に表示"
set laststatus=2
" ウィンドウの右下にまだ実行していない入力中のコマンドを表示"
set showcmd
" 省略されずに表示"
set display=lastline
" タブ文字を CTRL-I で表示し、行末に $ で表示する"
set list
" 行末のスペースを可視化"
set listchars=tab:^\ ,trail:~
" コマンドラインの履歴を10000件保存する"
set history=10000
" コメントの色を水色"
hi Comment ctermfg=3
" 入力モードでTabキー押下時に半角スペースを挿入"
set expandtab
" インデント幅"
set shiftwidth=2
" タブキー押下時に挿入される文字幅を指定"
set softtabstop=2
" ファイル内にあるタブ文字の表示幅"
set tabstop=2

"VUEの場合はタブ関連を変更
autocmd BufNewFile,BufRead *.vue setlocal tabstop=2 softtabstop=2 shiftwidth=2

" ツールバーを非表示にする"
set guioptions-=T
" yでコピーした時にクリップボードに入る"
set guioptions+=a
" メニューバーを非表示にする"
set guioptions-=m
" 右スクロールバーを非表示"
set guioptions+=R
" 対応する括弧を強調表示"
set showmatch
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する"
set smartindent
" スワップファイルを作成しな"い
set noswapfile
" 検索にマッチした行以外を折りたたむ(フォールドする)機能"
set nofoldenable
" タイトルを表示"
set title
" 行番号の表示"
set number
" ヤンクでクリップボードにコピー"
set clipboard=unnamed,autoselect
" シンタックスハイライト"
syntax on
" すべての数を10進数として扱う"
set nrformats=
" 行をまたいで移動"
set whichwrap=b,s,h,l,<,>,[,],~
" バッファスクロール"
set mouse=a

" auto comment off
augroup auto_comment_off
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=r
  autocmd BufEnter * setlocal formatoptions-=o
augroup END

" HTML/XML閉じタグ自動補完
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

" 編集箇所のカーソルを記憶
if has("autocmd")
  augroup redhat
    " In text files, always limit the width of text to 78 characters
    autocmd BufRead *.txt set tw=78
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
  augroup END
endif


" タブ番号を振る
function! s:SID_PREFIX()
        return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

function! s:my_tabline()  "{{{
        let s = ''
        for i in range(1, tabpagenr('$'))
                let bufnrs = tabpagebuflist(i)
                let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
                let no = i  " display 0-origin tabpagenr.
                let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
                let title = fnamemodify(bufname(bufnr), ':t')
                let title = '[' . title . ']'
                let s .= '%'.i.'T'
                let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
                let s .= no . ':' . title
                let s .= mod
                let s .= '%#TabLineFill# '
        endfor
        let s .= '%#TabLineFill#%T%=%#TabLine#'
        return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2
nnoremap    [Tag]   <Nop>
nmap    t [Tag]

map <silent> [Tag]c :tablast <bar> tabnew<CR>


" vim用のalias用bashrcである~/.vim_bashrcを読み込む
let $BASH_ENV = "~/.vim_bashrc"

" 括弧を補完 autocloseが重いので
inoremap {<Enter> {<CR>}<ESC><S-o>
inoremap (<Enter> (<CR>)<ESC><S-o><TAB>
"autocmd FileType javascript inoremap {<Enter> {<CR>}<ESC><S-o><ESC><S-o><CR><TAB>
"autocmd FileType php inoremap {<Enter> {<CR>}<ESC><S-o><ESC><S-o><CR><TAB>
inoremap { {}<Left>
inoremap [ []<Left>
inoremap ( ()<Left>
"inoremap ) )<delete><delete>
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap ` ``<Left>

" :CocListをショートカットで起動
nnoremap <C-f> :CocList files<CR>
nnoremap <C-@> :CocList<CR>

" VUEのシンタックスハイライトが効かなくなる対策
autocmd Filetype vue syntax sync fromstart

" setting 文字コードをUFT-8に設定"
set fenc=utf-8

let g:word_count=0
let g:trail_count=0
let g:no_space_curly_bracket_count=0

function WordCount()
  return g:word_count
endfunction

function TrailCount()
  return g:trail_count
endfunction

function NoSpaceCurlyBracketCount()
  return g:no_space_curly_bracket_count
endfunction

function UpdateCount()
  let lnum = 1
  let a = 0
  let t = 0
  let b = 0
  while lnum <= line('$')
    let a = a + len(split(getline(lnum), '\zs'))
    let t = t + len(split(matchstr(getline(lnum), '\s\+$'), '\zs'))
    let b = b + len(split(matchstr(getline(lnum), '{\([a-zA-Z0-9]\)\@='), '\zs'))
    let b = b + len(split(matchstr(getline(lnum), '\([a-zA-Z0-9]\)\@<=}'), '\zs'))
    let lnum = lnum + 1
  endwhile
  let g:word_count = a
  let g:trail_count = t
  let g:no_space_curly_bracket_count = b
endfunction

augroup WordCounter
  au! CursorHold,CursorHoldI,CursorMoved,CursorMovedI * call UpdateCount()
augroup END

" Insertを離脱したらtrailing(余計なスペース)を自動で除去
function RemoveTrail()
  if expand("%f") == "/etc/vimrc"
    return
  endif
  if TrailCount() > 0
    " カーソルの現在地を取得(置換時の\geのeはエラーを表示しない)
    let pos = getpos(".")
    execute ":%s/\\s\\+$//ge"
    " カーソルを置換前の位置に戻す
    execute ":call setpos('.', pos)"
  endif
endfunction
augroup RemoveTrailGr
  autocmd InsertLeave * call RemoveTrail()
augroup END

" {と}で, スペースを両端に含まない場合は見やすいように両端にスペースを挿入
function InsertBracketsSpaces()
  if ("%f") == '/etc/vimrc'
    return
  endif
  if NoSpaceCurlyBracketCount() > 0
    let pos = getpos(".")
    execute ":%s/{\\([a-zA-Z0-9]\\)\\@=/{ /ge"
    execute ":%s/\\([a-zA-Z0-9]\\)\\@<=}/ }/ge"
    execute ":call setpos('.', pos)"
  endif
endfunction
augroup InsertBracketsSpacesGr
  autocmd FileType javascript :autocmd! InsertLeave * call InsertBracketsSpaces()
  autocmd FileType typescript :autocmd! InsertLeave * call InsertBracketsSpaces()
  autocmd FileType typescriptreact :autocmd! InsertLeave * call InsertBracketsSpaces()
augroup END

" 現在の(x, y)位置を返す
let g:posX = 0
let g:posY = 0
function CursorPositionX()
  return g:posX
endfunction
function CursorPositionY()
  return g:posY
endfunction

function UpdateCursorPosition()
  let pos = getpos('.')
  let g:posY = pos[1]
  let g:posX = pos[2]
endfunction

augroup CursorPosition
  au! CursorHold,CursorHoldI,CursorMoved,CursorMovedI * call UpdateCursorPosition()
augroup END

" status line
let g:modeStr = "NORMAL"
function WhatMode()
  return g:modeStr
endfunction
augroup EventSetMode
  autocmd!
  autocmd InsertEnter * let g:modeStr = "INSERT"
  autocmd InsertLeave * let g:modeStr = "NORMAL"
augroup END

" git brach を取得
let g:gitBranch = ""
function GetGitBranch()
  return g:gitBranch
endfunction

function SetGitBranch()
  " ちなみに Կ も悪くない
  let branch = trim(system("git status 2> /dev/null | awk -F\"'\" '{print $2}' | xargs echo"))
  if len(branch) > 1
    let g:gitBranch = ' Git վ(' . branch . ')'
  endif
endfunction
augroup GitBranchGr
  autocmd BufNewFile,BufRead * :call SetGitBranch()
augroup END

hi User1 ctermbg=NONE ctermfg=51
hi User2 ctermbg=NONE ctermfg=245
hi User3 ctermbg=NONE ctermfg=81
hi User4 ctermbg=NONE ctermfg=239

" status line
set updatetime=0
set statusline=
set statusline+=\ \ %{WhatMode()}\ \ 
" 読込のみなら[読専]と表示
set statusline+=%r
" ヘルプページなら[HELP]と表示
set statusline+=%h
" ファイル名表示
set statusline+=%1*🎓%2*%f\ 
" 変更チェック表示
set statusline+=%m
" これ以降は右寄せ表示
set statusline+=%=
set statusline+=\ %4*%{CursorPositionY()}%4*Ln,%4*%{CursorPositionX()}%4*Col
" git branch
set statusline+=%3*\%{GetGitBranch()}
" ファイルの種類
set statusline+=%3*\ [%{&filetype}]\ %4*\|
" file encoding
set statusline+=%3*\ %{&fileencoding}
set statusline+=\ %{&fileformat}
" 現在行数/全行数
set statusline+=\ %3*%L%4*lines
set statusline+=\ %3*🖉\ %{WordCount()}%4*words
set statusline+=\ %3*🛠%{TrailCount()}%4*trail\ 

" apprentice.vimに書いてあったものをこちらに書いて上書き。ctermfgまで必須。guibg以降は僕の環境ではいらないかも
hi StatusLine       ctermbg=NONE  ctermfg=249  guibg=#87875f guifg=#262626 cterm=NONE           gui=NONE
hi StatusLineNC     ctermbg=NONE  ctermfg=249  guibg=#444444 guifg=#87875f cterm=NONE           gui=NONE

hi StatusLineTerm   ctermbg=NONE  ctermfg=249  guibg=#87875f guifg=#262626 cterm=NONE           gui=NONE
hi StatusLineTermNC ctermbg=NONE  ctermfg=249  guibg=#444444 guifg=#87875f cterm=NONE           gui=NONE

augroup InsertHook
  autocmd!
  autocmd InsertEnter * hi StatusLine ctermbg=NONE ctermfg=36
  autocmd InsertLeave * hi StatusLine ctermbg=NONE ctermfg=249
augroup END

set timeout timeoutlen=10 ttimeoutlen=10

" タブの色
" activeなタブ
hi TabLineSel ctermbg=35 ctermfg=White
" 非activeなタブ
hi TabLine ctermbg=235 ctermfg=247
" タブ背面
hi TabLineFill ctermbg=235 ctermfg=237


" 行番号のハイライト
" カーソルラインの表示は必須なので, カーソルラインの色を消す
set cursorline
hi clear CursorLine

" coc.nvimのエラー表示の矢印のデザイン
highlight CocErrorSign ctermfg=15 ctermbg=203
highlight CocInfoSign ctermfg=0 ctermbg=11

" タブをCtrlと矢印キーで移動できるように
nnoremap <S-Tab> :tabp<CR>
nnoremap <Tab> :tabn<CR>
