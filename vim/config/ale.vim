" Linting behavior
let g:ale_lint_delay=1000

" Fixing behavior
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'c': ['clang-format'],
\   'cpp': ['clang-format'],
\   'rust': ['rustfmt'],
\}

" Sign gutter
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '!'

" Status line message
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s'
