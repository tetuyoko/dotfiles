if executable('gopls')
  augroup LspGo
    au!
    autocmd User lsp_setup call lsp#register_server({
          \ 'name': 'go-lang',
          \ 'cmd': {server_info->['gopls']},
          \ 'whitelist': ['go'],
          \ 'workspace_config': {'gopls': {
          \     'staticcheck': v:true,
          \     'completeUnimported': v:true,
          \     'caseSensitiveCompletion': v:true,
          \     'usePlaceholders': v:true,
          \     'completionDocumentation': v:true,
          \     'watchFileChanges': v:true,
          \     'hoverKind': 'SingleLine',
          \   }},
          \ })
    autocmd FileType go setlocal omnifunc=lsp#complete
    autocmd FileType go nmap <buffer> gd <plug>(lsp-definition)
  augroup END
endif
