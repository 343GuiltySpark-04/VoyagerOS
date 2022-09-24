[bits 32]

section .text

global loadPageDirectory

loadPageDirectory:
push ebp
mov ebp,esp
add esp,8
mov eax,esp
mov cr3,eax
mov esp,ebp
pop ebp
ret