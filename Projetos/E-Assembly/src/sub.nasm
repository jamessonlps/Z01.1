; Arquivo: Abs.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; faz uma subtracao binaria do valor de :  RAM[1] - RAM[0] gravando em RAM[2].

; Carrega RAM[1] em D
leaw $R1, %A
movw (%A), %D
; Faz subtração
leaw $R0, %A
subw %D, (%A), %D
; Grava em RAM[2]
leaw $R2, %A
movw %D, (%A)