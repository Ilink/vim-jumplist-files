function! jumpf#getFileJumps()
    let jumps = jumpf#common#GetJumps("jumps")
	let pastJumps = jumpf#common#SliceJumpsInDirection(jumps, 0)

	" let curJumpIdx = jumpf#common#GetCurrentIndex(jumps)
    " for [k,v] in items(jumps)

    " for jump in jumps
	"     echom string(jump) 
    " endfor

    " echom type(pastJumps)
	" for jump in pastJumps
		" echom type(jump)
		" echom string(jump) 
		" let cur = ""
		" for [k,v] in items(jump)
		"     let cur +=  k . ":" . v . ", "
		" endfor
		" echom cur
	" endfor
	
    let idx = 0
    let foundJumpFile = 0

    for jump in pastJumps
        let curJumpText = jumpf#common#ParseJumpLine(jump)["text"]
        if filereadable(curJumpText)
            let curEditedFname = expand("%")
            if curJumpText != curEditedFname
                " echom "matched " . curJumpText
                let foundJumpFile = 1
                break
            endif
        endif
        let idx += 1
    endfor 

    if foundJumpFile
        " echom "doing jump to " . idx
        " eval "jump " . idx
        " execute "g;".idx
        " execute "normal!" idx . "\<C-o\>"
        " execute "normal!" . idx . "<C-o>"
        execute "normal! " . idx . "\<c-o>"
    endif


endfunction
