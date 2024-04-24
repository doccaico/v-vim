let s:save_cpo = &cpo
set cpo&vim

function! autofmt#fmt()
	if exists('g:v_autofmt_bufwritepre') && g:v_autofmt_bufwritepre || exists('b:v_autofmt_bufwritepre') && b:v_autofmt_bufwritepre
		let substitution = system("v fmt", join(getline(1, line('$')), "\n"))
		if v:shell_error == 0
			let [_, lnum, colnum, _] = getpos('.')
			%delete
			call setline(1, split(substitution, "\n"))
			call cursor(lnum, colnum)
		endif
	endif
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
