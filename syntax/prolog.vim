" Vim Syntax File
"
" Language:    Prolog
" Maintainers: Aleksandar Dimitrov <aleks.dimitrov@googlemail.com>
" Created:     Jul 31st, 2008
" Changed:     Fri Aug  1 2008
" Remark:      This file mostly follows
"              http://www.sics.se/sicstus/docs/3.7.1/html/sicstus_45.html
"              but also features some SWI-specific enhancements.
"              The BNF cannot be followed strictly, but I tried to do my best.

if version < 600
   syn clear
elseif exists("b:current_syntax")
  finish
endif

syntax case match

syntax keyword prologISOBuiltIn   dynamic var nonvar integer float number atom string 
			\atomic compound

syntax keyword prologSWIBuiltIn   rational callable ground cyclic_term

syntax match   prologPeriod       /\./ contained
syntax match   prologQuotedFormat /\~\(\d*[acd\~DeEgfGiknNpqrR@st\|+wW]\|`.t\)/ contained
syntax match   prologQuoted       /\('.*'\|".*"\)/ contains=prologQuotedFormat,@Spell


syntax region  prologCComment     fold start=/\/\*/ end=/\*\// contains=prologTODO,@Spell
syntax match   prologComment      /%.*/ contains=prologTODO,@Spell
syntax keyword prologTODO         FIXME TODO fixme todo Fixme FixMe Todo ToDo XXX xxx contained


syntax match   prologHeadPunctuation /-->\|:-/ nextgroup=prologBlock
syntax match   prologBodyPunctuation /,\|\./

syntax match   prologAtom         /\<\l\w*\>/ contained
syntax match   prologVariable     /\<\u\w*\>/ contained

syntax region  prologPredicate    start=/\<\l\w*\>(/ end=/)/ contains=prologPredicate,@prologTerms

syntax region  prologList         start=/\[/ end=/\]/ contains=@prologListDelimiters,@prologTerms
syntax match   prologListDelimiters /,/ contained

syntax region  prologBlock        fold start=/:-/ms=e end=/\./me=s contains=@prologComments,prologList,prlogBodyPunctuation
syntax region  prologDCGBlock     fold start=/-->/ms=e end=/\./me=s contains=@prologComments,prologList,prlogBodyPunctuation,prologDCGSpecials

syntax cluster prologComments     contains=prologCComment,prologComment
syntax cluster prologTerms        contains=prologVariable,prologAtom,prologList,prologPredicate

highlight link prologAtom         Constant
highlight link prologVariable     Identifier
highlight link prologISOBuiltIn   Keyword
highlight link prologSWIBuiltIn   Keyword
highlight link prologQuoted       String
highlight link prologQuotedFormat Special
highlight link prologPeriod       Error
highlight link prologList         Type
highlight link prologPredicate    Statement
highlight link prologListDelimiters Error
highlight link prologHeadPunctuation Error
highlight link prologBodyPunctuation Special


syn sync minlines=20 maxlines=50

let b:current_syntax = "prolog"
