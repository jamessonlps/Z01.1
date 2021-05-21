; ------------------------------------------------------------
; Arquivo: Mod.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017
;
; Calcula o resto da divisão (modulus) entre RAM[0] por RAM[1]
; e armazena o resultado na RAM[2].
;
; 4  % 3 = 1
; 10 % 7 = 3
; ------------------------------------------------------------

LOOPING:
; Calcula RAM[3] - RAM[0] e guarda em D
leaw $0, %A
movw (%A), %D
leaw $3, %A
subw %D, (%A), %D
; Se D < 0, pula; se não , executa logo em seguida
leaw $RESTO, %A
jl %D
nop
; Soma RAM[1] com RAM[3] e guarda em RAM[3]
leaw $3, %A
movw (%A), %D
leaw $1, %A
addw (%A), %D, %D
leaw $3, %A
movw %D, (%A)
leaw $LOOPING, %A
jmp
nop
; Aqui é executado quando RAM[3] - RAM[0] < 0
RESTO:
; Calcula RAM[3] - RAM[1] e guarda em D
leaw $3, %A
movw (%A), %D
leaw $1, %A
subw %D, (%A), %D
; Calcula RAM[0] - D
leaw $0, %A
subw (%A), %D, %D
; Salva em RAM[2]
leaw $2, %A
movw %D, (%A)