"                        _                 _  __
"                       | |               | |/ _|
"   __ _  ___   ___   __| | __      _____ | | |_
"  / _` |/ _ \ / _ \ / _` | \ \ /\ / / _ \| |  _|
" | (_| | (_) | (_) | (_| |  \ V  V / (_) | | |
"  \__, |\___/ \___/ \__,_|   \_/\_/ \___/|_|_|
"   __/ |
"  |___/
"
"     :syntax less
"
" A Vim colorscheme pieced together by Steve Losh.
" Available at http://stevelosh.com/projects/badwolf/
"
" Supporting code -------------------------------------------------------------
" Preamble {{{

if !has("gui_running") && &t_Co != 88 && &t_Co != 256
    finish
endif

set background=dark

if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "goodwolf"

" }}}
" Palette {{{

let s:bwc = {}

let s:bwc.plain = ['e8e6e2', 15]

let s:bwc.snow = ['ffffff', 15]
let s:bwc.coal = ['000000', 16]

let s:bwc.brightgravel   = ['d5c3a1', 252]
let s:bwc.lightgravel    = ['998f84', 245]
let s:bwc.gravel         = ['857f78', 243]
let s:bwc.mediumgravel   = ['666462', 241]
let s:bwc.deepgravel     = ['45413b', 238]
let s:bwc.deepergravel   = ['35322d', 236]
let s:bwc.darkgravel     = ['242321', 235]
let s:bwc.blackgravel    = ['1c1b1a', 233]
let s:bwc.blackestgravel = ['141413', 232]

" A color sampled from a highlight in a photo of a glass of Dale's Pale Ale on
" my desk.
let s:bwc.dalespale = ['fade3e', 221]

" A beautiful tan from Tomorrow Night.
let s:bwc.dirtyblonde = ['f4cf86', 222]

" Delicious, chewy red from Made of Code for the poppiest highlights.
let s:bwc.taffy = ['ff2c4b', 196]

" Another chewy accent, but use sparingly!
let s:bwc.saltwatertaffy = ['8cffba', 121]

" The star of the show comes straight from Made of Code.
"
" You should almost never use this.  It should be used for things that denote
" 'where the user is', which basically consists of:
"
" * The cursor
" * A REPL prompt
let s:bwc.tardis = ['0a9dff', 39]

" This one's from Mustang, not Florida!
let s:bwc.orange = ['ffa724', 214]

" A limier green from Getafe.
let s:bwc.lime = ['aeee00', 154]

let s:bwc.green = ['86ab2b', 154]

" Rose's dress in The Idiot's Lantern.
let s:bwc.dress = ['ff9eb8', 211]

" Another play on the brown from Clouds Midnight.  I love that color.
let s:bwc.toffee = ['b88853', 137]

" Also based on that Clouds Midnight brown.
let s:bwc.coffee    = ['c7915b', 173]
let s:bwc.darkroast = ['88633f', 95]

" }}}
" Highlighting Function {{{
function! GoodWolfHL(group, fg, ...)
    " Arguments: group, guifg, guibg, gui, guisp

    let histring = 'hi ' . a:group . ' '

    if strlen(a:fg)
        if a:fg == 'fg'
            let histring .= 'guifg=fg ctermfg=fg '
        elseif a:fg == 'none'
            let histring .= 'guifg=NONE ctermfg=NONE '
        else
            let c = get(s:bwc, a:fg)
            let histring .= 'guifg=#' . c[0] . ' ctermfg=' . c[1] . ' '
        endif
    endif

    if a:0 >= 1 && strlen(a:1)
        if a:1 == 'bg'
            let histring .= 'guibg=bg ctermbg=bg '
        elseif a:1 == 'none'
            let histring .= 'guibg=NONE ctermbg=NONE '
        else
            let c = get(s:bwc, a:1)
            let histring .= 'guibg=#' . c[0] . ' ctermbg=' . c[1] . ' '
        endif
    endif

    if a:0 >= 2 && strlen(a:2)
        let histring .= 'gui=' . a:2 . ' cterm=' . a:2 . ' '
    endif

    if a:0 >= 3 && strlen(a:3)
        let c = get(s:bwc, a:3)
        let histring .= 'guisp=#' . c[0] . ' '
    endif

    execute histring
