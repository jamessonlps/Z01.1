; Arquivo: Abs.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Copia o valor de RAM[1] para RAM[0] deixando o valor sempre positivo.

; Carrega RAM[1] em D
leaw $1, %A
movw (%A), %D
leaw $POSITIVO, %A
jge %D
nop
; O trecho abaixo é executado se %D for menor ou igual a zero
; Calcula o positivo em D
leaw $1, %A
movw (%A), %D
negw %D
; Salva o positivo em RAM[0]
leaw $0, %A
movw %D, (%A)
leaw $END, %A
jmp
nop
; Aqui é executado se for positivo
POSITIVO:
leaw $0, %A
movw %D, (%A)
END: