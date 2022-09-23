[bits 32]

global e9_port_test



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
