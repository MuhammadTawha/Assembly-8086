.MODEL SMALL
.STACK 100H
.DATA
    originalString DB 'HELLO$', 0  ; Original string ends with '$'
    reversedString DB 6 DUP('$')   ; Placeholder for reversed string (5 chars + '$')
    msgOriginal DB 'Original String: $'
    msgReversed DB 0DH, 0AH, 'Reversed String: $'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX              ; Initialize data segment

    ; Print the original string
    LEA DX, msgOriginal
    MOV AH, 09H
    INT 21H
    LEA DX, originalString
    MOV AH, 09H
    INT 21H

    ; Reverse the string using stack
    LEA SI, originalString  ; Point SI to the original string
    MOV CX, 0               ; Initialize counter

    ; Find string length (excluding '$')
FIND_LENGTH:
    MOV AL, [SI]            ; Load a byte from original string
    CMP AL, '$'             ; Check for end of string
    JE REVERSE_STRING       ; If end, go to reverse logic
    INC CX                  ; Increment counter for length
    INC SI                  ; Move to next character
    JMP FIND_LENGTH         ; Loop back until end of string is found

REVERSE_STRING:
    DEC SI                  ; Point to the last valid character
    MOV DI, OFFSET reversedString ; Set DI to reversed string

PUSH_POP_LOOP:
    MOV AL, [SI]            ; Load character from original string
    MOV [DI], AL            ; Store it in reversed string
    DEC SI                  ; Move to previous character
    INC DI                  ; Move to next position in reversed string
    LOOP PUSH_POP_LOOP      ; Repeat until the string is reversed

    ; Null-terminate the reversed string
    MOV BYTE PTR [DI], '$'  ; Add string terminator

    ; Print the reversed string
    LEA DX, msgReversed
    MOV AH, 09H
    INT 21H
    LEA DX, reversedString
    MOV AH, 09H
    INT 21H

    ; Exit the program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
