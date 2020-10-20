if empty(globpath(&rtp, 'autoload/lightline.vim'))
    finish
endif
if !has('nvim')
  let g:lightline={
    \'active': {
      \'left': [ [ 'mode', 'paste' ],
      \[ 'readonly', 'filename' ] ],
      \'right':[ [ 'lineinfo' ], [ 'percent' ],
      \[ 'fileformat', 'fileencoding', 'filetype' ] ],
      \},
    \'component_function': {
      \'filename': 'LightlineFilename',
      \ },
    \ 'mode_map': {
      \ 'n' : 'N',
      \ 'i' : 'I',
      \ 'R' : 'R',
      \ 'v' : 'V',
      \ 'V' : 'VL',
      \ "\<C-v>": 'VB',
      \ 'c' : 'C',
      \ 's' : 'S',
      \ 'S' : 'SL',
      \ "\<C-s>": 'SB',
      \ 't': 'T',
      \},
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

function! LightlineFugitive()
return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

if empty(globpath(&rtp, 'autoload/lightline/colorscheme/tokyonight.vim'))
  let g:lightline.colorscheme = 'wombat'
  finish
endif

let g:lightline.colorscheme = 'tokyonight'
