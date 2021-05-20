; Arquivo: Abs.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017
; Adicione o valor de RAM[1] com RAM[0] gravando em RAM[2].

; Carrega RAM[1] em D
leaw $R1, %A
movw (%A), %D
; Faz adição
leaw $R0, %A
addw %D, (%A), %D
; Grava em RAM[2]
leaw $R2, %A
movw %D, (%A)