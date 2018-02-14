sub cprint(c as byte)

 Asm
 mov bl,7
 mov cx,1
 mov bh,0
 mov al,[c]
 mov ah,&h0e
int &h10
        
    End Asm

End sub
dim a as string
dim b as byte
dim d as integer
a="im love marina" +chr$(13)+chr$(10)
for d=0 to len (a)
b=asc(mid$(a,d,1))
cprint b
next d



