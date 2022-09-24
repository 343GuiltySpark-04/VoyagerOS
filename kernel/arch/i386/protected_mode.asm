bits 32

section .data

global gdt_end
global gdt_desc
extern main


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
    db $ - gdt_start - 1
    dw gdt_start


section .text
    global pmodeinit

pmodeinit:
    cli

    lgdt [gdt_desc]
    mov eax,cr0
    or eax,1
    mov cr0,eax
    jmp dword 0x8:start32

start32:
    mov eax,0x10
    mov ds,ax
    mov es,ax
    mov fs,ax
    mov gs,ax
    mov ss,ax

    sti
    mov esp,0x8000

    call main
