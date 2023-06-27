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
]])
