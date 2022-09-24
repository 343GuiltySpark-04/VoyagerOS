[bits 32]


section .text

global e9_port_test
global nominal_boot
global interrupt_check_fail
global interrupts_enabled
global invalid_magic_number
global invalid_mem_map
global paging_nominal
global A20_enabled
global IDT_loaded

e9_port_test:
mov dx,0xe9
mov eax,0x2A
out dx,eax
mov eax,0x30
out dx,eax
out dx,eax
out dx,eax
mov eax,0x2A
out dx,eax


nominal_boot:
mov dx,0xe9
mov eax,0x2A
out dx,eax
mov eax,0x30
out dx,eax
out dx,eax
mov eax,0x31
out dx,eax
mov eax,0x2A
out dx,eax


interrupt_check_fail:
mov dx,0xe9
mov eax,0x2A
out dx,eax
mov eax,0x30
out dx,eax
out dx,eax
mov eax,0x32
out dx,eax
mov eax,0x2A
out dx,eax

interrupts_enabled:
mov dx,0xe9
mov eax,0x2A
out dx,eax
mov eax,0x30
out dx,eax
out dx,eax
mov eax,0x34
out dx,eax
mov eax,0x2A
out dx,eax

invalid_magic_number:
mov dx,0xe9
mov eax,0x2A
out dx,eax
mov eax,0x30
out dx,eax
out dx,eax
mov eax,0x35
out dx,eax
mov eax,0x2A
out dx,eax


invalid_mem_map:
mov dx,0xe9
mov eax,0x2A
out dx,eax
mov eax,0x30
out dx,eax
out dx,eax
mov eax,0x36
out dx,eax
mov eax,0x2A
out dx,eax

paging_nominal:
mov dx,0xe9
mov eax,0x2A
out dx,eax
mov eax,0x30
out dx,eax
out dx,eax
mov eax,0x37
out dx,eax
mov eax,0x2A
out dx,eax

A20_enabled:
mov dx,0xe9
mov eax,0x2A
out dx,eax
mov eax,0x30
out dx,eax
out dx,eax
mov eax,0x38
out dx,eax
mov eax,0x2A
out dx,eax

IDT_loaded:
mov dx,0x3f8
mov eax,0x2A
out dx,eax
mov eax,0x30
out dx,eax
out dx,eax
mov eax,0x39
out dx,eax
mov eax,0x2A
out dx,eax
mov dx,0xe9
out dx,eax
mov eax,0x30
out dx,eax
out dx,eax
mov eax,0x39
out dx,eax
mov eax,0x2A
out dx,eax