endfunction

" }}}
" Configuration Options {{{

let s:gutter = 'blackgravel'

" }}}

" Actual colorscheme ----------------------------------------------------------
" Vanilla Vim {{{

" General/UI {{{

call s:HL('Normal', 'plain', 'blackgravel')

call s:HL('Folded', 'mediumgravel', 'blackestgravel', 'none')

call s:HL('CursorLine',   '', 'darkgravel', 'none')
call s:HL('CursorLineNr',   'tardis', 'darkgravel', 'none')
call s:HL('CursorColumn', '', 'darkgravel')
call s:HL('ColorColumn',  '', 'darkgravel')

call s:HL('MatchParen', 'dalespale', 'darkgravel', 'bold')

call s:HL('NonText',    'deepgravel', 'bg')
call s:HL('SpecialKey', 'deepgravel', 'bg')

call s:HL('Visual',    '',  'deepgravel')
call s:HL('VisualNOS', '',  'deepgravel')

call s:HL('Search',    'coal', 'dalespale', 'bold')
call s:HL('IncSearch', 'coal', 'tardis',    'bold')

call s:HL('Underlined', 'fg', '', 'underline')

call s:HL('StatusLine',   'brightgravel', 'coal', 'NONE')
call s:HL('StatusLineNC', 'lightgravel', 'coal', 'NONE')
call s:HL('User1', 'snow', 'coal', 'none')
call s:HL('User2', 'taffy', 'coal', 'none')

call s:HL('VertSplit', 'coal', 'bg', 'none')

call s:HL('TabLine', 'plain', 'coal', 'none')
call s:HL('TabLineFill', 'plain', 'coal', 'none')
call s:HL('TabLineSel', 'dirtyblonde', 'coal', 'none')

call s:HL('Directory', 'dirtyblonde', '', 'bold')

call s:HL('Title', 'lime')

call s:HL('ErrorMsg',   'taffy',       'bg', 'bold')
call s:HL('MoreMsg',    'dalespale',   '',   'bold')
call s:HL('ModeMsg',    'dirtyblonde', '',   'bold')
call s:HL('Question',   'dirtyblonde', '',   'bold')
call s:HL('WarningMsg', 'dress',       '',   'bold')

" This is a ctags tag, not an HTML one.  'Something you can use c-] on'.
call GoodWolfHL('Tag', '', '', 'bold')

" }}}
" Gutter {{{

call GoodWolfHL('LineNr',     'mediumgravel', s:gutter)
call GoodWolfHL('SignColumn', '',             s:gutter)
call GoodWolfHL('FoldColumn', 'mediumgravel', s:gutter)

" }}}
" Cursor {{{

call GoodWolfHL('Cursor',  'coal', 'tardis', 'bold')
call GoodWolfHL('vCursor', 'coal', 'tardis', 'bold')
call GoodWolfHL('iCursor', 'coal', 'tardis', 'none')

" }}}
" Syntax highlighting {{{

" Start with a simple base.
call s:HL('Special', 'brightgravel')

" Comments are slightly brighter than folds, to make 'headers' easier to see.
call GoodWolfHL('Comment',        'gravel', 'bg', 'none')
call GoodWolfHL('Todo',           'snow',   'bg', 'bold')
call GoodWolfHL('SpecialComment', 'snow',   'bg', 'bold')

" Strings are highlighted separately.
call s:HL('String', 'green', 'bg', 'none')

