let b:ale_linters = ['clangtidy']
let b:ale_fixers = ['clang-format']
let b:ale_c_clangformat_options = '-style=file'
let b:ale_cpp_clangtidy_checks = [
			\	'bugprone-*', 'cppcoreguidelines-*', 'misc-*',
			\	'modernize-*', '-modernize-use-trailing-return-type',
			\	'performance-*'
			\]
