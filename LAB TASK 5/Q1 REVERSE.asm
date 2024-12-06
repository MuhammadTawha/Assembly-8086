.model small
.stack 100h

.data
    sumstg db 'THE SUM IS: $', 0  ; Message to print before sum
.code
main proc
    mov ax, @data
    mov ds, ax                  

    ; Load numbers into registers
    mov ax, 4                   
    mov bx, 2                   
    mov cx, 3                   

    ; Push the numbers onto the stack
    push ax                    
    push bx                    
    push cx
    
    ; Step 3: Set BP to current SP
    mov bp, sp                  ; Set BP to point to the top of the stack                    

    ; Pop and add the numbers
    pop ax                      
    pop bx                      
    pop cx                      

    add ax, bx                  ; Add AX and BX
    add ax, cx                  ; Add AX and CX 

    ; Push the result back onto the stack
    push ax                    

    lea dx, sumstg             
    mov ah, 09h                
    int 21h                    

    ; Pop the sum result from the stack
    pop ax                     
    
    add ax, '0'                 
    mov dl, al                  
    mov ah, 2h                 
    int 21h                     

    mov ah, 4ch
    int 21h
main endp
end main