" Turn off everything else
call s:HL('Statement',    'brightgravel', '', 'none')
call s:HL('Keyword',      'plain', '', 'none')
call s:HL('Conditional',  'plain', '', 'none')
call s:HL('Operator',     'plain', '', 'none')
call s:HL('Label',        'plain', '', 'none')
call s:HL('Repeat',       'plain', '', 'none')
call s:HL('Identifier',   'plain', '', 'none')
call s:HL('Function',     'plain', '', 'none')
call s:HL('PreProc',      'plain', '', 'none')
call s:HL('Macro',        'plain', '', 'none')
call s:HL('Define',       'plain', '', 'none')
call s:HL('PreCondit',    'plain', '', 'none')
call s:HL('Constant',     'plain', '', 'none')
call s:HL('Character',    'plain', '', 'none')
call s:HL('Boolean',      'plain', '', 'none')
call s:HL('Number',       'plain', '', 'none')
call s:HL('Float',        'plain', '', 'none')
call s:HL('Type',         'plain', '', 'none')
call s:HL('StorageClass', 'plain', '', 'none')
call s:HL('Structure',    'plain', '', 'none')
call s:HL('Typedef',      'plain', '', 'none')
call s:HL('Exception',    'plain', '', 'none')

" Not sure what 'special character in a constant' means, but let's make it pop.
call GoodWolfHL('SpecialChar', 'plain', '', 'bold')

" Misc
call GoodWolfHL('Error',  'snow',   'taffy', 'bold')
call GoodWolfHL('Debug',  'snow',   '',      'bold')
call GoodWolfHL('Ignore', 'gravel', '',      '')

" }}}
" Completion Menu {{{

call GoodWolfHL('Pmenu', 'plain', 'deepergravel')
call GoodWolfHL('PmenuSel', 'coal', 'tardis', 'bold')
call GoodWolfHL('PmenuSbar', '', 'deepergravel')
call GoodWolfHL('PmenuThumb', 'brightgravel')

call s:HL('WildMenu', 'coal', 'tardis', 'bold')

" }}}
" Diffs {{{

call s:HL('DiffDelete', 'coal', 'coal')
call s:HL('DiffAdd',    'coal',     'green')
call s:HL('DiffChange', '', 'deepergravel')
call s:HL('DiffText',   'orange', 'deepergravel', 'none')

" }}}
" Spelling {{{

if has("spell")
    call GoodWolfHL('SpellCap', 'dalespale', 'bg', 'undercurl,bold', 'dalespale')
    call GoodWolfHL('SpellBad', '', 'bg', 'undercurl', 'dalespale')
    call GoodWolfHL('SpellLocal', '', '', 'undercurl', 'dalespale')
    call GoodWolfHL('SpellRare', '', '', 'undercurl', 'dalespale')
endif

" }}}
" Status Line Utils {{{

call GoodWolfHL('GWStatusLineMode', 'coal', 'lime')
call GoodWolfHL('GWStatusLineModeX', 'lime', 'deepergravel')


" }}}

" }}}
" Plugins {{{

" Clam {{{

" hg status
call s:HL('clamHgStatusAdded',    'lime', '', 'none')
call s:HL('clamHgStatusModified', 'saltwatertaffy', '', 'none')
call s:HL('clamHgStatusRemoved',  'toffee', '', 'none')
call s:HL('clamHgStatusUnknown',  'taffy', '', 'bold')

" }}}
" Rainbow Parentheses {{{

call GoodWolfHL('level1c',  'mediumgravel', '', 'bold')

" }}}

" }}}
" Filetype-specific {{{

" Clojure {{{

call GoodWolfHL('clojureParen0', 'lightgravel', '', 'none')
call GoodWolfHL('clojureAnonArg', 'snow', '', 'bold')

" }}}
" CSS {{{

call GoodWolfHL('cssBraces', 'lightgravel', '', 'none')

" }}}
" Diff {{{

call GoodWolfHL('gitDiff', 'lightgravel', '',)

call GoodWolfHL('diffRemoved', 'dress', '',)
call GoodWolfHL('diffAdded', 'lime', '',)
call GoodWolfHL('diffFile', 'coal', 'toffee', 'bold')
call GoodWolfHL('diffNewFile', 'coal', 'toffee', 'bold')

call GoodWolfHL('diffLine', 'coal', 'orange', 'bold')
call GoodWolfHL('diffSubname', 'orange', '', 'none')

" }}}
" HTML {{{

" Punctuation
call GoodWolfHL('htmlTag',    'darkroast', 'bg', 'none')
call GoodWolfHL('htmlEndTag', 'darkroast', 'bg', 'none')

