.model small
.stack 100h
.data
arrnum dw 0,1,2,3,4,5,6,7,8,9  
.code
main proc
    mov ax, @data               
    mov ds, ax

    mov cx, 10                  
    lea di, arrnum              
    mov bx, 0                   

loop_start:
    mov ax, [di]                
    add bx, ax                  
    add di, 2                   
    loop loop_start             

    mov ax, bx                  
    mov cx, 10                  
    div cx                      

    mov bx, ax
    add bx,48
    mov dx, bx
    mov ah,2
    int 21h                  

    mov ah, 4Ch                 
    int 21h
main endp
end main