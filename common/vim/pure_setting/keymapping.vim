"長い一行が回ってきたときでもノーマルモードでhjklで快適に過ごすため
"あとちょっとのついで
noremap k gk
noremap j gj
noremap H <NOP>
noremap L <NOP>
noremap H ^
noremap L $
nnoremap u g-
nnoremap <C-R> g+

let mapleader = "\\"
"
"if in nomalmode save file
inoremap <silent> jj <ESC>:<C-u>w<CR>

"dotfilesの編集されたのを読み込み直す
nmap <Leader>.. :<C-u>source $MYVIMRC<CR>
