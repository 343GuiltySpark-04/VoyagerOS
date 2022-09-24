.section .text
    .global enablePaging
        enablePaging:
            push %ebp
            mov %esp, %ebp
            mov %cr0, %eax
            or $0x80000000, %eax  /*The guy who thought the 00000 was needed is an ass */
            mov %eax, %cr0
            mov %ebp, %esp
            pop %ebp
            ret