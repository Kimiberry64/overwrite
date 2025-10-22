; Simple text MBR for the MBR Overwrite tutorial.
; To compile it, you will need QEMU and then execute the batch file.
; Tutorial, May be incorrect but... https://www.youtube.com/watch?v=HywXtRz0URE

[BITS 16]
[ORG 0x7C00]

start:
    ; Stack setup
    cli
    xor ax, ax
    mov ds, ax

    mov es, ax
    mov ss, ax

    mov sp, 0x7C00
    sti

    ; Print
    mov si, text
print_char:
    lodsb
    cmp al, 0

    je done
    mov ah, 0x0E

    int 0x10
    jmp print_char

done:
      ; Hang system
      cli
      hlt

text: db 'Type your text here...', 0

; MBR signature
times 510 - ($ - $$) db 0
dw 0xAA55