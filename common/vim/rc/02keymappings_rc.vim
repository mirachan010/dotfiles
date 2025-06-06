"長い一行が回ってきたときでもノーマルモードでhjklで快適に過ごすため
"あとちょっとのついで
nmap gj gj<SID>g
nmap gk gk<SID>g
nnoremap <script> <SID>gj gj<SID>g
nnoremap <script> <SID>gk gk<SID>g
nmap <SID>g <Nop>

noremap H <NOP>
noremap L <NOP>
noremap H ^
noremap L $
nnoremap u g-
nnoremap <C-R> g+
nnoremap Y y$

"保持しない
nnoremap x "_x
vnoremap x "_x
nnoremap X "_X
vnoremap X "_X

noremap n nzz
nnoremap N Nzz

cnoremap <C-p> <UP>
cnoremap <C-u> <DOWN>

let mapleader = "\\"
"
noremap [vim] <Nop>
nmap <Leader>v [vim]
nnoremap  [vim]e :e ++enc=<CR>
nnoremap  [vim]t :%retab!<CR>
nnoremap  [vim]v :e ~/.vimrc

"if in nomalmode save file
inoremap <silent> jj <ESC>:<C-u>w<CR>

"dotfilesの編集されたのを読み込み直す
nmap <Leader>.. :<C-u>source $MYVIMRC<CR>

"インサートでxしたときに一旦メニューが出てくる
" 入力キーの辞書
let s:compl_key_dict = {
      \ char2nr("\<C-l>"): "\<C-x>\<C-l>",
      \ char2nr("\<C-n>"): "\<C-x>\<C-n>",
      \ char2nr("\<C-p>"): "\<C-x>\<C-p>",
      \ char2nr("\<C-k>"): "\<C-x>\<C-k>",
      \ char2nr("\<C-t>"): "\<C-x>\<C-t>",
      \ char2nr("\<C-i>"): "\<C-x>\<C-i>",
      \ char2nr("\<C-]>"): "\<C-x>\<C-]>",
      \ char2nr("\<C-f>"): "\<C-x>\<C-f>",
      \ char2nr("\<C-d>"): "\<C-x>\<C-d>",
      \ char2nr("\<C-v>"): "\<C-x>\<C-v>",
      \ char2nr("\<C-u>"): "\<C-x>\<C-u>",
      \ char2nr("\<C-o>"): "\<C-x>\<C-o>",
      \ char2nr('s'): "\<C-x>s",
      \ char2nr("\<C-s>"): "\<C-x>s"
      \}
" 表示メッセージ
let s:hint_i_ctrl_x_msg = join([
      \ '<C-l>: While lines',
      \ '<C-n>: keywords in the current file',
      \ "<C-k>: keywords in 'dictionary'",
      \ "<C-t>: keywords in 'thesaurus'",
      \ '<C-i>: keywords in the current and included files',
      \ '<C-]>: tags',
      \ '<C-f>: file names',
      \ '<C-d>: definitions or macros',
      \ '<C-v>: Vim command-line',
      \ "<C-u>: User defined completion ('completefunc')",
      \ "<C-o>: omni completion ('omnifunc')",
      \ "s: Spelling suggestions ('spell')"
      \], "\n")
function! s:hint_i_ctrl_x() abort
  echo s:hint_i_ctrl_x_msg
  let c = getchar()
  return get(s:compl_key_dict, c, nr2char(c))
endfunction
 
inoremap <expr> <C-x>  <SID>hint_i_ctrl_x()
" tags jump
nnoremap <C-]> g<C-]>

" goto
nnoremap gf gF
nnoremap <C-w>f <C-w>F
nnoremap <C-w>gf <C-w>F
nnoremap <C-w><C-f> <C-w>F
nnoremap <C-w>g<C-f> <C-w>F

" split goto
nnoremap -gf        :<C-u>split<Esc>gF
nnoremap <Bar>gf    :<C-u>vsplit<Esc>gF
nnoremap -<C-]>     :<C-u>split<Esc>g<C-]>
nnoremap <Bar><C-]> :<C-u>vsplit<Esc>g<C-]>

"split
nnoremap -     :<C-u>split<CR>
nnoremap <Bar> :<C-u>vsplit<CR>
nnoremap --     :<C-u>split<CR>
nnoremap <Bar><Bar> :<C-u>vsplit<CR>
