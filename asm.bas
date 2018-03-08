sub picFill(ByVal colors as byte,byval address As Any Ptr,byval size as long)
          Asm                
                    mov ebx,[address]
                    mov eax,32
                    add ebx,eax
                    mov ecx,[size]
                                    
                    mov al,[colors]
                                    
                    asm1:                
                              mov [ebx],al
                              inc ebx                
                              dec ecx                
                              jnz asm1                
                                              
                                              
                    End Asm                
          End sub                
                          
          ScreenRes 640, 480, 16
                          
          Dim image As Any Ptr = ImageCreate( 64, 64, RGB(0,0,0) )
          cls                
          Dim c as byte =255
          dim size as long = 64*64*2
                          
          picFill c,image ,size
          Put (8, 8), image, PSet
          line (7,7)-(7+65,7+65),rgb(0,0,255),b
          '' Destroy the image.
          ImageDestroy image
          sleep                
