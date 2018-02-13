sub stretch(image As Any Ptr,images As Any Ptr,w as integer,h as integer,s1 as integer,s2 as integer)
dim c1 as integer
dim c2 as integer
dim c3 as integer
dim c4 as integer
 Asm
    jmp asm2

    asm2:
          mov esi,[image]
          mov eax,32
          clc
         add esi,eax
         mov edi,[images]
         clc
         add edi,eax
        
        mov ax,[w]
       
        cmp ax,0
        jnz asm5
        jmp asm4
        asm5:
     
        
        mov ax,[h]
        mov [c1],ax
        cmp ax,0
        jnz asm3
        jmp asm4
        asm3:
        mov ebx,esi
       
         for1:
         
         mov dx,[s2]
     mov [c2],dx
        for2:
        mov esi,ebx
        mov dx,[w]
        mov [c3],dx
      for3:
      
      mov ax,[esi]
      mov dx,[s1]
      mov [c4],dx
      for4:
     
      mov [edi],ax
      inc edi
      inc edi
      mov dx,[c4]
      dec dx
      mov [c4],dx
      cmp dx,0
      jnz for4
      inc esi
      inc esi
      mov dx,[c3]
      dec dx
      mov [c3],dx
      cmp dx,0
      jnz for3
      mov dx,[c2]
      dec dx
      mov [c2],dx
      cmp dx,0
      jnz for2
      mov ebx,esi
      
           mov dx,[c1]
      dec dx
      mov [c1],dx
      cmp dx,0
      jnz for1
      
        asm4:
        
    End Asm

End sub

ScreenRes 640, 480, 16

Dim image As Any Ptr = ImageCreate( 64, 64, RGB(0,0,0) )
Dim images As Any Ptr = ImageCreate( 64*3, 64*3, RGB(255,0,0) )
cls
Dim w as integer=64
dim h as integer=64
dim s1 as integer=3
dim s2 as integer=3

line (0,0)-(640,480),rgb(255,255,255),bf

line (0,0)-(63,63),rgb(0,0,0),b
line (0,0)-(63,63),rgb(0,0,0)
line (0,63)-(63,0),rgb(0,0,0)
get (0,0)-(63,63),image

stretch image ,images,w,h,s1,s2
Put (0,160), images, PSet

'' Destroy the image.
ImageDestroy image
ImageDestroy images
sleep
