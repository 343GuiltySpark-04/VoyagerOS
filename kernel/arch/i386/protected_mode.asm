[bits 32]

section .data align=4

global gdt_end
global gdt_desc
extern main



gdt_start:

gdt_null:
    dd 0
    dd 0

gdt_code:
    dw 0x0ffff
    dw 0x00000
    db 0x00
    db 10011010b
    db 11001111b
    db 0x00

gdt_data:
    dw 0x0ffff
    dw 0x00000
    db 0x00
    db 10010010b
    db 11001111b
    db 0x00

gdt_end:

gdt_desc:
    db gdt_end - gdt_start - 1
    dd gdt_start


section .text
    global pmodeinit

pmodeinit:
   
    cli
    lgdt [gdt_desc]
    mov eax,cr0
    or eax,0x1
    mov cr0,eax
    jmp dword 0x8:0x18

start32:
    mov ax,0x10
    mov ds,ax
    mov es,ax
    mov fs,ax
    mov gs,ax
    mov ss,ax

    sti
    mov esp,0x8000

    jmp main
