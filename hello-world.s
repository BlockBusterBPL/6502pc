PORTB = $6000
PORTA = $6001
DDRB = $6002
DDRA = $6003

E = %10000000
RW = %01000000
RS = %00100000
  
  .org $8000
  
reset:
  lda #%11111111
  sta DDRB

  lda #%11100000
  sta DDRA

  lda #%00111000
  sta PORTB
  jsr lcd_instruction
  lda #%00001110
  sta PORTB
  jsr lcd_instruction
  lda #%00000110
  sta PORTB
  jsr lcd_instruction

  lda #"H"
  jsr print_char

  lda #"e"
  jsr print_char

  lda #"l"
  jsr print_char

  lda #"l"
  jsr print_char

  lda #"o"
  jsr print_char

  lda #","
  jsr print_char

  lda #" "
  jsr print_char

  lda #"w"
  jsr print_char

  lda #"o"
  jsr print_char

  lda #"r"
  jsr print_char

  lda #"l"
  jsr print_char

  lda #"d"
  jsr print_char

  lda #"!"
  jsr print_char
  
loop: 
  jmp loop
 
lcd_instruction:
  lda #0
  sta PORTA
  lda #E
  sta PORTA
  lda #0
  sta PORTA
  rts

print_char:
  sta PORTB
  lda #RS
  sta PORTA
  lda #(RS | E)
  sta PORTA
  lda #RS
  sta PORTA
  rts

  .org $fffc
  .word reset
  .word $0000