" Vim syntax file
" Author: Ruben Vereecken

if exists("b:current_syntax")
  finish
endif

syntax case ignore

" List options that are useful to alias
syn keyword crawlOptionName weapon species background combo sound
syn keyword crawlOptionName autopickup_exceptions drop_filter
syn keyword crawlOptionName explore_stop explore_stop_pickup_ignore
syn keyword crawlOptionName runrest_ignore_message runrest_stop_message runrest_ignore_monster
syn keyword crawlOptionName auto_exclude spell_slot item_slot ability_slot
syn keyword crawlOptionName confirm_action monster_list_colour use_animations
syn keyword crawlOptionName force_more_message flash_screen_message
syn keyword crawlOptionName menu_colour message_colour
syn keyword crawlOptionName fire_order autoinscribe
syn keyword crawlOptionName macros dump_order note_items note_monsters
syn keyword crawlOptionName note_items note_monsters note_messages
syn keyword crawlOptionName feature mon_glyph item_glyph


syn keyword crawlKeyword true false
syn keyword crawlOptionValue safe unident yes no prompt very full always never

syn match crawlComment  "^#.*$" contains=crawlTodo
syn keyword crawlTodo TODO FIXME XXX NOTE
syn match crawlVimModeline "\v^\#[ !]?vim.*$"

syn match crawlAlias "\v:\="
syn match crawlOperator "\v[\+\^]?\=" nextgroup=crawlStatementRhs
" syn match crawlOperator "\v\^\="
" syn match crawlOperator "\v\="

syn match crawlNumber "\v[0-9]+" contained

syn match crawlStatement "\v^\s*\i+" transparent
syn region crawlStatementRhs start="." end="$" transparent containedin=crawlStatement contained contains=crawlOptionName,crawlKeyword,crawlOptionValue,crawlNumber
syn match crawlStatementLhs "\v\s*\i+\s*" containedin=crawlStatement contained nextgroup=crawlOperator

syn match crawlColon "\v\:" transparent nextgroup=crawlRegex,crawlInscription
" syn region crawlChannelAndValue start="+= " end="$" transparent contains=crawlChannel,crawlValue,crawlInscription,crawlInscriptionMatch
syn match crawlInscriptionMatch "\v[a-z _\(\)\|\.\*\?]+\ze\:" nextgroup=crawlColon contained containedin=crawlStatementRhs
syn match crawlInscription "\v[\!\@\=]\w{1,2}" contained
syn match crawlChannel "\v[a-z _]+\ze\:[\!\@\=]@!" nextgroup=crawlColon contained containedin=crawlStatementRhs

syn include @luaBlock syntax/lua.vim
syn region crawlLuaBlock start="\v^\{" end="\v^\}" keepend contains=@luaBlock
syn region crawlLua start="\v^\:" end="\v$" keepend transparent contains=crawlLuaKeyword,crawlLuaString,crawlLuaIdentifier
syn keyword crawlLuaKeyword if then else end
syn match crawlLuaString "\v(['"]).*\1"
syn keyword crawlLuaIdentifier you

syn include @perlRegex syntax/perl.vim
" syn region crawlRegex start="\v\+\= " end="\v.$" keepend
" syn region crawlRegex start="\v\+\= " end="\v.$" keepend contains=@p6RegexBlock
" syn match crawlRegex "\v\:.*" contains=@perlRegex
" syn match crawlRegexRhs "\v= .*" contains=@perlRegex

hi def link crawlComment Comment
hi def link crawlTodo Todo
hi def link crawlVimModeline Include

hi def link crawlOptionName Special
hi def link crawlKeyword Keyword
hi def link crawlAlias Special
hi def link crawlOperator Operator
hi def link crawlNumber Number

hi def link crawlColon Special
hi def link crawlStatementLhs Identifier
hi def link crawlChannel Type
hi def link crawlOptionValue Special
hi def link crawlInscription Special

hi def link crawlLuaKeyword Keyword
hi def link crawlLuaString String
hi def link crawlLuaIdentifier Identifier


let b:current_syntax = "crawlrc"
