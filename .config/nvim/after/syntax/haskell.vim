" vim: sw=4
"=============================================================================

hi! link Conceal Operator
setlocal conceallevel=2

syntax match hsEqual1 contained "=\ze="    conceal cchar=≡
syntax match hsEqual2 contained "=\ze[^=]" conceal cchar= 
syntax match hsEqual "==" contains=hsEqual1,hsEqual2

syntax match hsNotEqual1 contained "\/" conceal cchar=≢
syntax match hsNotEqual2 contained "="  conceal cchar= 
syntax match hsNotEqual "/=" contains=hsNotEqual1,hsNotEqual2

syntax match hsLessEq1 contained "<" conceal cchar=≤
syntax match hsLessEq2 contained "=" conceal cchar= 
syntax match hsLessEq "<=" contains=hsLessEq1,hsLessEq2

syntax match hsGreaterEq1 contained ">" conceal cchar=≥
syntax match hsGreaterEq2 contained "=" conceal cchar= 
syntax match hsGreaterEq ">=" contains=hsGreaterEq1,hsGreaterEq2

syntax match hsArrowRight1 contained "-" conceal cchar=→
syntax match hsArrowRight2 contained ">" conceal cchar= 
syntax match hsArrowRight "->" contains=hsArrowRight1,hsArrowRight2

syntax match hsArrowLeft1 contained "<" conceal cchar=←
syntax match hsArrowLeft2 contained "-" conceal cchar= 
syntax match hsArrowLeft "<-" contains=hsArrowLeft1,hsArrowLeft2

syntax match hsDoubleArrowRight1 contained "=" conceal cchar=⇒
syntax match hsDoubleArrowRight2 contained ">" conceal cchar= 
syntax match hsDoubleArrowRight "=>" contains=hsDoubleArrowRight1,hsDoubleArrowRight2

syntax match hsLambda "\\\ze[[:alpha:][:space:]_([]" conceal cchar=λ

syntax match hsMultiply "*\ze[^>]" conceal cchar=×

syntax match hsPi1 contained "p" conceal cchar=π
syntax match hsPi2 contained "i" conceal cchar= 
syntax match hsPi "pi" contains=hsPi1,hsPi2

syntax match hsTau1 contained "t" conceal cchar=τ
syntax match hsTau2 contained "a" conceal cchar= 
syntax match hsTau3 contained "u" conceal cchar= 
syntax match hsTau "tau" contains=hsTau1,hsTau2,hsTau3

