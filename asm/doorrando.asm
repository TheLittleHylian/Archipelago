!add = "clc : adc"
!sub = "sec : sbc"
!bge = "bcs"
!blt = "bcc"

; Free RAM notes
; Normal doors use $AB-AC for scrolling indicator
; Normal doors use $FE to store the trap door indicator
; Spiral doors use $045e to store stair type
; Gfx uses $b1 to for sub-sub-sub-module thing

; Hooks into various routines
incsrc drhooks.asm

;Main Code
org $278000 ;138000
incsrc normal.asm
incsrc scroll.asm
incsrc spiral.asm
incsrc gfx.asm
incsrc keydoors.asm
incsrc overrides.asm
incsrc edges.asm
incsrc math.asm
warnpc $279000

; Data Section
org $279000
OffsetTable:
dw -8, 8
DRMode:
dw 0
DRFlags:
dw 0
DRScroll:
db 0

org $279030
incsrc hudadditions.asm
warnpc $279700

incsrc doortables.asm