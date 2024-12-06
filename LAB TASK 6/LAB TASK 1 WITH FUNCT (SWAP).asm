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
    call printstr

   ; print number 
    mov al, num1
    add al, 48       
    mov dl, al
    call printnum
    
    ;print psce
    call printspc

    ; print second number
    mov al, num2
    add al, 48        
    mov dl, al
    call printnum

    ; New line
    mov dl, 10     
    call printnum
    mov dl, 13       
    call printnum

    ; Swaping the values
    mov al, num1      ; Load num1 into AL
    mov bl, num2      ; Load num2 into BL
    mov num1, bl      ; Store num2 in num1
    mov num2, al      ; Store num1 in num2

    ; Print other string
    LEA dx, str1
    call printstr

    ; Print number after swapping
    mov al, num1
    add al, 48        
    mov dl, al
    call printnum
    
    ;print space
    call printspc

    ; Print second number after swapping
    mov al, num2
    add al, 48       
    mov dl, al
    call printnum
    
    mov ah, 4Ch      
    int 21h
main endp 

 ;functons
printstr proc
     mov ah, 9
     int 21h
     ret
    printstr endp

printnum proc
    mov ah, 2
    int 21h
    ret
    printnum endp
printspc proc
       mov dl, ' '
       call printnum
       ret
    printspc endp
end main