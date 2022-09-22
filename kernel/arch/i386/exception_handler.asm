exc_0d_handler:
    push gs
    mov gs,ZEROBASED_DATA_SELECTOR
    mov word [gs:0xb8000],'D '
    ;; D in the top-left corner means we're handling
    ;;  a GPF exception right ATM.
 
    ;; your 'normal' handler comes here
    pushad
    push ds
    push es
    mov ax,KERNEL_DATA_SELECTOR
    mov ds,ax
    mov es,ax
 
    call gpfExcHandler
 
    pop es
    pop ds
    popad
 
    mov dword [gs:0xb8000],'  D-'
    ;; the 'D' moved one character to the right, letting
    ;; us know that the exception has been handled properly
    ;; and that normal operations continues.
    pop gs
    iret