.model small  
.stack 100h
.data
num1 db 2         
num2 db 3         
result dw 0       

.code
main proc
    ; Initialize data segment
    mov ax, @data
    mov ds, ax

    
    mov al, num1   ; Load num1 into AL
    mov bl, num2   ; Load num2 into BL

    
    
    mul bl        

    
    mov result, ax  ; store ax value to reslut variable
    add result, 48
    mov dx, result  ; move result value to dx register to print
    mov ah, 2
    int 21h
   
    mov ah, 4Ch    
    int 21h
    
main endp
end main
