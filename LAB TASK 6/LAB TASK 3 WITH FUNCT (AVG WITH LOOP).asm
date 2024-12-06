.model small
.stack 100h
.data
arrnum dw 0, 1, 2, 3, 4, 5, 6, 7, 8, 9  ; Array of numbers
.code

main proc
    ; Initialize data segment
    mov ax, @data               
    mov ds, ax

    call calculate_sum            ; Call to calculate the sum
    
    call calavg                   ; Call to calculate average 
    
    call print_result             ; Call to print the average result

    
    mov ah, 4Ch                 
    int 21h                     
main endp

calculate_sum proc
    mov cx, 10                   ; Set the loop counter to 10
    lea di, arrnum               
    mov bx, 0                    

loop_start:
    mov ax, [di]                 ; Load the current element into AX
    add bx, ax                   ; Add the element to BX (sum)
    add di, 2                    ; Move to the next element
    loop loop_start              

    ret
calculate_sum endp 

calavg proc
    mov ax, bx                   ; Move the sum into AX
    mov cx, 10                   ; Set divisor (10)
    div cx
    ret                          
    
    calavg endp

print_result proc
    add al, 48                  
    mov dl, al                  
    mov ah, 2                 
    int 21h                    
    ret
print_result endp

end main
