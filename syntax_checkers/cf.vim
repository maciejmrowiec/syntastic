"============================================================================
"File:        cf.vim
"Description: Syntax checking plugin for syntastic.vim
"Maintainer:  Maciej Mrowiec <mrowiec.maciej at gmail dot com>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"
"============================================================================

"============================================================================
"
" CFEngine syntax checker
"
"   require access to: /var/cfengine/bin/cf-promises
"
"============================================================================

if exists("loaded_cf_syntax_checker")
    finish
endif

let loaded_cf_syntax_checker = 1

if !executable("/var/cfengine/bin/cf-promises")
    finish
endif

function! SyntaxCheckers_cf_GetLocList()
    let makeprg = '/var/cfengine/bin/cf-promises --gcc-brief-format -f '. shellescape(expand('%'))
    let errorformat = "%f:%l:%c%m"

    return SyntasticMake({ 'makeprg': makeprg, 'errorformat': errorformat, 'defaults': {'bufnr': bufnr('')}})
endfunction
