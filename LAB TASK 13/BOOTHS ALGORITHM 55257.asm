
INCLUDE Irvine32.inc

.data
multiplicand DWORD 1011          ; Example: 11 
multiplier   DWORD 0111           ; Example: 7 
result       DWORD ?           ; Final result

.code
main PROC
    
    MOV EAX, 0                 ; A = 0 (upper part of the result)
    MOV EBX, multiplier        ; Load multiplier into EBX (Q)
    MOV ECX, 32                ; Set iteration count for 32 bits
    MOV ESI, multiplicand      ; Load multiplicand into ESI (M)
    MOV EDX, 0                 ; Q-1 = 0 (initialize as 0)

booth_loop:
    ; 
    MOV DL, BL                 ; Extract Q_0 (least significant bit of Q)
    AND DL, 1                  ; Isolate Q_0
    SHL DL, 1                  ; Shift left for Q_1 space
    OR DL, (EDX AND 1)         ; Combine Q_0 and Q_1

    CMP DL, 1                  ; Check if Q_0 Q_1 = 01
    JE add_multiplicand        ; If 01, perform A = A + M

    CMP DL, 2                  ; Check if Q_0 Q_1 = 10
    JE subtract_multiplicand   ; If 10, perform A = A - M

    JMP arithmetic_shift       ; For 00 or 11, proceed to shift

add_multiplicand:
    ADD EAX, ESI               ; A = A + M
    JMP arithmetic_shift

subtract_multiplicand:
    SUB EAX, ESI               ; A = A - M

arithmetic_shift:
    
    SHR EBX, 1                 ; Logical shift Q right by 1
    RCR EAX, 1                 ; Arithmetic shift A and the carry into Q
    MOV DL, BL                 ; Update Q-1 with shifted-out Q0 (LSB of Q)

    DEC ECX                    ; Decrement counter
    JNZ booth_loop             ; Repeat until count reaches 0

    ; Store the result
    MOV result, EAX

    ; Display the result
    MOV EAX, result
    CALL WriteBin
    CALL Crlf

    EXIT
main ENDP
END main
