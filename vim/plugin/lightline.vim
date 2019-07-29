let g:lightline = {
      \  'colorscheme': 'jellybeans',
      \  'active': {
      \    'left': [
      \      ['mode', 'paste'],
      \      ['readonly', 'filename', 'modified', 'ale'],
      \    ]
      \  },
      \  'component_function': {
      \    'ale': 'ALEGetStatusLine'
      \  }
      \}
let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }
let g:lightline.component_type = {
      \  'linter_checking': 'right',
      \  'linter_warnings': 'warning',
      \  'linter_errors': 'error',
      \  'linter_ok': 'right',
      \ }
let g:lightline.active = {
      \  'left': [
      \    [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]
      \   ]
      \ }
