.model small  
.stack 100h
.data
num1 db 2         
num2 db 3         
result db 0           
str db "THE RESULT IS: $"       
.code

multi macro operand1, operand2, resultVar, string
    ; Perform multiplication
    mov al, operand1       ; Load operand1 into AL
    mov bl, operand2       ; Load operand2 into BL
    mul bl                 ; Multiply AL by BL, result in AX (AL holds the low byte of the result)
    mov resultVar, al      ; Store the result (low byte) in resultVar

    lea dx, string
    mov ah, 9
    int 21h

    mov al, resultVar      
    add al, 48             
    mov dl, al             
    mov ah, 2
    int 21h                
endm

main proc
    ; Initialize data segment
    mov ax, @data
    mov ds, ax

    ; Use the macro with parameters
    multi num1, num2, result, str

    ; Exit the program
    mov ah, 4Ch    
    int 21h
    
main endp
end main
