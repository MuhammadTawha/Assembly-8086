.model small
.stack 100h
.data
    var1 db " The number is even $"  
    var2 db " The number is odd $"    
    var3 db "ENTER NUMBER TO FIND $"  
.code
main proc
    
    mov ax, @data     
    mov ds, ax        

  
    lea dx, var3   
    mov ah, 9      
    int 21h          

    ; Get the input from the user
    mov ah, 1         
    int 21h                  
    
    mov cl, 2         ; Load divisor (2) into CL

    ; Perform division (AL contains the number, CL is the divisor)
    div cl            ; Divide AL by CL (AL / 2), quotient in AL, remainder in AH

    ; Check if the remainder (AH) is 0 (even number)
    cmp ah, 0         ; Compare remainder in AH with 0

    je label          ; If zero (even), jump to 'label' to print even message

    ; display the odd number message
    lea dx, var2     
    mov ah, 9        
    int 21h          
    jmp exit         

label:
   
    lea dx, var1      
    mov ah, 9         
    int 21h           

   exit:
    mov ah, 4Ch       
    int 21h           


main endp
end main
