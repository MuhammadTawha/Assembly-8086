.model small
.stack 100h
.data
tty db 2       
tty1 db 4 
tty2 db 1
.code

SUM macro operand1, operand2, operand3
    ; Load the first operand into AL
    mov al, operand1
    
    ; Add the other operands to AL
    add al, operand2
    add al, operand3
    
    add al, 48
    ; Move result to DL for displaying
    mov dl, al
    mov ah, 2           
    int 21h             
endm

main proc
    ; Initialize data segment
    mov ax, @data
    mov ds, ax

    ; Call the macro with parameters
    SUM tty, tty1, tty2

    ; Exit the program
    mov ah, 4Ch    
    int 21h

main endp
end main
