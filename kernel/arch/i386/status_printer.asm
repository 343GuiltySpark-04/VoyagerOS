[bits 32]

global e9_port_test
global nominal_boot
global interrupt_check_fail
global interrupts_enabled

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
