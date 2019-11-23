" Linting behavior
let g:ale_lint_delay=1000
let g:ale_cpp_clang_options = '-std=c++17 -Wall'
let g:ale_cpp_gcc_options = '-std=c++17 -Wall'

let g:ale_cpp_clangtidy_checks = [
			\		'bugprone-*', 'cppcoreguidelines-*',
			\		'misc-*', 'modernize-*', '-modernize-use-trailing-return-type',
			\		'performance-*'
			\]

let g:ale_linters = {
			\		'cpp': ['clangtidy', 'clang', 'gcc'],
			\}

" Fixing behavior
let g:ale_fixers = {
			\   '*': ['remove_trailing_lines', 'trim_whitespace'],
			\   'javascript': ['prettier'],
			\   'vue': ['prettier'],
			\   'html': ['prettier'],
			\   'css': ['prettier'],
			\   'c': ['clang-format'],
			\   'python': ['black', 'isort'],
			\   'cpp': ['clang-format'],
			\   'rust': ['rustfmt'],
			\}
let g:ale_c_clangformat_options = '-style=file'

" Sign gutter
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '!'

" Status line message
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s'
