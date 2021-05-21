; Arquivo: Max.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares 
; Data: 27/03/2017
; Log :
;     - Rafael Corsi portado para Z01
;
; Calcula R2 = max(R0, R1)  (R0,R1,R2 se referem a  RAM[0],RAM[1],RAM[2])
; ou seja, o maior valor que estiver, ou em R0 ou R1 sera copiado para R2
; Estamos considerando número inteiros

; Guarda RAM[1] em D
leaw $1, %A
movw (%A), %D
; Calcula RAM[1] - RAM[0] e guarda em RAM[2]
leaw $0, %A
subw %D, (%A), %D
leaw $2, %A
movw %D, (%A)
; Se RAM[2] > 0 ==> RAM[1] > RAM[0]
leaw $POSITIVO, %A
jg %D
nop
; Aqui executa se RAM[2] < 0, ou seja, RAM[0] > RAM[1]
leaw $0, %A
movw (%A), %D
leaw $2, %A
movw %D, (%A)
leaw $END, %A
jmp
nop
; Aqui executa se RAM[2] > 0, ou seja, RAM[1] > RAM[0]
POSITIVO:
leaw $1, %A
movw (%A), %D
leaw $2, %A
movw %D, (%A)
END: