; Arquivo: Abs.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Multiplica o valor de RAM[1] com RAM[0] salvando em RAM[3]

; Grava RAM[0] em D
leaw $0, %A
movw (%A), %D
LOOPING:
; Calcula RAM[0] - RAM[2] e guarda em D
leaw $2, %A
subw %D, (%A), %D
leaw $ZERO, %A
je %D
nop
; Se ainda não for 0, executa aqui
; Soma RAM[1] em RAM[3]
leaw $1, %A
movw (%A), %D
leaw $3, %A
addw (%A), %D, %D
movw %D, (%A)
; Soma 1 em RAM[2] (contador)
leaw $2, %A
movw (%A), %D
incw %D
movw %D, (%A)
; Grava RAM[0] em D
leaw $0, %A
movw (%A), %D
; Volta para o início do loop para verificar novamente a condição
leaw $LOOPING, %A
jmp
nop
; Quando zerar, operação terminou
ZERO: