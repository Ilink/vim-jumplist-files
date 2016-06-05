"   The VIM LICENSE applies to this script; see ':help copyright'.


if exists('g:loaded_jumpf') || (v:version < 700)
    finish
endif
let g:loaded_jumpf = 1

" Commands
"""""""""""""""""""""""""""""""
com! -bar JumpFileBack call jumpf#jumpBack() 
com! -bar JumpFileForward call jumpf#jumpForward() 


" Mappings
"""""""""""""""""""""""""""""""



