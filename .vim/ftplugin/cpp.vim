let b:ale_linters = ['cc', 'clangd', 'clangtidy']
let b:ale_fixers = ['clang-format']

let b:ale_c_clangformat_options = '-style=file'

let g:ale_c_cc_options = '-std=clatest -Wall'
let g:ale_cpp_cc_options = '-std=c++latest -Wall'

let b:ale_cpp_clangtidy_checks = [
	\	'bugprone-*', 'cppcoreguidelines-*', 'misc-*',
	\	'modernize-*', '-modernize-use-trailing-return-type',
	\	'performance-*'
	\]
