bits 32

;section .text

global gdt_end
global gdt_desc
global CODE_SEG
global DATA_SEG

gdt_start:

gdt_null:
    dq 0x0

gdt_code:
    dw 0x0ffff
    dw 0x0
    db 0x0
    db 10011010b
    db 11001111b

gdt_data:
    dw 0x0ffff
    dw 0x0
    db 0x0
    db 10010010b
    db 11001111b
    db 0x0

gdt_end:

gdt_desc:
    db gdt_end - gdt_start - 1
    dw gdt_start


CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start
