function! IncludeGuards(...)
	let save_view = winsaveview()

	let strlist = a:000 + [ expand("%:t") ]
	let gatename = substitute(toupper(join(strlist, "_")), "[^A-Za-z0-9_]", "_", "g")
	execute "normal! ggO#ifndef " . gatename
	execute "normal! o#define " . gatename . " \<cr>"
	execute "normal! Go#endif"

	call winrestview(save_view)
endfunction
