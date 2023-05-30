org 0x100

_MAX_LEN equ 100 ; maksimal panjang 100 angka

start:
mov ax,cs
mov ds,ax

; Memperlihatkan kata "Masukkan angka yang akan dicek..."
mov ah,9
mov dx,sMasukanString
int 0x21

; User memasukan string
mov dx,sPalindrom
mov ah,0xa
int 0x21

mov cl,byte [len] ; panjang string yang dimasukan adalah loop counter
mov di,buf ; buffer masuk ke string
mov si,di
add di,cx ; membalikan string
dec di
checkpali:

mov al,byte [si]
mov ah,byte [di]

cmp ah,al ; membandingkan apakah string yang dibalikkan sama atau tidak
jne BukanPalindrom ; kalau tidak sama => "Bukan Palindrom
inc si ; forward satu string
dec di ; backward
loop checkpali

mov ah,9
mov dx,sPalindromKetemu
int 0x21

quit:
mov ah,0x4c
int 0x21

BukanPalindrom:
mov ah,9
mov dx,sBukanPalindrom
int 0x21
jmp quit

SECTION .data

sMasukanString db 'Masukan Text yang akan dicek:$'
sPalindromKetemu db 13,10,'Palindrom$'
sBukanPalindrom db 13,10,'Bukan Palindrom!$'
sPalindrom db _MAX_LEN ; max length of input string
len: db 0 ; length of input string
buf: db(_MAX_LEN)