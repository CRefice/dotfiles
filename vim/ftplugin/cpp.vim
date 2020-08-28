let b:ale_linters = ['clangd', 'clangtidy']
let b:ale_fixers = ['clang-format']

let b:ale_c_clangformat_options = '-style=file'
let b:ale_cpp_gcc_options = '-std=c++latest -Wall'
let b:ale_cpp_clangtidy_checks = [
	\	'bugprone-*', 'cppcoreguidelines-*', 'misc-*',
	\	'modernize-*', '-modernize-use-trailing-return-type',
	\	'performance-*'
	\]
