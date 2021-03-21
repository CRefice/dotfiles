function! LightlineFilename()
	let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
	let modified = &modified ? ' +' : ''
	return filename . modified
endfunction

let g:lightline = {
			\   'active': {
			\     'left':[ [ 'mode', 'paste' ],
			\              [ 'gitbranch', 'readonly', 'filename' ]
			\     ]
			\   },
			\   'component': {
			\     'lineinfo': ' %3l:%-2v',
			\   },
			\   'component_function': {
			\			'filename': 'LightlineFilename',
			\			'gitbranch': 'fugitive#head',
			\   },
			\		'colorscheme': 'horizon',
			\		'separator': {
			\			'left': '', 'right': ''
			\		},
			\		'subseparator': {
			\			'left': '', 'right': ''
			\		}
			\ }
