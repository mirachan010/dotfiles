let g:gitgutter_sign_removed="-"
if !has('nvim')
  let g:lightline={
        \'active': {
        \'left': [ [ 'mode', 'paste' ],
        \[ 'gitbranch', 'gitstatus', 'readonly', 'filename' ]
        \],
        \'right':[
        \[ 'lineinfo' ], [ 'percent' ],
        \[ 'fileformat', 'fileencoding', 'filetype' ]
        \],
        \},
        \'component_function': {
        \  'gitbranch': 'gina#component#repo#branch',
        \  'gitstatus': 'MyGitGutter',
        \  'filename': 'LightlineFilename',
        \ },
        \}
else
  let g:lightline = {
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename' ] ]
        \ },
        \ 'component_function': {
        \   'filename': 'LightlineFilename',
        \   'cocstatus': 'coc#status',
        \   'currentfunction': 'CocCurrentFunction'
        \ },
        \ }
endif

function! MyGitStatus() abort
  let staged = gina#component#status#staged()
  let unstaged = gina#component#status#unstaged()
  let conflicted = gina#component#status#conflicted()
  return printf(
        \ 's: %s, u: %s, c: %s',
        \ staged,
        \ unstaged,
        \ conflicted,
        \)
endfunction

function! MyGitGutter()
  if ! exists('*GitGutterGetHunkSummary')
        \ || ! get(g:, 'gitgutter_enabled', 0)
        \ || winwidth('.') <= 90
    return ''
  endif
  let symbols = [
        \ g:gitgutter_sign_added . ' ',
        \ g:gitgutter_sign_modified . ' ',
        \ g:gitgutter_sign_removed . ' '
        \ ]
  let hunks = GitGutterGetHunkSummary()
  let ret = []
  for i in [0, 1, 2]
    if hunks[i] > 0
      call add(ret, symbols[i] . hunks[i])
    endif
  endfor
  return join(ret, ' ')
endfunction

let g:lightline.tab_component_function = {
      \'filename':'LightlineTabFilename',
      \ 'modified': 'lightline#tab#modified',
      \ 'readonly': 'lightline#tab#readonly',
      \ 'tabnum': 'lightline#tab#tabnum'}
let g:lightline.tab = {
      \ 'active': [ 'tabnum', 'filename', 'modified' ],
      \ 'inactive': [ 'tabnum', 'filename', 'modified' ]
      \ }

function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[NoN]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction

function! LightlineTabFilename(n) abort
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let _ = pathshorten(expand('#'.buflist[winnr - 1].':f'))
  return _ !=# '' ? _ : '[No Name]'
endfunction

function! LightlineModified()
  if &filetype == 'help'
    return ''
  elseif &modified
    return '+'
  elseif &modifiable
    return ''
  else
    return '-'
  endif
endfunction

function! LightlineReadonly()
  if &filetype == 'help'
    return ''
  elseif &readonly
    return 'x'
  else
    return ''
  endif
endfunction


if empty(globpath(&rtp, 'autoload/lightline/colorscheme/tokyonight.vim'))
  let g:lightline.colorscheme = 'wombat'
  finish
endif

let g:lightline.colorscheme = 'tokyonight'