" Tag names
call s:HL('htmlTagName',        'coffee', '', 'bold')
call s:HL('htmlSpecialTagName', 'coffee', '', 'bold')
call s:HL('htmlSpecialChar',    'lime',   '', 'none')

call s:HL('xmlTagName',        'coffee', '', 'bold')
call s:HL('xmlTag',        'darkroast', '', 'none')
call s:HL('xmlEndTag',        'darkroast', '', 'none')
call s:HL('xmlAttrib', 'coffee', '', 'none')
call s:HL('xmlAttribPunct',    'darkroast',   '', 'none')

" Attributes
call GoodWolfHL('htmlArg', 'coffee', '', 'none')

" Stuff inside an <a> tag

call s:HL('htmlLink', 'lightgravel', '', 'underline')

" }}}
" Java {{{

call s:HL('javaCommentTitle', 'gravel', '')
call s:HL('javaDocTags', 'snow', '', 'none')
call s:HL('javaDocParam', 'plain', '', '')

" }}}
" REPLs {{{
" This isn't a specific plugin, but just useful highlight classes for anything
" that might want to use them.

call GoodWolfHL('replPrompt', 'tardis', '', 'bold')

" }}}
" Mail {{{

call GoodWolfHL('mailSubject', 'orange', '', 'bold')
call GoodWolfHL('mailHeader', 'lightgravel', '', '')
call GoodWolfHL('mailHeaderKey', 'lightgravel', '', '')
call GoodWolfHL('mailHeaderEmail', 'snow', '', '')
call GoodWolfHL('mailURL', 'toffee', '', 'underline')
call GoodWolfHL('mailSignature', 'gravel', '', 'none')

call GoodWolfHL('mailQuoted1', 'gravel', '', 'none')
call GoodWolfHL('mailQuoted2', 'dress', '', 'none')
call GoodWolfHL('mailQuoted3', 'dirtyblonde', '', 'none')
call GoodWolfHL('mailQuoted4', 'orange', '', 'none')
call GoodWolfHL('mailQuoted5', 'lime', '', 'none')

" }}}
" Markdown {{{

call GoodWolfHL('markdownHeadingRule', 'lightgravel', '', 'bold')
call GoodWolfHL('markdownHeadingDelimiter', 'lightgravel', '', 'bold')
call GoodWolfHL('markdownOrderedListMarker', 'lightgravel', '', 'bold')
call GoodWolfHL('markdownListMarker', 'lightgravel', '', 'bold')
call GoodWolfHL('markdownItalic', 'snow', '', 'bold')
call GoodWolfHL('markdownBold', 'snow', '', 'bold')
call GoodWolfHL('markdownH1', 'orange', '', 'bold')
call GoodWolfHL('markdownH2', 'lime', '', 'bold')
call GoodWolfHL('markdownH3', 'lime', '', 'none')
call GoodWolfHL('markdownH4', 'lime', '', 'none')
call GoodWolfHL('markdownH5', 'lime', '', 'none')
call GoodWolfHL('markdownH6', 'lime', '', 'none')
call GoodWolfHL('markdownLinkText', 'toffee', '', 'underline')
call GoodWolfHL('markdownIdDeclaration', 'toffee')
call GoodWolfHL('markdownAutomaticLink', 'toffee', '', 'bold')
call GoodWolfHL('markdownUrl', 'toffee', '', 'bold')
call GoodWolfHL('markdownUrldelimiter', 'lightgravel', '', 'bold')
call GoodWolfHL('markdownLinkDelimiter', 'lightgravel', '', 'bold')
call GoodWolfHL('markdownLinkTextDelimiter', 'lightgravel', '', 'bold')
call GoodWolfHL('markdownCodeDelimiter', 'dirtyblonde', '', 'bold')
call GoodWolfHL('markdownCode', 'dirtyblonde', '', 'none')
call GoodWolfHL('markdownCodeBlock', 'dirtyblonde', '', 'none')

" }}}
" Python {{{

