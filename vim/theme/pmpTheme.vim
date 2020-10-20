" Vim color file - Vim PMP Theme
set background=dark
if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

set t_Co=256
let g:colors_name = "VimPMPTheme"

hi Normal guifg=#bebebe guibg=#2b2b2b guisp=#2b2b2b gui=NONE ctermfg=7 ctermbg=235 cterm=NONE
hi Comment guifg=#808080 guibg=NONE guisp=NONE gui=italic ctermfg=102 ctermbg=NONE cterm=italic
hi IncSearch guifg=#b0ffff guibg=#2050d0 guisp=#2050d0 gui=NONE ctermfg=159 ctermbg=26 cterm=NONE
hi WildMenu guifg=#bebebe guibg=#2b2b2b guisp=#2b2b2b gui=NONE ctermfg=7 ctermbg=235 cterm=NONE
hi SpecialComment guifg=#76eec6 guibg=NONE guisp=NONE gui=NONE ctermfg=122 ctermbg=NONE cterm=NONE
hi Typedef guifg=#ffa54f guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi Title guifg=#cd5c5c guibg=NONE guisp=NONE gui=NONE ctermfg=167 ctermbg=NONE cterm=NONE
hi Folded guifg=#79cdcd guibg=#4d4d4d guisp=#4d4d4d gui=NONE ctermfg=116 ctermbg=239 cterm=NONE
hi PreCondit guifg=#6352a8 guibg=NONE guisp=NONE gui=NONE ctermfg=211 ctermbg=NONE cterm=NONE
hi Include guifg=#b30000 guibg=NONE guisp=NONE gui=NONE ctermfg=211 ctermbg=NONE cterm=NONE
hi StatusLineNC guifg=#bebebe guibg=#666666 guisp=#666666 gui=NONE ctermfg=7 ctermbg=241 cterm=NONE
hi NonText guifg=#808080 guibg=NONE guisp=NONE gui=NONE ctermfg=14 ctermbg=NONE cterm=NONE
hi DiffText guifg=#000000 guibg=#ff6eb4 guisp=#ff6eb4 gui=NONE ctermfg=NONE ctermbg=205 cterm=NONE
hi ErrorMsg guifg=#ffffff guibg=#ff0000 guisp=#ff0000 gui=NONE ctermfg=15 ctermbg=196 cterm=NONE
hi Ignore guifg=#666666 guibg=NONE guisp=NONE gui=NONE ctermfg=241 ctermbg=NONE cterm=NONE
hi Debug guifg=#76eec6 guibg=NONE guisp=NONE gui=NONE ctermfg=122 ctermbg=NONE cterm=NONE
hi PMenuSbar guifg=NONE guibg=#848688 guisp=#848688 gui=NONE ctermfg=NONE ctermbg=102 cterm=NONE
hi Identifier guifg=#87ceeb guibg=NONE guisp=NONE gui=NONE ctermfg=117 ctermbg=NONE cterm=NONE
hi SpecialChar guifg=#76eec6 guibg=NONE guisp=NONE gui=NONE ctermfg=122 ctermbg=NONE cterm=NONE
hi Conditional guifg=#ffa54f guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi StorageClass guifg=#ffa54f guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi Todo guifg=#ffffff guibg=#000000 guisp=#000000 gui=bold ctermfg=202 ctermbg=11 cterm=bold
hi Special guifg=#76eec6 guibg=NONE guisp=NONE gui=NONE ctermfg=122 ctermbg=NONE cterm=NONE
hi LineNr guifg=#8f7757 guibg=#404040 guisp=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
hi StatusLine guifg=#000000 guibg=#c2bfa5 guisp=#c2bfa5 gui=bold ctermfg=NONE ctermbg=187 cterm=bold
hi Label guifg=#ffa54f guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi PMenuSel guifg=#445599 guibg=#bebebe guisp=#bebebe gui=NONE ctermfg=61 ctermbg=7 cterm=NONE
hi Search guifg=#cccccc guibg=#445599 guisp=#445599 gui=NONE ctermfg=252 ctermbg=61 cterm=NONE
hi Delimiter guifg=#76eec6 guibg=NONE guisp=NONE gui=NONE ctermfg=122 ctermbg=NONE cterm=NONE
hi Statement guifg=#eedc82 guibg=NONE guisp=NONE gui=NONE ctermfg=222 ctermbg=NONE cterm=NONE
hi Character guifg=#fa8072 guibg=NONE guisp=NONE gui=NONE ctermfg=210 ctermbg=NONE cterm=NONE
hi Number guifg=#fa8072 guibg=NONE guisp=NONE gui=NONE ctermfg=210 ctermbg=NONE cterm=NONE
hi Boolean guifg=#7373ff guibg=NONE guisp=NONE gui=NONE ctermfg=222 ctermbg=NONE cterm=NONE
hi Operator guifg=#ffa54f guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi Question guifg=#00ff7f guibg=NONE guisp=NONE gui=NONE ctermfg=48 ctermbg=NONE cterm=NONE
hi WarningMsg guifg=#ff0000 guibg=#ffffff guisp=NONE gui=bold ctermfg=210 ctermbg=NONE cterm=bold
hi VisualNOS guifg=NONE guibg=NONE guisp=NONE gui=bold,underline ctermfg=NONE ctermbg=NONE cterm=bold,underline
hi DiffDelete guifg=#000000 guibg=#737373 guisp=#737373 gui=NONE ctermfg=NONE ctermbg=243 cterm=NONE
hi ModeMsg guifg=#87ceeb guibg=NONE guisp=NONE gui=NONE ctermfg=117 ctermbg=NONE cterm=NONE
hi Define guifg=#ee799f guibg=NONE guisp=NONE gui=NONE ctermfg=211 ctermbg=NONE cterm=NONE
hi Function guifg=#ffffff guibg=NONE guisp=NONE gui=NONE ctermfg=117 ctermbg=NONE cterm=NONE
hi FoldColumn guifg=#d2b48c guibg=#4d4d4d guisp=#4d4d4d gui=NONE ctermfg=180 ctermbg=239 cterm=NONE
hi PreProc guifg=#ad6a73 guibg=NONE guisp=NONE gui=NONE ctermfg=211 ctermbg=NONE cterm=NONE
hi Visual guifg=#2b2b2b guibg=#ffa54f guisp=#ffa54f gui=NONE ctermfg=235 ctermbg=215 cterm=NONE
hi MoreMsg guifg=#2e8b57 guibg=NONE guisp=NONE gui=NONE ctermfg=29 ctermbg=NONE cterm=NONE
hi VertSplit guifg=#666666 guibg=#666666 guisp=#666666 gui=NONE ctermfg=241 ctermbg=241 cterm=NONE
hi Exception guifg=#ffa54f guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi Keyword guifg=#cdaa7d guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi Type guifg=#ffbf00 guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi DiffChange guifg=#000000 guibg=#87ceff guisp=#87ceff gui=NONE ctermfg=NONE ctermbg=117 cterm=NONE
hi Cursor guifg=#000000 guibg=#ffff00 guisp=#ffff00 gui=NONE ctermfg=NONE ctermbg=11 cterm=NONE
hi Error guifg=#c0c0c0 guibg=#c00000 guisp=#c00000 gui=bold ctermfg=7 ctermbg=1 cterm=bold
hi PMenu guifg=#ffffff guibg=#445599 guisp=#445599 gui=NONE ctermfg=15 ctermbg=61 cterm=NONE
hi SpecialKey guifg=#00ffff guibg=NONE guisp=NONE gui=NONE ctermfg=14 ctermbg=NONE cterm=NONE
hi Constant guifg=#fa8072 guibg=NONE guisp=NONE gui=NONE ctermfg=210 ctermbg=NONE cterm=NONE
hi Tag guifg=#76eec6 guibg=NONE guisp=NONE gui=NONE ctermfg=122 ctermbg=NONE cterm=NONE
hi String guifg=#659160 guibg=NONE guisp=NONE gui=NONE ctermfg=210 ctermbg=NONE cterm=NONE
hi PMenuThumb guifg=NONE guibg=#804000 guisp=#804000 gui=NONE ctermfg=NONE ctermbg=3 cterm=NONE
hi MatchParen guifg=#b30000 guibg=NONE guisp=NONE gui=bold ctermfg=14 ctermbg=NONE cterm=bold
hi Repeat guifg=#ffa54f guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi Directory guifg=#008b8b guibg=NONE guisp=NONE gui=NONE ctermfg=30 ctermbg=NONE cterm=NONE
hi Structure guifg=#ffa54f guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi Macro guifg=#b30000 guibg=NONE guisp=NONE gui=NONE ctermfg=211 ctermbg=NONE cterm=NONE
hi Underlined guifg=#c000c0 guibg=NONE guisp=NONE gui=underline ctermfg=5 ctermbg=NONE cterm=underline
hi DiffAdd guifg=#000000 guibg=#ffe7ba guisp=#ffe7ba gui=NONE ctermfg=NONE ctermbg=223 cterm=NONE
hi cursorim guifg=#192224 guibg=#536991 guisp=#536991 gui=NONE ctermfg=235 ctermbg=60 cterm=NONE
