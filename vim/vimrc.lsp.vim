nmap ,dec <plug>(lsp-declaration)
nmap ,def <plug>(lsp-definition)
nmap ,dia <plug>(lsp-document-diagnostics)
nmap ,ref <plug>(lsp-references)

if executable('solargraph')
  " gem install solargraph
  au User lsp_setup call lsp#register_server({
    \ 'name': 'solargraph',
    \ 'cmd': {server_info->[&shell, &shellcmdflag, 'solargraph stdio']},
    \ 'initialization_options': {"diagnostics": "true"},
    \ 'whitelist': ['ruby'],
    \ })
endif
