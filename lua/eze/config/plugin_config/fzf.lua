vim.cmd([[
    let g:fzf_preview_window = ['right,50%', 'ctrl-/']

    let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }

    let g:fzf_colors =
    \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Normal'],
      \ 'fg+':     ['fg', 'Normal'],
      \ 'bg+':     ['bg', 'Normal'],
      \ 'hl+':     ['fg', 'Normal'],
      \ 'info':    ['fg', 'Normal'],
      \ 'border':  ['fg', 'Normal'],
      \ 'prompt':  ['fg', 'Normal'],
      \ 'pointer': ['fg', 'Normal'],
      \ 'marker':  ['fg', 'Normal'],
      \ 'spinner': ['fg', 'Normal'],
      \ 'header':  ['fg', 'Normal'] }

    "FZF Buffer Delete
    function! s:list_buffers()
        redir => list
        silent ls
        redir END
        return split(list, "\n")
    endfunction

    function! s:delete_buffers(lines)
        execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
    endfunction

    command! BD call fzf#run(fzf#wrap({
        \ 'source': s:list_buffers(),
        \ 'sink*': { lines -> s:delete_buffers(lines) },
        \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
    \ }))
]])
