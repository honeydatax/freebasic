sub stretch(image As Any Ptr,images As Any Ptr,w as byte,h as byte,s1 as byte,s2 as byte)
dim c1 as byte
dim c2 as byte
dim c3 as byte
dim c4 as byte
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
        
        mov al,[w]
       
        cmp al,0
        jnz asm5
        jmp asm4
        asm5:
     
        
        mov al,[h]
        mov [c1],al
        cmp al,0
        jnz asm3
        jmp asm4
        asm3:
        mov ebx,esi
       
         for1:
         
         mov dl,[s2]
     mov [c2],dl
        for2:
        mov esi,ebx
        mov dl,[w]
        mov [c3],dl
      for3:
      
      mov ax,[esi]
      mov dl,[s1]
      mov [c4],dl
      for4:
     
      mov [edi],ax
      inc edi
      inc edi
      mov dl,[c4]
      dec dl
      mov [c4],dl
      cmp dl,0
      jnz for4
      inc esi
      inc esi
      mov dl,[c3]
      dec dl
      mov [c3],dl
      cmp dl,0
      jnz for3
      mov dl,[c2]
      dec dl
      mov [c2],dl
      cmp dl,0
      jnz for2
      mov ebx,esi
      
           mov dl,[c1]
      dec dl
      mov [c1],dl
      cmp dl,0
      jnz for1
      
        asm4:
        
    End Asm

End sub

ScreenRes 640, 480, 16

Dim image As Any Ptr = ImageCreate( 64, 64, RGB(0,0,0) )
Dim images As Any Ptr = ImageCreate( 64*3, 64*3, RGB(255,0,0) )
cls
Dim w as byte=64
dim h as byte=64
dim s1 as byte=3
dim s2 as byte=3

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
