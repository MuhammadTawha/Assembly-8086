.model small  
.stack 100h
.data
num1 db 2     ; variables
num2 db 3      
str db 'BEFORE SWAPPING $'
str1 db 'AFTER SWAPPING $'  

.code
main proc
    ; Initialize data segment
    mov ax, @data
    mov ds, ax
    
    ; Print String
    LEA dx, str
    mov ah, 9
    int 21h

   ; print number 
    mov al, num1
    add al, 48       
    mov dl, al
    mov ah, 2         
    int 21h

    ; Print space
    mov dl, ' '
    mov ah, 2
    int 21h

    ; print second number
    mov al, num2
    add al, 48        
    mov dl, al
    mov ah, 2         
    int 21h

    ; New line
    mov dl, 0Dh     
    mov ah, 2
    int 21h
    mov dl, 0Ah       
    mov ah, 2
    int 21h

    ; Swaping the values
    mov al, num1      ; Load num1 into AL
    mov bl, num2      ; Load num2 into BL
    mov num1, bl      ; Store num2 in num1
    mov num2, al      ; Store num1 in num2

    ; Print other string
    LEA dx, str1
    mov ah, 9
    int 21h

    ; Print number after swapping
    mov al, num1
    add al, 48        
    mov dl, al
    mov ah, 2        
    int 21h

    ; Print space
    mov dl, ' '
    mov ah, 2
    int 21h

    ; Print second number after swapping
    mov al, num2
    add al, 48       
    mov dl, al
    mov ah, 2         
    int 21h

    
    mov ah, 4Ch      
    int 21h
main endp
end main
