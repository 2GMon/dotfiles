let g:ctrlp_working_path_mode = 'wa'
let g:ctrlp_max_files = 50000

let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:100'

" v8.2.1665 is required
" let g:ctrlp_match_func = {'match': 'ctrlp_matchfuzzy#matcher'}

let g:ctrlp_prompt_mappings = {
            \ 'PrtDeleteEnt()':       ['<F7>', '<c-c>'],
            \ 'PrtExit()':            ['<esc>', '<c-g>'],
            \ }