hi def link pythonOperator Operator
call GoodWolfHL('pythonBuiltin',     'plain')
call GoodWolfHL('pythonBuiltinObj',  'plain')
call GoodWolfHL('pythonBuiltinFunc', 'plain')
call GoodWolfHL('pythonEscape',      'plain')
call GoodWolfHL('pythonException',   'plain', '', 'none')
call GoodWolfHL('pythonExceptions',  'plain', '', 'none')
call GoodWolfHL('pythonPrecondit',   'plain', '', 'none')
call GoodWolfHL('pythonDecorator',   'plain', '', 'none')
call GoodWolfHL('pythonRun',         'plain', '', 'none')
call GoodWolfHL('pythonCoding',      'plain', '', 'bold')

" }}}
" Vim {{{

call s:HL('helpHyperTextJump', 'dress', '', 'none')
call s:HL('helpHyperTextEntry', 'lightgravel', '', 'none')
call s:HL('helpExample', 'coffee', '', 'none')
call s:HL('helpHeadline', 'dirtyblonde', '', 'none')
call s:HL('helpHeader', 'plain', '', 'bold')
call s:HL('helpOption', 'dress', '', 'none')
call s:HL('helpSpecial', 'dirtyblonde', '', 'none')

" }}}
" Typescript {{{

call s:HL('typescriptInterpolation', 'brightgravel', 'darkgravel', 'none')
call s:HL('typescriptInterpolationDelimiter', 'dirtyblonde', 'darkgravel', 'bold')

" }}}
" Powershell {{{

call s:HL('ps1InterpolationDelimiter', 'lime', 'bg', 'bold')

" }}}
" git {{{

call s:HL('gitCommitSummary', 'fg', 'bg', 'bold')
call s:HL('gitCommitOverflow', 'taffy', 'bg', 'bold')
call s:HL('gitCommitDiscardedFile', 'orange', 'bg')
call s:HL('gitCommitSelectedFile', 'lime', 'bg')
call s:HL('gitCommitBranch', 'dirtyblonde', 'bg')

call s:HL('gitrebaseCommit', 'dirtyblonde', 'bg')
call s:HL('gitrebaseReword', 'orange', 'bg')
call s:HL('gitrebaseSquash', 'toffee', 'bg')
call s:HL('gitrebaseFixup', 'coffee', 'bg')
call s:HL('gitrebaseDrop', 'taffy', 'bg')
call s:HL('gitrebaseEdit', 'dalespale', 'bg')

" }}}
" mine {{{

call s:HL('BufferNumber', 'lightgravel', 'bg')
call s:HL('BufferFlags', 'dirtyblonde', 'bg')
call s:HL('BufferCurrentName', 'fg', 'bg', 'bold')
call s:HL('BufferAlternateName', 'dalespale', 'bg')
call s:HL('BufferName', 'fg', 'bg', 'none')

" }}}
" vimplug {{{

call s:HL('plugH2', 'lime', '', 'none')
call s:HL('plugName', 'toffee', '', 'none')
call s:HL('plugSha', 'dirtyblonde', '', 'none')
call s:HL('plugEdge', 'lightgravel', '', 'none')
call s:HL('plugRelDate', 'green', '', 'none')

" }}}
" rust {{{

call s:HL('rustAttribute', 'toffee', '', 'none')
call s:HL('rustFuncName', 'fg', '', 'bold')
call s:HL('rustIdentifier', 'fg', '', 'bold')
call s:HL('rustStructure', 'brightgravel', '', 'none')
call s:HL('rustKeyword', 'brightgravel', '', 'none')
call s:HL('rustTypedef', 'brightgravel', '', 'none')
call s:HL('rustConditional', 'brightgravel', '', 'none')
call s:HL('rustQuestionMark', 'orange', 'bg', 'none')
call s:HL('rustDerive', 'toffee', 'bg', 'none')
call s:HL('rustDeriveTrait', 'toffee', 'bg', 'none')
call s:HL('rustSelf', 'fg', 'bg', 'bold')
call s:HL('rustOperator', 'brightgravel', 'bg', 'bold')

" }}}

" }}}

