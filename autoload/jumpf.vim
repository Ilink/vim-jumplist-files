"   The VIM LICENSE applies to this script; see ':help copyright'.


function! jumpf#doFileJump(isForward)
    let allJumps = jumpf#common#GetJumps("jumps")
	let dirJumps = jumpf#common#SliceJumpsInDirection(allJumps, a:isForward)

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
    let jumpIdx = -1

    for jump in dirJumps 
        let curJumpDict = jumpf#common#ParseJumpLine(jump)
        let curJumpText = curJumpDict["text"] 
        
        if filereadable(curJumpText)
            let curEditedFname = expand("%")
            if curJumpText != curEditedFname
                " echom "matched " . curJumpText
                let jumpIdx = curJumpDict["count"]
                break
            endif
        endif
        let idx += 1
    endfor 

    if jumpIdx > -1 
        echom "doing jump to " . jumpIdx 
        if a:isForward
            let jumpCmd = "\<c-i>"
        else
            let jumpCmd = "\<c-o>"
        endif

        " This doesnt work if the messages window is open 
        " (this happens when we are logging things with echom)
        execute "normal! " . jumpIdx . jumpCmd
    endif


endfunction

function! jumpf#jumpForward()
    call jumpf#doFileJump(1)
endfunction

function! jumpf#jumpBack()
    call jumpf#doFileJump(0)
endfunction

