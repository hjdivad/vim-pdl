if exists('b:current_syntax')
  finish
endif

" https://linkedin.github.io/rest.li/pdl_schema


" Maybe syntax sync match would be faster for large files
syntax sync fromstart

syntax keyword pdlTopLevelKeyword namespace import package
highlight link pdlTopLevelKeyword Keyword

" TODO: typeref declaration
" TODO: fixed declaration

" Record Declarations {{{
" TODO: includes A,B
" TODO: properties
syntax region pdlRecordDeclaration start='\v<record>' end='\v\}' contains=pdlRecordKeyword,pdlRecordIdentifier,pdlFieldSelection skipwhite skipnl skipempty keepend

syntax keyword pdlRecordKeyword contained record
highlight link pdlRecordKeyword Keyword
syntax match pdlRecordIdentifier contained /\v<\K\k*>/
highlight link pdlRecordIdentifier Type

" TODO: skip commas at end of line?
" TODO: annotations
syntax region pdlFieldSelection contained start='\v\{' end='\v\}' contains=pdlFieldDeclaration skipwhite skipnl skipempty
" TODO: defaults (x: int = 1)
" TODO: enums
" TODO: aliased unions
" TODO: properties
syntax region pdlFieldDeclaration contained start='\v<\K\k*>:' end='\v[\r\n]' contains=pdlFieldName,pdlFieldTypeKeyword skipwhite skipempty

" TODO: escaped field name eg `record`:
syntax match pdlFieldName contained /\v<\K\k*>(:)@=/
highlight link pdlFieldName Identifier

syntax keyword pdlFieldTypeKeyword contained array map union
highlight link pdlFieldTypeKeyword Keyword

" }}}

syntax match pdlLineComment '\v\/\/.*$'
highlight link pdlLineComment Comment
syntax region  pdlMultilineComment start='/\v\*'  end='\v\*/'  fold
highlight link pdlMultilineComment Comment


let b:current_syntax = 'pdl'

" vim: set fdm=marker
