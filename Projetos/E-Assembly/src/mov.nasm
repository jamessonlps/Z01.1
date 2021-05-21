; Elementos de Sistemas : 2018a
; Rafael Corsi
; Hardware : Z0.1
;
; Data :
;    - Dez 2018
; Descrição :
;    - Movimentação de dados da memoria RAM
;
; RAM[0] = RAM[1]
; RAM[1] = RAM[0]
; RAM[3] = 1

; -----------------------
; RAM[0] = RAM[1]
; -----------------------
; Guarda RAM[1] em D
leaw $1, %A
movw (%A), %D
; Move RAM[1] para RAM[2]
leaw $2, %A
movw %D, (%A)
; Move RAM[0] para RAM[1]
leaw $0, %A
movw (%A), %D
leaw $1, %A
movw %D, (%A)
; Move RAM[1] para RAM[0] usando RAM[2]
leaw $2, %A
movw (%A), %D
leaw $0, %A
movw %D, (%A)

; -----------------------
; RAM[3] = 1
; -----------------------
leaw $1, %A
movw %A, %D
leaw $3, %A
movw %D, (%A)