bits 32
;section .multiboot

section .text

; Include the GDT from previous tutorials
; Set this as our GDT with LGDT
; insetad of relying on what the bootloader sets up for us
dd 0x1BADB002	; Magic number
dd 0x0			; Flags
dd - (0x1BADB002 + 0x0)	; Checksum


; Make global anything that is used in main.c
global start
global print_char_with_asm
global load_gdt
global load_idt
global keyboard_handler
global gp_handler
global ioport_in
global ioport_out
global enable_interrupts
global halt
global asm_loop


extern main			; Defined in kernel.c
extern handle_keyboard_interrupt
extern catch_gp
extern gdt_desc
extern CODE_SEG
extern DATA_SEG
extern pmodeinit
extern is_A20_on
extern init_idt

; Define Constants
STACKSIZE equ 0x4000


load_idt:
	mov edx, [esp + 4]
	lidt [edx]
	ret

enable_interrupts:
	sti
	ret

keyboard_handler:
	pushad
	cld
	call handle_keyboard_interrupt
	popad
	iretd


ioport_in:
	mov edx, [esp + 4] ; PORT_TO_READ, 16 bits
	; dx is lower 16 bits of edx. al is lower 8 bits of eax
	; Format: in <DESTINATION_REGISTER>, <PORT_TO_READ>
	in al, dx					 ; Read from port DX. Store value in AL
	; Return will send back the value in eax
	; (al in this case since return type is char, 8 bits)
	ret

ioport_out:
	mov edx, [esp + 4]	; port to write; DST_IO_PORT. 16 bits
	mov eax, [esp + 8] 	; value to write. 8 bits
	; Format: out <DST_IO_PORT>, <VALUE_TO_WRITE>
	out dx, al
	ret

print_char_with_asm:
	; OFFSET = (ROW * 80) + COL
	mov eax, [esp + 8] 		; eax = row
	mov edx, 80						; 80 (number of cols per row)
	mul edx								; now eax = row * 80
	add eax, [esp + 12] 	; now eax = row * 80 + col
	mov edx, 2						; * 2 because 2 bytes per char on screen
	mul edx
	mov edx, 0xb8000			; vid mem start in edx
	add edx, eax					; Add our calculated offset
	mov eax, [esp + 4] 		; char c
	mov [edx], al
	ret

start:
	; THANK YOU MICHAEL PETCH
	; https://stackoverflow.com/questions/62885174/multiboot-keyboard-driver-triple-faults-with-grub-works-with-qemu-why
	mov esp, stack_space+STACKSIZE       ; set stack pointer
	cli				; Disable interrupts
	mov esp, stack_space
	push eax
	push ebx
	call is_A20_on
	call init_idt
	call pmodeinit
	call main
	hlt




section .bss
align 32
resb STACKSIZE			; 8KB for stack
stack_space: